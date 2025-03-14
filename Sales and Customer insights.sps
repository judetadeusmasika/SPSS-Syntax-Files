
DATASET ACTIVATE DataSet1.

*** Descriptive statistics

DESCRIPTIVES VARIABLES=Purchase_Frequency Time_Between_Purchases Average_Order_Value 
    Churn_Probability
  /STATISTICS=MEAN STDDEV MIN MAX.

*** Correlation analysis

NONPAR CORR
  /VARIABLES=Purchase_Frequency Time_Between_Purchases Average_Order_Value Churn_Probability
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.


*** Comparing the groups (Effectiveness of Retention Strategies)

CROSSTABS
  /TABLES=Retention_Strategy BY Churn_Probability
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED 
  /COUNT ROUND CELL.


*** Regression analysis to determine the relationship between churn and other variables

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Churn_Probability
  /METHOD=ENTER Purchase_Frequency Time_Between_Purchases Average_Order_Value
  /RESIDUALS DURBIN.
