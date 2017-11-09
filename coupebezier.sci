function [xQ,yQ] = CoupeBezier(x,y)
 // initilisation fenêtre graphique
    clf()
    plot2d(0,0,rect=[0 0 3 3])
    xgrid(1)
    
    // tracer pts de controle
    plot(x,y,'-b');
    plot(x,y,'or');

    xQ = x, yQ = y;
    plot(xQ,yQ,'-g');
    plot(xQ,yQ,'og');
    
    // Trace la courbe de Bezier des pts de controle x,y
    t = [0:0.02:1]
    [X,Y] = CourbeBezier(x,y,t);
    plot(X,Y,'-b');
    E=gce(); E.children.thickness=2
    
    // Couper la courbe de bézier
    // calculer x1, y1 et x2, y2
    N = length(x)
    P=[x,y]
    Q = DeCasteljau2(P,t0)
    Q1 = Q(1:N,:)
    x1 = Q1((:,1)
    y1 = Q1((:,2)
    
    Q2 = Q(N+1:2*N,i)
    x2 = Q2((:,1)
    y2 = Q2((:,2)
    //Tracer les nouveaux morceaux
    // 1ere courbe
    plot(x1,y1,'-r')
    plot(x1,y1,'-*r')
   
    // Tracer la nouvelle courbe de Bezier
    t = [0:0.02:1]
    [X, Y] = CourbeBezier(x1,y1,t)
    plot(X,Y,'-r')
   
    //Tracer les nouveaux morceaux
    // 1ere courbe
    plot(x2,y2,'-g')
    plot(x2,y2,'-*g')
    [X, Y] = CourbeBezier(x2,y2,t)
    plot(X,Y,'-g')
endfunction
