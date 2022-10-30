function [points1, points2] = NN_match(feature1, extrema1, feature2, extrema2)

    s1 = size(feature1,2);
    s2 = size(feature2,2);
    distanceMatrix = zeros(s1, s2);
    points1 = zeros(s1,2);
    points2 = zeros(s2,2);
    m = 256;
    n = 256;

    
    X1 = floor((extrema1(3:4:end)-1)./(n./(2.^(extrema1(1:4:end)-2))))+1;
    Y1 = mod((extrema1(3:4:end)-1),m./(2.^(extrema1(1:4:end)-2)))+1;

    X2 = floor((extrema2(3:4:end)-1)./(n./(2.^(extrema2(1:4:end)-2))))+1;
    Y2 = mod((extrema2(3:4:end)-1),m./(2.^(extrema2(1:4:end)-2)))+1;

    
    for i=1:s1
        x = feature1(:,i);
        for j=1:s2
            y = feature2(:,j);
            distanceMatrix(i,j) = norm(x-y);
        end
    end

    for i=1:s1
        min = distanceMatrix(i,1);
        indexOfMin = 1;
        
        for j = 1:s2
            
            if distanceMatrix(i,j) < min
                min = distanceMatrix(i,j);
                indexOfMin = j;
            end
            
        end
       
        secMin = distanceMatrix(i,1);
        
        for j = 1:s2
            
            if distanceMatrix(i,j) < secMin && j ~= indexOfMin
                secMin = distanceMatrix(i,j);
            end
            
        end
        
        ratio = min / secMin;
        if ratio<0.95
            points1(i,1) = X1(i);
            points1(i,2) = Y1(i);
            
            points2(i,1) = X2(indexOfMin);
            points2(i,2) = Y2(indexOfMin);
            
        end
        
    end
    
end
    
            