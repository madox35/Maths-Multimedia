function [x,y] = TracerPolygone()
    clf()
    plot2d(0,0,rect=[0 0 3 3])
    xgrid(1)
    ibutton = 0
    while ibutton<>5
        [ibutton, xcoord, ycoord] = xclick()
        x($+1)=xcoord
        y($+1)=ycoord
        plot(x,y,'-o')
    end
endfunction
