function walks = approximate_LE (U, T, N, Ni, approx_type)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%given Loewner driving function U with N+1 points in [0,1]
%
%
%
%Suppose we know U[1..N+1] = ..., i.e. U[step]=lambda(step-1/N);
%N: number of small interval
%Ni: number of refined points on each slit,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%computing alpha, xl, xr
%%G(z)=(z+xl)^(1-alpha)*(z-xr)^alpha
tilted=1;
vertical=2;
alpha=zeros(1,N);
xr=zeros(1,N);
xl=zeros(1,N);
dU=U(2:N+1)-U(1:N);
dt=T(2:N+1)-T(1:N);


switch approx_type
    case vertical 
        walks=zeros(1,1+N);
        for step=1:N
            z=0;
            for jstep=step:-1:1
                z=vertical_slit_cmap(dU(jstep),dt(jstep),z);
            end
            walks(step+1)=z;
        end
    case tilted
        walks=zeros(1,1+Ni*N);
        for step=1:N
            dUstep=dU(step);
            dtstep=dt(step);
            % G(z)=(z+2sqrt((1-alpha)/N*alpha))^(1-alpha)
            % *(z-2sqrt(alpha/N*(1-alpha))^alpha; 
            % dt = 1/N
            alp=0.5-0.5*dUstep/sqrt(16*dtstep+dUstep*dUstep);
            alpha(step)=alp;
            xl(step)=2*sqrt(dtstep*(1-alp)/alp);
            xr(step)=2*sqrt(dtstep*alp/(1-alp));
           
        end
        for step=1:N
            z=tilted_slit_cmap(alpha(step),xl(step),xr(step),0);
            zslit=((1/Ni):(1/Ni):1)*z;
            for jstep=step-1:-1:1
                for kstep=1:Ni
                    zslit(kstep)=tilted_slit_cmap(alpha(jstep),xl(jstep),xr(jstep),zslit(kstep));
                end
            end
            walks( (2+(step-1)*Ni):(1+step*Ni) )=zslit;
        end
end

walks=walks+U(1); %translating