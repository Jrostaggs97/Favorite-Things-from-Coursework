
% load the image
I = imread("cameraman.tif");
% convert image to double precision
A = im2double(I);


%what rank approximation do you want?
rank= 50;
low_rank_approx(rank,A)

function [approx_pic] = low_rank_approx(approx_rank,matrix)

% perform SVD for the matrix A such that A = U*S*V’
[U,S,V] = svd(matrix);

%initialize sum
sum =0;

    %grab column of u
    for i =1:approx_rank
       u_column = U(:,i);

    %grab column of v and conjugate transpose
       v_star_row = transpose(conj(V(:,i))); 

    %grab singular value 
        singular_value = S(i,i);

    %multiply and sum
        sum = sum+ singular_value*(u_column*v_star_row);
    end
    
approx = sum;

approx_pic = imshow(approx); title("rank-"+approx_rank+" Image")

end

