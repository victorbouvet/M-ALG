clear all;

% construction des matrices A et B (SANS BOUCLE FOR NI WHILE)
A=diag([1,2,3,4])+diag([3,3,3],1)+diag([-2,-2,-2],-1);
B=2*ones(3,4);
% concaténation des matrices A et B
M=[A;B];
% décomposition en valeurs singulières de M
[U,S,V]=svd(M);
% reconstruction de la matrice M
M2=zeros(7,4);
for i=1:rank(M)
    M2=M2+(S(i,i)*U(:,i)*V(:,i)'); %i-ème vecteur colonne de V transposée en ligne
end

M2