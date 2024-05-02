


DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=Age MSLQ#1 MSLQ#2 MSLQ#3 MSLQ#4 Grade
  /STATISTICS=MEAN STDDEV MIN MAX SEMEAN.

DESCRIPTIVES VARIABLES=Age
  /STATISTICS=MEAN STDDEV MIN MAX SEMEAN.


FREQUENCIES VARIABLES=Sex Classification
  /BARCHART FREQ
  /ORDER=ANALYSIS.

* Reverse code MSLQ #1.
COMPUTE MSLQ_Reverse_1 = 8 - MSLQ#1.
* Reverse code MSLQ #3.
COMPUTE MSLQ_Reverse_3 = 8 - MSLQ#3.
EXECUTE.

* Compute Cronbach's alpha for MSLQ subscale.
RELIABILITY
  /VARIABLES=MSLQ_Reverse_1 MSLQ_Reverse_3
  /SCALE('All Variables') ALL
  /MODEL=ALPHA.

COMPUTE EffortRegulationScore=(MSLQ_Reverse_1  + MSLQ_Reverse_3) / 2.
EXECUTE.

DESCRIPTIVES VARIABLES=EffortRegulationScore Grade
  /STATISTICS=MEAN STDDEV MIN MAX SEMEAN.

CORRELATIONS
  /VARIABLES=EffortRegulationScore Grade
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Grade
  /METHOD=ENTER EffortRegulationScore
  /PARTIALPLOT ALL.

GRAPH
  /SCATTERPLOT(BIVAR)=EffortRegulationScore WITH Grade
  /MISSING=LISTWISE
  /TITLE='A scatter plot showing the relationship between academic success and the effort '+
    'regulation score'
  /FOOTNOTE='A scatter plot'.


