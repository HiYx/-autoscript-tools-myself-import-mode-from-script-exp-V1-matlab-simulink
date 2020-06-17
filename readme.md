# 从matlab脚本中自动导入simulink模型

仓库命名隶属于：  autoscript-tools-myself-import-mode-from-script-exp-V1-matlab-simulink

- 以编程方式将代码添加到 MATLAB Function 模块
- 以编程方式导入in/out 模块
- 以编程方式进行模块之间连线

# 使用方法
直接运行 ``onlyadd_line_from_slx`` 可以实现如result.png 的效果

目前的脚本是：

1、将外部myAdd.m导入模型中

2、读取外部的接口文件，将接口名in导入模型

3、 接口与function接起来


# 参考：
https://ww2.mathworks.cn/help/simulink/ug/creating-an-example-model-that-uses-a-matlab-function-block.html
https://ww2.mathworks.cn/help/simulink/slref/add_block.html

# Automatically import Simulink model from matlab script

project title: autoscript-tools-myself-import-mode-from-script-exp-V1-matlab-simulink

- Add code to MATLAB Function block programmatically
- mport in/out modules programmatically
- Add line between the modules automatically

# Instructions
Run ``onlyadd_line_from_slx'' directly to achieve the effect such as result.png

# Reference:
https://ww2.mathworks.cn/help/simulink/ug/creating-an-example-model-that-uses-a-matlab-function-block.html
https://ww2.mathworks.cn/help/simulink/slref/add_block.html
