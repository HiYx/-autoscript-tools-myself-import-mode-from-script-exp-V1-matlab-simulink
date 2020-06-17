function add_line_from_slx
% @yanyx 2020-0617
sys = 'Test617';
new_system(sys) % 创建模型
open_system(sys) % 打开模型

%% New Block
% [50 100+i*50 80 115+i*50])
x = 250;
y = 100;
w = 200;
h = 3000;
offset = 60;
pos = [x y x+w y+h];

% way 1
% Source1Name='/fcn1';
% add_block('simulink/User-Defined Functions/MATLAB Function',[sys Source1Name],'Position',pos);

% way 2
libraryBlockPath = 'simulink/User-Defined Functions/MATLAB Function';
newBlockPath = 'Test617/myBlockName';
add_block(libraryBlockPath, newBlockPath,'Position',pos);
blockHandle = find(slroot, '-isa', 'Stateflow.EMChart', 'Path', newBlockPath);
blockHandle.Script = fileread('myAdd.m');

%% try
try
getFileName=ls(strcat(pwd,'\interfaceG.xlsx'));
FileNum = size(getFileName);
catch
    warning('file wrong');
end

%% Create options for importing spreadsheet data
opts = spreadsheetImportOptions("NumVariables", 5);
opts.Sheet = 1; % choice the sheet number
opts.DataRange = "A:E"; 
% config the data Types or format
opts.VariableNames = ["No", "ModuleInterface","I_O","Description","Data_type"];
opts.VariableTypes = ["string", "string", "string", "string", "string"];
% config rules
opts = setvaropts(opts, [1, 2, 3, 4, 5], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3, 4, 5], "EmptyFieldRule", "auto");% @yanyx :No Found This Meanthod
%% process
% config 
    % UseExcel:  false -  Does not open an instance of Microsoft Excel to read the file.
    % This is the default setting.
    % @yanyx Debug : when set "false" ,can not load "sheet2"
    % This setting may cause the data to be written differently for files with live updates (e.g. formula evaluation or plugins).
jainputoutput = readtable(getFileName, opts, "UseExcel", true);    
% Table2array
input = table2array(jainputoutput);
% Release Variable
clear  opts

%% config Sheet = 2;
opts = spreadsheetImportOptions("Sheet",2,"NumVariables", 5);
opts.DataRange = "A:E";  
opts.VariableNames = ["No", "ModuleInterface","I_O","Description","Data_type"];
opts.VariableTypes = ["string", "string", "string", "string", "string"];
opts = setvaropts(opts, [1, 2, 3, 4, 5], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3, 4, 5], "EmptyFieldRule", "auto");
jainputoutputS1 = readtable(getFileName, opts, "UseExcel", true);
output = table2array(jainputoutputS1);
clear  opts

%% Get
in_excel_num = length(input);
out_excel_num = length(output);

%% Main process
inport_num = 0;
for i=2:in_excel_num
   if ~isequal(input(i,2),'')
        add_block('simulink/Commonly Used Blocks/In1',strcat(sys,'/',input{i,2}),'Position',[50 100+i*50 80 115+i*50]);
        inport_num = inport_num+1;
        %% try
        try
          add_line(sys,strcat(input{i,2},'/1'),['myBlockName/' num2str(i-1)],'autorouting','on');  
        %add_line(sys,'SDFFve_y_LANE_DETECT_ACTIV/1','L2FusionInYyx/1','autorouting','on');
        catch
            warning('here you are');
        end
    end
end
fprintf('Your SWC have[%d ] inport\n',inport_num);

% outport_num = 40; % this is my port start Num
% for i=2:out_excel_num
%     if ~isequal(output(i,2),'')
%         add_block('simulink/Commonly Used Blocks/Out1',strcat(module_name,'/',output{i,2}),'Position',[1550 100+i*50 1580 115+i*50]);
%         outport_num = outport_num+1;
%     end
% end
% fprintf('Your SWC have[%d ] outport\n',outport_num);
% fprintf('You need create a function-call subsystem by manual \n fucntion-call \n');
