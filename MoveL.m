function output_string=MoveL(robtarget,speed,zone,tool,wobj)
            if isstring(robtarget)
                robtarget_data=robtarget;
            else
                %Convert Robtarget numeric values to string values
                xstr=num2str(robtarget.x);
                ystr=num2str(robtarget.y);
                zstr=num2str(robtarget.z);
                q1str=num2str(robtarget.q1);
                q2str=num2str(robtarget.q2);
                q3str=num2str(robtarget.q3);
                q4str=num2str(robtarget.q4);
                cf1str=num2str(robtarget.cf1);
                cf2str=num2str(robtarget.cf2);
                cf3str=num2str(robtarget.cf3);
                cfxstr=num2str(robtarget.cfx);
                eax_astr=robtarget.eax_a;
                eax_bstr=robtarget.eax_b;
                eax_cstr=robtarget.eax_c;
                eax_dstr=robtarget.eax_d;
                eax_estr=robtarget.eax_e;
                eax_fstr=robtarget.eax_f;

                %Coordinates
                coordinates=sprintf('[[%1$s,%2$s,%3$s],',xstr,ystr,zstr);
                %Orientation
                orientation=sprintf('[%1$s,%2$s,%3$s,%4$s],',q1str,q2str,q3str,q4str);
                %Configuration
                configuration=sprintf('[%1$s,%2$s,%3$s,%4$s],',cf1str,cf2str,cf3str,cfxstr);
                %External Axis
                external_axis=sprintf('[%1$s,%2$s,%3$s,%4$s,%5$s,%6$s]]',eax_astr,eax_astr,eax_bstr,eax_cstr,eax_dstr,eax_estr,eax_fstr);

                robtarget_data=strcat(coordinates,orientation,configuration,external_axis);
                %fprintf(output_string);
            end
            
            if nargin == 1
                %If NO motion control settings are passed into the function
                %(i.e. only a robtarget or string is passsed), then the
                %motion control settings will be taken from the robtarget.
                speed=robtarget.speed;
                zone=robtarget.zone;
                wobj=robtarget.wobj;
                tool=robtarget.tool;  
            end

            %Speed
            speed=num2str(speed);
            speed_data=sprintf(',[%1$s,500,5000,1000]',speed);
            %Motion Control
            motion_control=sprintf('%1$s,%2$s,%3$s%4$s%5$s;',speed_data,zone,tool,'\WObj:=',wobj);

            output_string=strcat("MoveL ",robtarget_data,motion_control);
            %fprintf(output_string);
end