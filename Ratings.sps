
DATASET ACTIVATE DataSet0.
CORRELATIONS
  /VARIABLES=FamilySupport BehaviourProblems
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT BehaviourProblems
  /METHOD=ENTER FamilySupport
  /RESIDUALS HISTOGRAM(ZRESID).

GRAPH
  /SCATTERPLOT(BIVAR)=FamilySupport WITH BehaviourProblems
  /MISSING=LISTWISE
  /TITLE='A scatterplot of the relationship between child behaviour problems and family support'.
