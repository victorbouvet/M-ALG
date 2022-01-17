A=[1,-2,3,1;2,5,-1,3;4,1,0,2;0,-2,3,1]

A(:,3)
A(4,:)

det(A)
trace(A)

y=[1;2;-1;3];
x=A\y

M=A.*A'
[P,D]=eig(M)

if P'==inv(P)
    dot('la matrice de passage est bien orthogonale')
end