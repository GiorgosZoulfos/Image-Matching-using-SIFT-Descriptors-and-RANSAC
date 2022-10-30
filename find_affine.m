function A = find_affine(Points1, Points2)

    X = [Points1(1,1) Points1(1,2) Points1(1,3) 0 0 0;
         0 0 0 Points1(1,1) Points1(1,2) Points1(1,3);
         Points1(2,1) Points1(2,2) Points1(2,3) 0 0 0;
         0 0 0 Points1(2,1) Points1(2,2) Points1(2,3);
         Points1(3,1) Points1(3,2) Points1(3,3) 0 0 0;
         0 0 0 Points1(3,1) Points1(3,2) Points1(3,3)];
     
    

    b = [Points2(1,1) Points2(1,2) Points2(2,1) Points2(2,2) Points2(3,1) Points2(3,2)]';

    tempA = X\b;
    A = [tempA(1:3)'; tempA(4:6)'; 0 0 1];

end
    
  


 