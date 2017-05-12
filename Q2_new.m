% Part a 
clc;clear all;
No_Samples = 10000; Number_Random_Variables = 3; Constant = 15; 
Random_Variable_Vector = 4*ones(1,Number_Random_Variables);
Common_Mean=1;
% Gibbs Sampler Algorithm
for Iteration_Var1 = 1 : No_Samples 
    Random_Variable_Index = ceil(Number_Random_Variables*rand);
    S = sum(Random_Variable_Vector) - Random_Variable_Index*Random_Variable_Vector(Random_Variable_Index);
    Random_Variable_Vector(Random_Variable_Index) = max(Constant-S,0)-log(rand)/Common_Mean;
    Sum_Random_Variable(Iteration_Var1) = S + Random_Variable_Vector(Random_Variable_Index);
end
disp('The mean and the standard deviation of the estimate is =');
disp([mean(Sum_Random_Variable) 2*std(Sum_Random_Variable)/sqrt(No_Samples)]);
% Part b
No_Samples = 10000;Number_Random_Variables = 3; Constant = 1; 
Random_Variable_Vector = 4*ones(1,Number_Random_Variables);
Common_Mean=1;
% Gibbs Sampler Algorithm
for Iteration_Var1 = 1 : No_Samples 
    Random_Variable_Index = ceil(Number_Random_Variables*rand);
    S = sum(Random_Variable_Vector) - Random_Variable_Index*Random_Variable_Vector(Random_Variable_Index);
    Random_Variable_Vector(Random_Variable_Index) = log(rand)/Common_Mean- max(Constant-S,0);
    Sum_Random_Variable(Iteration_Var1) = S + Random_Variable_Vector(Random_Variable_Index);
end
disp('The mean and the standard deviation of the estimate is =');
disp([mean(Sum_Random_Variable) 2*std(Sum_Random_Variable)/sqrt(No_Samples)]);