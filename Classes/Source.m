classdef Source
    % Source
    % This class contains all the data pertaining to an x-ray source for the CT
    % simulator. While point sources are oftened used, a source of
    % arbitrary size can be specified, where each "sub-source" is modelled
    % as a point source
    % 
    % FIELDS:
    % *location:
    % the location where the centre of the source will begin for a
    % simulated scan. The source is assumed to be symmetrical around its
    % centre
    % units are in m
    %
    % *dimensions: 
    % the dimensions of the source, that can be given in planar (flat)
    % or angular (curved) dimensions. Dimensions of [0,0] give a point
    % source
    % units are in m
    %
    % *beamAngle:
    % the angle of the source beam (fan or cone angle). This is NOT a half
    % angle, but rather the full angle from one side to other
        
    
    
    properties
        location
        locationUnits = Units.m
        
        dimensions
        
        beamAngle
        beamAngleUnits = Units.degree
        
        savePath
        saveFileName
    end
    
    methods
        function source = Source(location, dimensions, beamAngle)
            if nargin > 0
                % validate source parameters and fill in blanks if needed
                
                % validate location
                locationNumDims = length(location);
                
                if locationNumDims < 2 || locationNumDims > 3
                    error('Location of source not given in 2 or 3 space');
                elseif locationNumDims == 2
                    % tack on z = 0 for completeness
                    
                    location = [location, 0];
                end
                
                % validate dimensions
                dimensionsNumDims = length(dimensions);
                
                if dimensionsNumDims < 1 || dimensionsNumDims > 2
                    error('Dimensions not given in 1 or 2 space');
                elseif dimensionsNumDims == 1
                    % take on depth = 0 for completeness
                    
                    value = 0;
                    isPlanar = true;
                    
                    dimensions = [dimensions, Dimension(value, isPlanar)];
                end
                
                % beamAngle
                angleNumDims = length(beamAngle);
                
                if angleNumDims < 1 || angleNumDims > 2
                    error('Beam angle not given in 1 or 2 space');
                elseif angleNumDims == 1
                    % take on depth beam angle = 0 for completeness
                    
                    beamAngle = [beamAngle, 0];
                end
                
                % if we get here, we're good to go, so lets assign the fields
                source.location = location;
                source.dimensions = dimensions;
                source.beamAngle = beamAngle;
            end
        end
        
        function locationInM = getLocationInM(source)
            units = source.locationUnits;
            
            locationInM = units.convertToM(source.location);
        end
        
        function [] = plot(source, axesHandle)
            dimensions = source.dimensions;
            
            if dimensions(1).value == 0 && dimensions(2).value == 0 % point source
                locationInM = source.locationUnits.convertToM(source.location);
                
                x = locationInM(1);
                y = locationInM(2);
                z = locationInM(3);
                
                edgeColour = Constants.Source_Colour;
                faceColour = Constants.Source_Colour;
                lineStyle = [];
                lineWidth = [];
                
                circleOrArcPatch(...
                    x,y,z, Constants.Point_Source_Radius, 0, 360,...
                    edgeColour, faceColour, lineStyle, lineWidth);
                
                xyBeamAngle = source.beamAngle(1);
                zBeamAngle = source.beamAngle(2);
                
                xyChordLength = findBeamChordLength([x,y], xyBeamAngle);
                
                diameter = 2 * norm([x,y]);
                ang = zBeamAngle / 2;
                
                zChordLength = tand(ang) * diameter;
                
                [theta,~] = cart2pol(-x,-y); % get angle for a 'pencil beam'
                
                theta = theta * Constants.rad_to_deg;
                
                xyAngle1 = theta - xyBeamAngle/2;
                xyAngle2 = theta + xyBeamAngle/2;
                
                zAngle1 = - zBeamAngle/2;
                zAngle2 = zBeamAngle/2;
                
                rotationOrigin = [x,y,0];
                
                aboutY = [0,1,0];
                aboutZ = [0,0,1]; %about z-axis
                
                line_x = [x, x + norm([xyChordLength, zChordLength])];
                line_y = [y, y];
                line_z = [z, z];
                
                line1 = line(line_x, line_y, line_z, 'Parent', axesHandle, 'Color', Constants.Source_Colour);
                line2 = line(line_x, line_y, line_z, 'Parent', axesHandle, 'Color', Constants.Source_Colour);
                line3 = line(line_x, line_y, line_z, 'Parent', axesHandle, 'Color', Constants.Source_Colour);
                line4 = line(line_x, line_y, line_z, 'Parent', axesHandle, 'Color', Constants.Source_Colour);
                
                line_x = [x, x + 2*norm(source.location)];
                
                midline = line(line_x, line_y, line_z, 'Parent', axesHandle, 'Color', Constants.Source_Colour, 'LineStyle', '--');
                
                % first rotate lines 1 - 4 around Y
                rotate(line1, aboutY, zAngle1, rotationOrigin);
                rotate(line2, aboutY, zAngle1, rotationOrigin);
                rotate(line3, aboutY, zAngle2, rotationOrigin);
                rotate(line4, aboutY, zAngle2, rotationOrigin);
                
                rotate(line1, aboutZ, xyAngle1, rotationOrigin);
                rotate(line2, aboutZ, xyAngle2, rotationOrigin);
                rotate(line3, aboutZ, xyAngle1, rotationOrigin);
                rotate(line4, aboutZ, xyAngle2, rotationOrigin);
                
                rotate(midline, aboutZ, theta, rotationOrigin);
                
                % plot circle of source path during gantry rotation
                x1 = 0;
                y1 = 0;
                z1 = z;
                r = norm([x,y]);
                edgeColour = Constants.Source_Colour;
                faceColour = [];
                lineStyle = ':';
                lineWidth = [];
                
                circleOrArcPatch(x1, y1, z1, r, 0, 360, edgeColour, faceColour, lineStyle, lineWidth);
                
                x2 = 0;
                y2 = 0;
                z2 = z - zChordLength;
                
                circleOrArcPatch(x2, y2, z2, r, 0, 360, edgeColour, faceColour, lineStyle, lineWidth);
                
                x3 = 0;
                y3 = 0;
                z3 = z + zChordLength;
                
                circleOrArcPatch(x3, y3, z3, r, 0, 360, edgeColour, faceColour, lineStyle, lineWidth);
            else
                error('Undefined behaviour');
            end
        end
        
        function handles = setGUI(source, handles)
            x = source.location(1);
            y = source.location(2);
            z = source.location(3);
            
            setDoubleForHandle(handles.sourceStartingLocationXEdit, x);
            setDoubleForHandle(handles.sourceStartingLocationYEdit, y);
            setDoubleForHandle(handles.sourceStartingLocationZEdit, z);
            
            xy = source.dimensions(1).value;
            z = source.dimensions(2).value;
            
            xyUnits = source.dimensions(1).units;
            zUnits = source.dimensions(2).units;
            
            setDoubleForHandle(handles.sourceDimensionsXYEdit, xy);
            setDoubleForHandle(handles.sourceDimensionsZEdit, z);
            
            setSelectionForPopupMenu(handles.sourceDimensionsXYUnitsPopupMenu, 'Units', xyUnits);
            setSelectionForPopupMenu(handles.sourceDimensionsZUnitsPopupMenu, 'Units', zUnits);
            
            xy = source.beamAngle(1);
            z = source.beamAngle(2);
            
            setDoubleForHandle(handles.sourceBeamAngleXYEdit, xy);
            setDoubleForHandle(handles.sourceBeamAngleZEdit, z);
                        
            if isempty(source.saveFileName)
                setString(handles.sourceFileNameText, 'Not Saved');
            else
                setString(handles.sourceFileNameText, source.saveFileName);
            end
            
            % set hidden handles
            handles.sourceSavePath = source.savePath;
            handles.sourceSaveFileName = source.saveFileName;
        end
        
        function source = createFromGUI(source, handles)
            x = getDoubleFromHandle(handles.sourceStartingLocationXEdit);
            y = getDoubleFromHandle(handles.sourceStartingLocationYEdit);
            z = getDoubleFromHandle(handles.sourceStartingLocationZEdit);
            
            source.location = [x,y,z];
            
            xy = getDoubleFromHandle(handles.sourceDimensionsXYEdit);
            z = getDoubleFromHandle(handles.sourceDimensionsZEdit);
            
            xyUnits = getSelectionFromPopupMenu(handles.sourceDimensionsXYUnitsPopupMenu, 'Units');
            zUnits = getSelectionFromPopupMenu(handles.sourceDimensionsZUnitsPopupMenu, 'Units');
            
            xyDimension = Dimension(xy, xyUnits);
            zDimension = Dimension(z, zUnits);
            
            source.dimensions = [xyDimension, zDimension];
            
            xy = getDoubleFromHandle(handles.sourceBeamAngleXYEdit);
            z = getDoubleFromHandle(handles.sourceBeamAngleZEdit);
            
            source.beamAngle = [xy, z];
            
            
            source.savePath = handles.sourceSavePath;
            source.saveFileName = handles.sourceSaveFileName;
        end
        
        function [sourcePosition, directionUnitVector] = getSourcePosition(source, slicePosition, angle, perAngleXY, perAngleZ)
            startingLocation = source.getLocationInM();
            
            z = slicePosition + perAngleZ;
            dirZ = 0;
            
            [theta, radius] = cart2pol(startingLocation(1), startingLocation(2));
            theta = theta * Constants.rad_to_deg;
            
            sourceAngle = theta - angle; % we minus the angle because we define angles to be clockwise, but in coords it is counter-clockwise
            
            [x,y] = pol2cart(sourceAngle * Constants.deg_to_rad, radius);
            
            perAngleX = sind(sourceAngle) * perAngleXY;
            perAngleY = cosd(sourceAngle) * perAngleXY;
            
            x = x + perAngleX;
            y = y + perAngleY;
            
            dirX = -cosd(sourceAngle);
            dirY = -sind(sourceAngle);
            
            sourcePosition = [x, y, z];
            directionUnitVector = [dirX, dirY, dirZ];
        end
        
    end
    
end


function chordLength = findBeamChordLength(location, beamAngle)
    theta = beamAngle / 2;
        
    r = norm(location);
    
    chordLength = sind(180-2*theta)*(r / sind(theta));
end