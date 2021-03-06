function interPoint = findLineIntersectionPoint(line1Deltas, line1Point, line2Deltas, line2Point)
% interPoint = findLineIntersectionPoint(line1Deltas, line1Point, line2Deltas, line2Point)

numDims = length(line1Deltas);

if numDims ~= length(line2Deltas)
    error('Dimension mismatch between lines');
else
    if numDims == 1
        error('Infinite number of solutions for line intercept');
    else
        if all(line1Deltas == 0)
            interPoint = line1Point;
        elseif all(line2Deltas == 0)
            interPoint = line2Point;
        else
            % need non-zero line deltas to find intercept
            
            [~,line1NonZeroDeltaDim] = max(abs(line1Deltas));
            
            [~,line2NonZeroDeltaDim] = max(abs(line2Deltas));
            
            if line1NonZeroDeltaDim == line2NonZeroDeltaDim
                % find a different dimension
                tempDeltas = line2Deltas;
                tempDeltas(line2NonZeroDeltaDim) = [];
                [~,line2NonZeroDeltaDim] = max(abs(tempDeltas));
            end
            
            
            if isempty(line1NonZeroDeltaDim) || isempty(line2NonZeroDeltaDim)
                error('Non-intersecting set of lines');
            else
                a = line1NonZeroDeltaDim;
                b = line2NonZeroDeltaDim;
                
                term1 = (1 - ((line1Deltas(b)*line2Deltas(a))/(line1Deltas(a)*line2Deltas(b))));
                term2 = (1 / line2Deltas(b));
                term3 = ((line1Deltas(b)/line1Deltas(a))*(line2Point(a)-line1Point(a))) + (line1Point(b) - line2Point(b));
                
                line2T = (1/term1)*term2*term3;
                
                line1T = (line2T*line2Deltas(line1NonZeroDeltaDim)+line2Point(line1NonZeroDeltaDim)-line1Point(line1NonZeroDeltaDim)) / line1Deltas(line1NonZeroDeltaDim);
                
                interPoint1 = line1Deltas * line1T + line1Point;
                interPoint2 = line2Deltas * line2T + line2Point;
                
                diff = abs(interPoint2 - interPoint1);
                
                if max(diff) > 1e-10
                    error('Non-intersecting set of lines');
                else
                    interPoint = interPoint1;
                end
            end
        end
    end
        
end


end

