function b=DeCasteljau(C,t)
    n =size(C,1)-1;
    b = C;
    for k=1:n
        b = (1-t).*b(1:$-1,:)+t.*b(2:$,:);
    end
endfunction

function CourbeBezierDeCasteljau(x,y)
    b=[];
    for t=0:0.02:1
        b = [b; DeCasteljau([x,y],t)]
    end
    plot(b(:,1), b(:,2), '-r');
endfunction


function TracerDeCasteljau()
    [x,y] = TracerPolygone();
    CourbeBezierDeCasteljau(x,y);
endfunction
  
