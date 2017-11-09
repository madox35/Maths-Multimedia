function Q = DeCasteljau2(P,t)
    n = size(P,1)-1
    b = P
    Q=[P(1,:);P($,:)]
    for k=1:n
        b = (1-t).*b(1:$-1,:)+t.*b(2:$,:)
        Q=[b(1,:);b($,:)]
    end
    plot(Q(:,1),Q(:,2),'*r');
endfunction
