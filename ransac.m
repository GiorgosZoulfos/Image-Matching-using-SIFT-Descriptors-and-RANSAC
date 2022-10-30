function [bestA, indexesOfInliers] = ransac(points1, points2)

    outlierRatio = 0.9;
    p = 0.99;
    numOfIter = round(log10(1-p)/log10(1-(1-outlierRatio)^3))
    bestA = [];
    bestInliers = 0;

    for i=1:numOfIter
        
        size = length(points1);
        randIndexes = randperm(size, 3);
        inliers = 0;
        indexes = zeros(size, 1);
        
        aff1 = [points1(randIndexes(1),1) points1(randIndexes(1),2) 1;
                points1(randIndexes(2),1) points1(randIndexes(2),2) 1;
                points1(randIndexes(3),1) points1(randIndexes(3),2) 1];
            
        aff2 = [points2(randIndexes(1),1) points2(randIndexes(1),2) 1;
                points2(randIndexes(2),1) points2(randIndexes(2),2) 1;
                points2(randIndexes(3),1) points2(randIndexes(3),2) 1];
            
        A = find_affine(aff1, aff2);
        
        for j=1:size
            
            newP1 = A*[points1(j,1) points1(j,2) 1]';
            dist = find_distance(newP1, points2(j,:));
            
            if dist == 1   
                inliers = inliers + 1;   
                indexes(j) = 1;
            end
            
        end
        
        if inliers > bestInliers 
            bestInliers = inliers;
            bestA = A;
            indexesOfInliers = indexes;
            
        end
        
    end
    
end
            
            
        
        
        
    
    



