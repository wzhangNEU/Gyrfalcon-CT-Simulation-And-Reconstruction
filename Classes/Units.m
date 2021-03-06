classdef Units
    % Units
    % contains units for pop-up menus
    
    properties
        displayString
        isAngular
    end
    
    enumeration
        mm ('mm', false)
        m ('m', false)
        
        degree ('�', true)
        radian ('rad', true)
    end
    
    methods(Static)
        function [] = setDropDown(handle)
            [rawItemData,~] = enumeration('Units');
            
            numItems = length(rawItemData);
            
            items = cell(1, numItems);
            itemsData = cell(1, numItems);
            
            for i=1:numItems
                items{i} = rawItemData(i).displayString;
                itemsData{i} = rawItemData(i);
            end
            
            handle.Items = items;
            handle.ItemsData = itemsData;
        end
    end
    
    methods
        function obj = Units(displayString, isAngular)
            obj.displayString = displayString;
            obj.isAngular = isAngular;
        end
        
        function valueInM = convertToM(units, value)
            if units.isAngular
                error('Invalid units!');
            else
                switch units
                    case Units.m
                        valueInM = value;
                    case Units.mm
                        valueInM = value * Constants.mm_to_m;
                    otherwise
                        error('Invalid units!');
                end
            end
        end
        
        function valueInToUnits = convertFromM(toUnits, valueInM)
            if toUnits.isAngular
                error('Invalid units!');
            else
                switch toUnits
                    case Units.m
                        valueInToUnits = valueInM;
                    case Units.mm
                        valueInToUnits = valueInM / Constants.mm_to_m;
                    otherwise
                        error('Invalid units!');
                end
            end
        end
        
        function valueInDegrees = convertToDegrees(units, value)
            if ~units.isAngular
                error('Invalid Units');
            else
                switch units
                    case Units.degree
                        valueInDegrees = value;
                    case Units.radian
                        valueInDegrees = value * Constants.rad_to_deg;
                    otherwise
                        error('Invalid units!');
                end
            end
        end
        
        function valueInToUnits = convertFromDegrees(toUnits, valueInDegrees)
            if ~toUnits.isAngular
                error('Invalid units!');
            else
                switch toUnits
                    case Units.degree
                        valueInToUnits = valueInDegrees;
                    case Units.radian
                        valueInToUnits = valueInDegrees * Constants.deg_to_rad;
                    otherwise
                        error('Invalid units!');
                end
            end
        end
        
    end
    
end

