clear;

load('fle.mat');
load('fri.mat');

[p1, p2] = NN_match(feature1, extrema1, feature2, extrema2);

p1 = p1(p1>0);
p1 = reshape(p1,[length(p1)/2, 2]);

p2 = p2(p2>0);
p2 = reshape(p2,[length(p2)/2, 2]);

[A, inliers] = ransac(p1, p2);
A
B = [];
for i=1:length(inliers)
    if inliers(i) == 1
        B = [B; p1(i,:) p2(i,:)];
    end
end

im1=rgb2gray(imread('le.jpg'));
im1=imresize(im1,[512,512]);

im2 = rgb2gray(imread('ri.jpg'));
im2 = imresize(im2,[512,512]);

im = [im1 im2];
imshow(im)
hold on
% for i=1:size(p1,1)
%     rx = p1(i,1);
%     ry = p1(i,2);
%     plot(ry,rx,'g+')
%     rx2 = p2(i,1);
%     ry2 = p2(i,2)+512;
%     plot(ry2, rx2, 'g+')
%     plot([ry ry2],[rx rx2],'b')
% end
for i=1:size(B,1)
    rx = B(i,1);
    ry = B(i,2);
    plot(ry,rx,'g+')
    rx2 = B(i,3);
    ry2 = B(i,4)+512;
    plot(ry2, rx2, 'g+')
    plot([ry ry2],[rx rx2],'b')
end
        