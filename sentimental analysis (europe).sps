
DESCRIPTIVE STATISTICS OF THE DEMOGRAPHIC VARIABLES
/*SEX, AGE, NUMBER OF CHILDREN AND EDUCATIONAL LEVEL

DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=v302 v303 v321 v336
  /STATISTICS=MEAN STDDEV MIN MAX.

/* RESEARCH QUESTION

WHAT ARE THE PRIMARY DETERMINANTS OF EUROSKEPTICISM AND WHAT ARE THEIR INFLUENCE  ///
TOWARDS IT.

SOCIOECONOMIC FACTORS SUCH AS INCOME LEVEL, ECONOMIC STATUS, EDUCATION LEVEL AND ///
POLITICAL ATTITUDES SUCH AS PLOTICAL TRUST AD NATIONALISTIC ATTITUDES.

/* TO DETERMINE THIS, A REGRESSION ANALYSIS WAS PERFORMED 

Multivariate Causal Model

DEPENDENT VARIABLE - EUROSKEPTICISM
INDEPENDENT VARIABLES - EDUCATION, INCOME, EMPLOYMENT STATUS, NATION ATTITUDES AND POLITICAL TRUST

CALCULATE THE DEPENDENT VARIABLE

COMPUTE EUROSKEPTICISM=(v257 + v258 + v259 + v260 + v261 + v262)/6.
EXECUTE.

CALCULATE THE NATIONALISTIC ATTITUDE VARIABLES

COMPUTE NATION_ATT1=(v268 + v269 + v270 + v271 + v272 + v273)/6.
EXECUTE.

COMPUTE NATION_ATT2=(v274+v275)/2.
EXECUTE.

CALCULATE THE POLITICAL TRUST VARIABLES

COMPUTE POLITICAL_TRUST=(v229+v230+v231+v232)/4.
EXECUTE.

MOST OF THE VARIABLES ARE SIGNIFICANT AT 5% LEVEL OF SIGNIFICANCE. IMPLYING THAT THEY SIGNIFICANTLY INFLUENCE THE DEPENDENT ///
VARIABLE EUROSKEPTICISM. VARIABLES SUCH AS NATIONALISTIC ATTITUDES, INCOME LEVEL AND POLITICAL TRUST ARE SIGNIFICANT.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT EUROSKEPTICISM
  /METHOD=ENTER v336 v353YR v89 v337 v338 v102 v256 v266 NATION_ATT1 NATION_ATT2 v186 v193 v223 
    POLITICAL_TRUST v263 v281
  /SCATTERPLOT=(EUROSKEPTICISM ,*SDRESID)
  /RESIDUALS DURBIN HISTOGRAM(ZRESID).


HYPOTHESES INVOLVED INCLUDED;

H1: POLITICAL TRUST VARIABLES INFLUENCE EUROSKEPTICISM POSITIVELY

CORRELATIONS
  /VARIABLES=EUROSKEPTICISM POLITICAL_TRUST v263 v281
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

H2: Strong nationalistic attitudes are positively correlated with Euroskepticism.

CORRELATIONS
  /VARIABLES=EUROSKEPTICISM NATION_ATT2 NATION_ATT1 v256 v266
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

H3: THERE IS A DIFFERENCE IN EUROSKEPTICISM  AMONG  ECONOMIC STATUS (INCOME_LEVEL).

ONEWAY EUROSKEPTICISM BY v353YR
  /MISSING ANALYSIS.
