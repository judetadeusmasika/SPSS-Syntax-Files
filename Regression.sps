
DATASET ACTIVATE DataSet1.
GRAPH
  /HISTOGRAM(NORMAL)=body_fat.

DESCRIPTIVES VARIABLES=body_fat neck hip chest thigh knee ankle bicep forearm wrist abdomen
  /STATISTICS=MEAN VARIANCE RANGE.



REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT body_fat
  /METHOD=ENTER neck hip chest thigh knee ankle bicep forearm wrist abdomen.



FACTOR
  /VARIABLES neck hip chest thigh knee ankle bicep forearm wrist abdomen
  /MISSING LISTWISE 
  /ANALYSIS neck hip chest thigh knee ankle bicep forearm wrist abdomen
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA FACTORS(3) ITERATE(6)
  /EXTRACTION PC
  /CRITERIA ITERATE(6)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.


CORRELATIONS
  /VARIABLES=body_fat neck hip chest thigh knee ankle bicep forearm wrist abdomen
  /PRINT=TWOTAIL SIG
  /MISSING=PAIRWISE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT body_fat
  /METHOD=ENTER hip chest bicep abdomen
  /CASEWISE PLOT(ZRESID) OUTLIERS(2)
  /SAVE COOK LEVER ZRESID SDBETA SDFIT COVRATIO.


EXAMINE VARIABLES=COO_1 COV_1 LEV_1 SDF_1 SDB0_1 SDB1_1 SDB2_1 SDB3_1 SDB4_1
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT body_fat
  /METHOD=ENTER hip chest bicep abdomen
  /SCATTERPLOT=(*ZPRED ,*SRESID)
  /RESIDUALS DURBIN
  /SAVE RESID.

T-TEST GROUPS=gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=body_fat
  /CRITERIA=CI(.95).

EXAMINE VARIABLES=RES_1
  /PLOT BOXPLOT NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.
