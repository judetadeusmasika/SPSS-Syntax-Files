DATASET ACTIVATE DataSet1.

*** Data Quality analysis

FREQUENCIES VARIABLES=gender employer enjoy interest fair
  /ORDER=ANALYSIS.


DESCRIPTIVES VARIABLES=wage
  /STATISTICS=MEAN STDDEV MIN MAX.


EXAMINE VARIABLES=wage
  /PLOT NONE
  /STATISTICS DESCRIPTIVES EXTREME
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

*** Gender and Job Enjoyment (Chi-Square Test for Independence)

CROSSTABS
  /TABLES=gender BY enjoy
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.

*** Interest and Job Enjoyment (Spearman’s Rank Correlation)

NONPAR CORR
  /VARIABLES=enjoy interest
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

*** Gender and Wage (Independent Samples t-Test)

T-TEST GROUPS=gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=wage
  /CRITERIA=CI(.95).
