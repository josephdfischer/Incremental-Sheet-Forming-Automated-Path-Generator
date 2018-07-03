function command = Array_to_Command(path)
%% DECOUPLE HANDLES


%% MAIN FUNCTION
fly_point = logical(zeros(length(path),1));
    for i = 2:length(path)-1
        %%% Locally store next 3 points
        x1 = round(path(i-1,1),3);
        y1 = round(path(i-1,2),3);
        z1 = round(path(i-1,3),3);

        x2 = round(path(i,1),3);
        y2 = round(path(i,2),3);
        z2 = round(path(i,3),3);

        x3 = round(path(i+1,1),3);
        y3 = round(path(i+1,2),3);
        z3 = round(path(i+1,3),3);
        
        u = [ x2-x1 y2-y1 z2-z1 ];
        v = [ x3-x2 y3-y2 z3-z2 ]; 
        
        theta(i) = atan2d(norm(cross(u,v)),dot(u,v));
        
        if theta(i) < 80
            fly_point(i,1) = logical(1);
            
        end
        theta = theta';

    end
    fly_point(end,1) = logical(0);
    
    %%% Assign matrix to array of robtargets (command)
    command = robtarget.empty(length(path),0);
    for i = 1:length(path)
        command(i,1).name = ['p',num2str(i)];
        command(i,1).x = path(i,1);
        command(i,1).y = path(i,2);
        command(i,1).z = path(i,3);
        if fly_point(i)
            command(i,1).zone = 'z0';
        end
    end
    
%% RECOUPLE PARAMETERS
    
end
