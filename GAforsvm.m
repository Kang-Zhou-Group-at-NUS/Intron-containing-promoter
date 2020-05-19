clear
rng default  % For reproducibility
global Tb1;
global Tb2;
% read training data for SVM model
load('data.mat');
varnames = {'V1'; 'V2'; 'V3'; 'V4'; 'V5';'V6';'V7';'results'};
Tb1 = array2table(training8_data);
Tb1.Properties.VariableNames = varnames;
% read test data for SVM model
Tb2 = array2table(testing8_data);
Tb2.Properties.VariableNames = varnames;


% set low and up boundary for parameters
lb = [-0.011453 -0.0021757 -0.16286];
%ub = [10 10 5];
ub = [1000 1000 100];
fun = @GAforsvm_fitness
%x = ga(fun,3,[],[],[],[],lb,ub)
opts = optimoptions('ga','PlotFcn',@gaplotbestf,'PopulationSize',400,'MaxGenerations',2000);
x = ga(fun,3,[],[],[],[],lb,ub,[],[],opts)
output = fun



% ub = [10 10 5]   x=[9.1423    2.0733    0.0384]  r2=0.2388
% ub = [1000 1000 100]  x=[2.5460    0.8391    0.0752]    r2=0.2390
% rbf ub = [1000 1000 100]  x=[742.2864    0.9607    0.0679]   r2=0.3832
% compare r2=0.396851 on the same dataset



