
% Do not change the name of this file or class

classdef Gasket < handle
    
    properties
        d_gasket;
        d_hole;
    end
    
    methods
        function SetSize(obj,diameter_gasket,diameter_hole)

            % enter your code for the SetSize method here
            test1=isreal(sqrt(diameter_gasket));
            test2=isreal(sqrt(diameter_hole));

            if  (test1==1&&test2==1) %% if both inputs are +ve
                                     
                obj.d_gasket = diameter_gasket; %% store inputted values
                obj.d_hole = diameter_hole;

            else  
                error('ERR_NEG')   %% if either are -ve

            end
         end
        
        function area = CalculateArea(obj)
             % enter your code for the CalculateArea method here

               array=[obj.d_gasket,obj.d_hole]
               test3=isempty(array)
               

           if (test3==true)  %% if both inputs are not empty
                  error('ERR_EMPTY')
            
              
              
           else %% if both are not empty
                   area = pi/4*((obj.d_gasket^2)-(obj.d_hole^2))
           end


        end

        
        function area= CalculateRatio(obj)
            %enter your code for the CalculateRatio method here

             array=[obj.d_gasket,obj.d_hole]
               test3=isempty(array)
                 
             if (test3==true)  %% if both inputs are not empty
                  error('ERR_EMPTY')
            
           else %% if both are not empty
                   area = obj.d_hole/obj.d_gasket
           end
           
        end
    
    end
end

