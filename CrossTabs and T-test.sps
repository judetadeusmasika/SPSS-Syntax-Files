
/* CROSSTABS ANALYSIS-CHI SQUARE TEST

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=TAR_VOP BY RACE_ETHNICITY
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL
  /BARCHART.



CROSSTABS
  /TABLES=TAR_VOP BY YOUTHGENDER
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL
  /BARCHART.



CROSSTABS
  /TABLES=RACE_ETHNICITY BY YOUTHGENDER
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL
  /BARCHART.



CROSSTABS
  /TABLES=TAR_VOP BY FEL
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL
  /BARCHART.

/* INDEPENDENT SAMPLES T-TEST

T-TEST GROUPS=TAR_VOP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=TOTAL_DYNAMIC
  /CRITERIA=CI(.95).



T-TEST GROUPS=YOUTHGENDER(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=TOTAL_DYNAMIC
  /CRITERIA=CI(.95).



T-TEST GROUPS=RACE_ETHNICITY(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=TOTAL_DYNAMIC
  /CRITERIA=CI(.95).