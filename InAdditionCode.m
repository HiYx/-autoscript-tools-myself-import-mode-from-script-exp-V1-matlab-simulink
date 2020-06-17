%% Add some usage
% @yanyx 0617

%%   Create a ``From Workspace`` named ``testmyself``

sys = 'Testcase1';
x = 300;
y = 30;
w = 30;
h = 30;
pos = [x y x+w y+h];
Source1Name='/fcn1';
add_block('simulink/Sources/From Workspace',[sys Source1Name],'Position',pos,'VariableName','testmyself');
