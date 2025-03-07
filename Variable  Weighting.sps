
COMPUTE WeightFactor = Weight.

IF (QB = 2) WeightFactor = 43.5. 
IF (QB = 1) WeightFactor = 45.7.  
IF (QB = 3) WeightFactor = 11.8. 
IF (QB = 4) WeightFactor = 11.8.  

IF (CB = 1) WeightFactor = 45.7.  
IF (CB = 2) WeightFactor = 43.7.  
IF (CB = 3) WeightFactor = 11.8.  
IF (CB = 4) WeightFactor = 11.8.  

IF (QK_3_Cath_Prot_Oth = 1) WeightFactor = 45.7.  
IF (QK_3_Cath_Prot_Oth = 2) WeightFactor = 43.5.  
IF (QK_3_Cath_Prot_Oth = 3) WeightFactor = 11.8.  


IF (QC2B = 16) WeightFactor = 18.2.
IF (QC2B = 15) WeightFactor = 5.6.
IF (QC2B = 18) WeightFactor = 7.
IF (QC2B = 17) WeightFactor = 4.7.
IF (QC2B = 12) WeightFactor = 13.4.
IF (QC2B = 11) WeightFactor = 8.4.
IF (QC2B = 13) WeightFactor = 42.7.
IF (QC2B = 14) WeightFactor = 42.7.
IF (QC2B = 19) WeightFactor = 42.7.
IF (QC2B = 20) WeightFactor = 42.7.
IF (QC2B = 21) WeightFactor = 42.7.
IF (QC2B = 22) WeightFactor = 42.7.


IF (QC3B = 16) WeightFactor = 18.2.
IF (QC3B = 15) WeightFactor = 5.6.
IF (QC3B = 18) WeightFactor = 7.
IF (QC3B = 17) WeightFactor = 4.7.
IF (QC3B = 12) WeightFactor = 13.4.
IF (QC3B = 11) WeightFactor = 8.4.
IF (QC3B = 13) WeightFactor = 42.7.
IF (QC3B = 14) WeightFactor = 42.7.
IF (QC3B = 19) WeightFactor = 42.7.
IF (QC3B = 20) WeightFactor = 42.7.
IF (QC3B = 21) WeightFactor = 42.7.
IF (QC3B = 22) WeightFactor = 42.7.
IF (QC3B = 23) WeightFactor = 42.7.
IF (QC3B = 24) WeightFactor = 42.7.


EXECUTE.


* Assign weights for Voting categories.

 * COMPUTE WeightFactor = Weight.

 * IF (QC2B = "Sinn Féin") WeightFactor = 18.2.
 * IF (QC2B = "Social Democratic and Labour Party (SDLP)") WeightFactor = 5.6.
 * IF (QC2B = "Ulster Unionist Party (UUP)") WeightFactor = 7.
 * IF (QC2B = "Traditional Unionist Voice (TUV)") WeightFactor = 4.7.
 * IF (QC2B = "Democratic Unionist Party (DUP)") WeightFactor = 13.4.
 * IF (QC2B = "Alliance Party") WeightFactor = 8.4.
 * IF (QC2B = "Green Party") WeightFactor = 42.7.
 * IF (QC2B = "People Before Profit") WeightFactor = 42.7.
 * IF (QC2B = "Aontú") WeightFactor = 42.7.
 * IF (QC2B = "Independent") WeightFactor = 42.7.
 * IF (QC2B = "Other") WeightFactor = 42.7.
 * IF (QC2B = "Can’t recall") WeightFactor = 42.7.

 * EXECUTE.

DATASET ACTIVATE DataSet1.
WEIGHT BY WeightFactor.
