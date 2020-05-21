function main

% fold introns %% function get_intronstruc
load('intronseq.mat');
load('promoterlib.mat');

for k=1:9
    name=promoterlib(k).No(1);
    pstrength=promoterlib(k).pstrength;
    for i=1:length(intronstruc)
        feature=[];
        % get intron features
        [feature]=retrieve_info8(intronstruc(i).intron,intronstruc(i).fold, pstrength);
    
        % predict
        [accuracy,dec_values]=svm8_prediction(feature);
    
        % list results
        record{i,1}=intronstruc(i).name;
        record{i,2}=intronstruc(i).intron;
        record{i,3}=intronstruc(i).fold;
        record{i,4}=feature;
        record{i,5}=dec_values;
    end
    % each character represent respective promoter
    xlswrite(name,record);
end

end

