%This class is used to emulate the pos/orientation class in an ABB robot.
classdef robtarget
    properties
        name=""
        layer=""
        %POSITION
        x=0
        y=0
        z=0
        %TOOL ORIENTATION
        %This default is created for the standard ISF Tool orientation
        q1=0.7071068
        q2=0
        q3=0
        q4=-0.7071068
        %CONFIGURATION
        %This default is created for the standard ISF Tool configuration
        cf1=0
        cf2=-1
        cf3=0
        cfx=0
        %EXTERNAL AXIS
        eax_a="9E+09"
        eax_b="9E+09"
        eax_c="9E+09"
        eax_d="9E+09"
        eax_e="9E+09"
        eax_f="9E+09"
        
        %COMMON MOTION CONTROL
        speed=42.5;
        zone="fine";
        wobj="wobj_ISF1";
        tool="tool_ISF2fs";
        
    end
    methods
    end
end