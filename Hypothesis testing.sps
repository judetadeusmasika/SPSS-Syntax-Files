
DATASET ACTIVATE DataSet1.
COMPUTE NPI_Total=MEAN(NPI_1 +  NPI_2  + NPI_3  + NPI_4  + NPI_5  + NPI_6  + NPI_7  + NPI_8  
    + NPI_9  + NPI_10  + NPI_11  + NPI_12  + NPI_13  + NPI_14  + NPI_15 + NPI_16 + NPI_17 + NPI_18 + 
    NPI_19 + NPI_20 + NPI_21 + NPI_22 + NPI_23 + NPI_24 + NPI_25 + NPI_26 + NPI_27 + NPI_28 + NPI_29 + 
    NPI_30 + NPI_31 + NPI_32 + NPI_33 + NPI_34 + NPI_35 + NPI_36 + NPI_37 + NPI_38 + NPI_39 + NPI_40).
EXECUTE.


COMPUTE BAS_Total = MEAN(Blame_1_1 + Blame_2_1 + Blame_3_1 + Blame_4_1 + Blame_5_1 + Blame_6_1 
    + Blame_7_1 + Blame_8_1 + Blame_9_1 + Blame_10_1).
EXECUTE.

/* H1a: Examine the relationship between narcissistic traits and blame attribution.

CORRELATIONS
  /VARIABLES=NPI_Total BAS_Total
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

DATASET ACTIVATE DataSet1.
COMPUTE TIPI_E_6_R=8-Ten_Item_Personality_6.
EXECUTE.

COMPUTE TIPI_A_2_R=8-Ten_Item_Personality_2.
EXECUTE.

COMPUTE TIPI_C_4_R=8-Ten_Item_Personality_4.
EXECUTE.

COMPUTE TIPI_ES_8_R=8-Ten_Item_Personality_8.
EXECUTE.

COMPUTE TIPI_OPP_10_R=8-Ten_Item_Personality_10.
EXECUTE.

COMPUTE TIPI_Extraversion=(Ten_Item_Personality_1 + TIPI_E_6_R)/2.
EXECUTE.

COMPUTE TIPI_Agreeableness=(Ten_Item_Personality_7+ TIPI_A_2_R)/2.
EXECUTE.

COMPUTE TIPI_Conscientiousness=(Ten_Item_Personality_9+ TIPI_C_4_R)/2.
EXECUTE.

COMPUTE TIPI_Emotional=(Ten_Item_Personality_10+ TIPI_ES_8_R)/2.
EXECUTE.

COMPUTE TIPI_Openness=(Ten_Item_Personality_5+ TIPI_OPP_10_R)/2.
EXECUTE.

COMPUTE BFI_Extraversion=(BFI_1_6 + BFI_1_8 + BFI_E_6_R)/2.
EXECUTE.

COMPUTE BFI_Agreeableness=(BFI_2_2 + BFI_A_2_R + BFI_2_7)/2.
EXECUTE.

COMPUTE BFI_Conscientiousness=(BFI_3_8 + BFI_C_8_R + BFI_3_1)/2.
EXECUTE.

COMPUTE BFI_Neuroticism=(BFI_4_8 + BFI_ES_9_R + BFI_4_4)/2.
EXECUTE.

COMPUTE BFI_Openness=(BFI_5_10 +BFI_5_6 + BFI_O_15_R)/2.
EXECUTE.

COMPUTE Ethnicity_Total=Ethnicity_1 + Ethnicity_2 + Ethnicity_3 + Ethnicity_4 + Ethnicity_5 + 
    Ethnicity_6.
EXECUTE.

/*H1b: Assess the predictive value of the Big Five personality dimensions on blame attribution.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BAS_Total
  /METHOD=ENTER NPI_Total TIPI_Extraversion TIPI_Agreeableness TIPI_Conscientiousness TIPI_Emotional TIPI_Openness BFI_Extraversion BFI_Agreeableness BFI_Conscientiousness 
    BFI_Neuroticism BFI_Openness
  /SCATTERPLOT=(BAS_Total ,*SDRESID)
  /RESIDUALS DURBIN HISTOGRAM(ZRESID).

/*H2A1: Openness to Experience is negatively associated with blame attribution

CORRELATIONS
  /VARIABLES=TIPI_Openness BFI_Openness BAS_Total
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BAS_Total
  /METHOD=ENTER TIPI_Extraversion TIPI_Agreeableness TIPI_Conscientiousness TIPI_Emotional 
    TIPI_Openness
  /SCATTERPLOT=(BAS_Total ,*SDRESID)
  /RESIDUALS DURBIN HISTOGRAM(ZRESID).

/*H2A2): Conscientiousness is positively associated with blame attribution

CORRELATIONS
  /VARIABLES=BAS_Total TIPI_Conscientiousness BFI_Conscientiousness
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/*H2A3): Extraversion is negatively associated with blame attribution

CORRELATIONS
  /VARIABLES=BAS_Total TIPI_Extraversion BFI_Extraversion
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/*H2A4: Agreeableness is negatively associated with blame attribution

CORRELATIONS
  /VARIABLES=BAS_Total TIPI_Agreeableness BFI_Agreeableness
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* H2A5: Neuroticism is positively associated with blame attribution
CORRELATIONS
  /VARIABLES=BAS_Total TIPI_Emotional BFI_Neuroticism
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
/*H3: Compare blame attribution scores across cultural backgrounds

ONEWAY BAS_Total BY Cultural_Background
  /MISSING ANALYSIS.
