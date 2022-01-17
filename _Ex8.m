clear variables;
close all;

% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5; % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées
[m,n]=size(F0);

% dimension du cadre d'affichage
L=200;
cadre=[-L,L,-L,L];

% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

question=2;

switch question
    case 1
        %translation
        u=[-80;60];
        F1=F0+u*ones(1,n);
        color1=[1,0,0];
        fill(F1(1,:),F1(2,:),color1);
        
        %symetrie
        N=[sqrt(2)/2;sqrt(2)/2];
        N=N/norm(N);
        I=eye(2);
        S=2*N*N'-I;
        F2=S*F1;
        color2=[0,1,0];
        fill(F2(1,:),F2(2,:),color2);
        max=[L,L];
        min=[-L,-L];
        plot([max(1) min(1)],[max(2) min(2)],'o--')
        
        %rotation
        angle=-2*pi/3;
        R=[cos(angle),-sin(angle);sin(angle),cos(angle)];
        F3=R*F2;
        color3=[0,0,1];
        fill(F3(1,:),F3(2,:),color3);
        t=0:0.01:2*pi;
        OG=[mean(F3(1,:)),mean(F3(2,:))];
        OG=norm(OG(1), OG(2));
        plot(OG*cos(t),OG*sin(t),'b--')
    case 2
        N=100;
        %translation
        u=[-80;60];
        F1=F0+u*ones(1,n);
        color1=[1,0,0];
        
        %symetrie
        for i=1:N
            u=-1+2*rand(2,1); %les feuilles sont sur un demi-cercle car le vecteur directeur de la droite est strict 
                         %positif est défini sur [0,1] en abscisse et [0,1] en
                         %ordonnée soit la portion en haut à droite et
                         %celle en bas à gauche
            u=u/norm(u);
            I=eye(2);
            S=2*u*u'-I;
            F2=S*F1;
            color2=rand(1,3);
            fill(F2(1,:),F2(2,:),color2);
        end
    case 3
        N=500;
        u=[-80;60];
        F1=F0+u*ones(1,n);
        
        for i=1:N
            %init
            angle=2*pi*rand(1);
            v=-L+2*L*rand(2,1);
            color3=[0.7*rand(1),0.7*rand(1),0];
            
            %translation
            F2=F1+v*ones(1,n);
            
            %rotation
            R=[cos(angle),-sin(angle);sin(angle),cos(angle)];
            F4=R*F2;
            
            %affichage            
            fill(F4(1,:),F4(2,:),color3);
        end
end