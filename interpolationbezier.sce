function [xQ,yQ]=InterpoleCourbeBezier(x,y)
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
    
    // Calculer les nouveaux pts de controle xQ, yQ
    N = length(x)
    
    xQ = x(1)
    yQ = y(1)
    for i=2:N
        t=1/N
        xQ(i) = t*x(i-1) + (1-t)*x(i)
        yQ(i) = t*y(i-1) + (1-t)*y(i)
    end
    xQ($+1) = x($)
    yQ($+1) = y($)
    
    plot(xQ,yQ,'-r');
    plot(xQ,yQ,'or');
endfunction
