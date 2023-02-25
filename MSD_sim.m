% Do not change the name of this file or class


classdef MSD_sim < handle

    properties 
        % enter your properties here 
        % (choose your own variable names)

        m; %mass
        c; %Damper coeff
        k; %spring const
        wn; %natural freq
        zeta;%damping factor 
        H; 
       
    end

    methods
        function SetMass(obj,mass)
            obj.m=abs(mass);
        end

        function SetDamper(obj,damper_coefficient)
            obj.c=abs(damper_coefficient);
        end

        function SetSpring(obj,spring_constant)
            obj.k=abs(spring_constant);
        end

        function wn= CalcNaturalFreq(obj)
            wn=(1/2*pi)*(sqrt(obj.k/obj.m));
            obj.wn=wn;
            
        end

        function zeta=CalcDampingFactor(obj)
                 zeta=obj.c/(2*sqrt(obj.k*obj.m));
                 obj.zeta=zeta;
        end

        function under=isUnderDamped(obj)
            if ((0<obj.zeta)&&(obj.zeta<1)) %% i.e if underdamped
               
                under=1;
                obj.H=under;

            else         
                under=0;
                obj.H=under;
            end
        end

        function newy=CalcUnitStepResponse(obj,t)

            a=exp(-obj.zeta*obj.wn.*t);
            b=sqrt(1-((obj.zeta)^2));
            phi=atan(b/(obj.zeta));
            d=obj.wn.*t;
            newy=obj.H*(1-((a/b)*(sin((b*d)+phi))));
        end

       
    end
end