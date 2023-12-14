/* Descriptives of the labeled matrix 

DATASET ACTIVATE DataSet0.
DESCRIPTIVES VARIABLES=Aptitude Method Reading_Score
  /STATISTICS=MEAN.

/* Marginal Means

CROSSTABS
  /TABLES=Aptitude BY Method BY Reading_Score
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

/* Line Graph



GRAPH
  /LINE(SIMPLE)=MEAN(Reading_Score) BY Aptitude
  /PANEL COLVAR=Method COLOP=CROSS.

ONEWAY Reading_Score BY Aptitude
  /MISSING ANALYSIS
  /POSTHOC=TUKEY BONFERRONI ALPHA(0.01).
