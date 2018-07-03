function Module_Output(path, directory)
    %Create File
    filename = 'form_path.mod';
   
    %Open File
    fileID = fopen(fullfile(directory,filename),'w');

    %Header
    Header=strings(6);
    Header(1)="%%%";
    Header(2)="VERSION:1";
    Header(3)="LANGUAGE:ENGLISH";
    Header(4)="%%%";
    
    for s=1:(length(Header)-2)
        fprintf(fileID,'%-s\n',Header(s));
    end
    
    %Module Declaration
    Module=strings(4);
    modulename=erase(filename,".mod");
    Module(1)=strcat("MODULE ",modulename);
    Module(2)="PROC path()";
    Module(3)="ENDPROC";
    Module(4)="ENDMODULE";
    
    command = Array_to_Command(path);
    
    fprintf(fileID,"\n%1$-s\n  %2$-s\n",Module(1),Module(2));
    for i = 1:length(command)
        %Output MoveL command to user file
        fprintf(fileID,'    %-s\n',MoveL(command(i)));
    end
        
    fprintf(fileID,"  %1$-s\n%2$-s",Module(3),Module(4));
    fclose(fileID);
    
end