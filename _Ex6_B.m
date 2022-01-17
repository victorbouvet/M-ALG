clear all;
close all;

file='einstein.jpg'

A=imread(file);

imshow(A);

[m,n]=size(A);

A=A(:,:,1);
A=double(A); %m*n*3 (3 car RGB)
[U,S,V]=svd(A);

tab=[5,40,100,200];

tau_tab=[]

for i=1:length(tab)
    Ak=0;
    for k=1:tab(i)
        Ak=Ak+S(k,k)*U(:,k)*V(:,k)';
    end
    subplot(2,2,i)
    imshow(uint8(Ak));
    [a,b]=size(Ak);
    tau = 1-(tab(i)+tab(i)*m+tab(i)*n)/(m*n); %tau = 1 - nbre de pixels transmis/nbre de pixels d'origine (U(:,k) a i valeurs mais m valeurs au total, idem pou V avec n)
    tau_tab=[tau_tab,tau]
end
