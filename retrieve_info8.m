function [feature]=retrieve_info8(seq,fold,pstrength)

% extract features
% nucleotide in DNA sequence
feature(1,1)=count(seq,'a')/length(seq);
feature(1,2)=count(seq,'g')/length(seq);
feature(1,3)=count(seq,'c')/length(seq);
feature(1,4)=count(seq,'t')/length(seq);
count0=0;
count1=0;

% fraction of intramolecular bond in mRNA
for j=1:length(fold)
        str=fold(j);
        if str~='.'
            count1=count1+1;
        else
            count0=count0+1;
            end
        end
    
feature(1,5)=count0/length(fold);
feature(1,6)=count1/length(fold);

% native promoter strength
feature(1,7)=pstrength;


end