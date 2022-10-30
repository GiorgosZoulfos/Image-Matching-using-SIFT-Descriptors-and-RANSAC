function d = find_distance(p1, p2)

    if abs(p1(1) - p2(1))<3 && abs(p1(2) - p2(2))<3
        d = 1;
    else 
        d = 0;
    end
    
end