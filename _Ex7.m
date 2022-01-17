clear variables;
close all;

figure(1);
hold on;

a=2;
b=-5;
c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;

[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;

C(:,:,1)=zeros(size(Z2)); % red
C(:,:,2)=0.8*ones(size(Z2)); % green
C(:,:,3)=0.8*ones(size(Z2)); % blue

mesh(X2,Y2,Z2,C);

%Question 2

n=10;
x=-2+4*rand(1,n);
y=-2+4*rand(1,n);
z=-8+14*rand(1,n);

plot3(x,y,z,'.black')
axis('equal')
axis([-3,3,-3,3,-8,8])

%Question 3

N=[a;b;c]/norm([a;b;c]); %vecteur normal au plan Z2=-(a*X2+b*Y2)/c; donc aX+bY+cZ=0

P=eye(3)-N*N'; %matrice de projection orthogonale

V=zeros(3,n); %initialisation matrice avec x 1ere ligne, y 2eme ligne, z 3eme ligne

U=[x;y;z];

% calcul des coordonnées des points projetés
for k=1:n
    V(:,k)=P*U(:,k);
end

% affichage des points projetés (étoiles)
plot3(V(1,:),V(2,:),V(3,:),'*r');

% on relie les points initiaux à leurs projections
for k=1:n
    plot3([x(k) V(1,k)], [y(k) V(2,k)], [z(k) V(3,k)],'k');
end

%Question 4

question=2;

switch question
    case 1
        delta=2;
        dV=-delta/2+delta*rand(3,n);
        W = V+dV;

        % affichage des points perturbés (triangles)
        plot3(W(1,:),W(2,:),W(3,:),'vk');

        %plan passant le plus près des points perturbés
        A=[W(1,:)',W(2,:)']; %aX+bY=-cZ
        v=[W(3,:)'];
        u=inv(A'*A)*A'*v;

        a3=u(1); %aX+bY=-cZ donc a va a la 1ere colonne et b a la 2eme de A
        b3=u(2);
        c3=-1; %on fixe une constante (n'importe laquelle)
        x3=-3:0.1:3;
        y3=-2.5:0.1:4;
        z3=-8:1:8;

        [X3,Y3]=meshgrid(x3,y3);
        Z3=-(a3*X3+b3*Y3)/c3;

        C(:,:,1)=ones(size(Z3)); % red
        C(:,:,2)=zeros(size(Z3)); % green
        C(:,:,3)=0.8*ones(size(Z3)); % blue

        mesh(X3,Y3,Z3,C);

        O=[a3;b3;c3]/norm([a3;b3;c3]); %vecteur normal au plan 

        angle=acos(N'*O);
        if angle>pi/2
            angle = pi-angle;
        end

        angle=angle*180/pi
    case 2
        tableau_angle=[];
        tableau_delta=[];
        for delta=0:0.01:50
            dV=-delta/2+delta*rand(3,n);
            W = V+dV;

            % affichage des points perturbés (triangles)
            plot3(W(1,:),W(2,:),W(3,:),'vk');

            %plan passant le plus près des points perturbés
            A=[W(1,:)',W(2,:)']; %aX+bY=-cZ
            v=[W(3,:)'];
            u=inv(A'*A)*A'*v;

            a3=u(1); %aX+bY=-cZ donc a va a la 1ere colonne et b a la 2eme de A
            b3=u(2);
            c3=-1; %on fixe une constante (n'importe laquelle)
            x3=-3:0.1:3;
            y3=-2.5:0.1:4;
            z3=-8:1:8;
            
            [X3,Y3]=meshgrid(x3,y3);
            Z3=-(a3*X3+b3*Y3)/c3;

            C(:,:,1)=rand()*ones(size(Z3)); % red
            C(:,:,2)=rand()*ones(size(Z3)); % green
            C(:,:,3)=rand()*ones(size(Z3)); % blue
            
            %mesh(X3,Y3,Z3,C);

            O=[a3;b3;c3]/norm([a3;b3;c3]); %vecteur normal au plan 

            angle=acos(N'*O);
            if angle>pi/2
                angle = pi-angle;
            end

            angle=angle*180/pi;
            tableau_angle=[tableau_angle,angle];
            tableau_delta=[ tableau_delta,delta];
        end
        figure(2)
        plot(tableau_delta,tableau_angle,'r*-');
        title('Evolution de l"angle avec une perturbation aléatoire');
        ylabel('angle en degrés');
        xlabel('perturbation');
end