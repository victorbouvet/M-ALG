clear all;

n=6;
A=diag(2*ones(1,n))+diag(-1*ones(1,n-1),1)+diag(-1*ones(1,n-1),-1);

[P,D]=eig(A);

esp=1e-5; %precision
delta = 1; %difference entre 2 valeurs propres consécutives
lambda0=1; %valeur propre initial
e0=rand(n,1); %vecteur propre initial
lambda_tab=[]; %tableau de stockage des valeurs consécutives
cpt=0; %compteur d'itérations

question=2;
switch question
    case 1
        while delta > esp
            e1=A*e0;
            lambda1=norm(e1)/norm(e0);
            delta = abs(lambda1 - lambda0)
            lambda_tab=[lambda_tab,lambda1];
            e0=e1/norm(e1);
            lambda0=lambda1;
            cpt=cpt+1
        end
        plot(1:1:length(lambda_tab),lambda_tab)
    case 2
        B=A
        P=zeros(n,n)
        D=zeros(n,n)
        for k=1:n
            if k>1
                B=B-(D(k-1,k-1)*e0*e0'/(e0'*e0));
            end
            delta = 1;
            lambda0=1;
            e0=rand(n,1);
            e0=e0/norm(e0);
            while delta > esp
                e1=B*e0;
                lambda1=norm(e1)/norm(e0);
                delta = abs(lambda1 - lambda0)
                e1=e1/norm(e1);
                e0=e1;
                lambda0=lambda1;
                cpt=cpt+1
            end
            D(k,k)=lambda0;
            P(:,k)=e0;
        end
        P
        D
        cpt
        A1=P*D*inv(P)
        diff = (1-norm(A-A1)/norm(A))*100
end