function Model_5_svr

% read data file
load('data.mat');

inst=[data(:,(1:7))];
result=[data(:,8)];

% set random number for picking training and testing datasets
rand('seed',1);
indices=randperm(72);
training_indices=indices(1:50);
testing_indices=indices(51:72);

% set training and testing datasets
for i=1:length(training_indices)
    training8_inst(i,:)=inst(training_indices(i),:);
    training8_result(i,:)=result(training_indices(i),:);
end

for i=1:length(testing_indices)
    testing8_inst(i,:)=inst(testing_indices(i),:);
    testing8_result(i,:)=result(testing_indices(i),:);
end

% using libsvm toolbox for svr training
model = svmtrain(training8_result,training8_inst,'-s 3 -t 2 -g 0.01 -c 21 -p 0.5');

[predict_label, accuracy, dec_values] = svmpredict(testing8_result,testing8_inst, model);
end
