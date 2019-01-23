function fz= vertical_slit_cmap(dx,dt,z)
% applies the conformal map z -> sqrt(z^2-4*dt)+dx
% z^2-4*dt = xx + yy*i

% the program is from Tom Kennedy's website

    x=real(z);
    y=imag(z);
    xx=x*x-y*y-4*dt;
    yy=2*y*x;

    % following solves for x,y in (x+y*i)^2=xx+yy*i
    % and y>0
    % So x^2-y^2=xx; 2*x*y=yy; Use second eq to eliminate one of x or
    % y in first eq, and then solve for other of x,y.
    % This is all to avoid polar coords and the very slow atan2() 
    disc = sqrt(xx*xx+yy*yy);
    x = sqrt((xx+disc)/2.);
    y = sqrt((-xx+disc)/2.);
    if (real(z)<0) 
        x = -x; 
    end
    fz = x + y*1i;
    fz = fz + dx;
% end vertical_slit_cmap()
