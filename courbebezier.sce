function C = CoefBinomial(n, i)
    // calcul coef binomial
    // C = (nx(n-1)x...x(n-i+1)/(i*())
    C = prod([n-i+1:n])/prod(1:i)
endfunction

function z = Bernstein(n,i,t)
    z = CoefBinomial(n,i)*(t.^i).*(1-t).^(n-i);
endfunction

function [X,Y] = CourbeBezier(x,y,t)
//    x,y = coords des pts de control
//    t = découpage de 0 à 1 (bcp de valeurs)
//    X,Y = coords des pts de la courbe de Bézier
    N = length(x)
    n = N-1
    X = zeros(t); Y=X;
    for k=1:N
        i = k-1
        z = Bernstein(n,i,t)
        X = X+z*x(k)
        Y = Y+z*y(k)  
    end
    plot(X,Y)
endfunction

function TracerCourberBezier()
    [x,y] = TracerPolygone();
    t = 0:0.02:1;
    [X,Y] = CourbeBezier(x,y,t);
    plot(X,Y,'-r','linewidth',2);
endfunction
