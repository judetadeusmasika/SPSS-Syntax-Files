
DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Age Gender City Income Education PersonalityTrait
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MEAN
  /HISTOGRAM(PERCENT)
  /ORDER=ANALYSIS.



FREQUENCIES VARIABLES=Gender City Education PersonalityTrait
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MEAN
  /BARCHART FREQ
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=OwnedSmartphoneBrand
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MEAN
  /BARCHART FREQ
  /ORDER=ANALYSIS.

T-TEST GROUPS=Gender(1 0)
  /MISSING=ANALYSIS
  /VARIABLES=PurchaseIntention
  /CRITERIA=CI(.95).

CORRELATIONS
  /VARIABLES=Age PurchaseIntention
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail 
    InfluenceScoreContent InfluenceScoreSEO PurchaseIntention
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=PurchaseIntention Income
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

ONEWAY PurchaseIntention BY City
  /MISSING ANALYSIS.

ONEWAY PurchaseIntention BY Education
  /MISSING ANALYSIS.

ONEWAY PurchaseIntention BY Education
  /MISSING ANALYSIS
  /POSTHOC=TUKEY ALPHA(0.05).

ONEWAY PurchaseIntention BY PersonalityTrait
  /MISSING ANALYSIS
  /POSTHOC=TUKEY ALPHA(0.05).



REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PurchaseIntention
  /METHOD=ENTER InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer 
    InfluenceScoreEmail InfluenceScoreContent InfluenceScoreSEO Income Education PersonalityTrait
  /RESIDUALS HISTOGRAM(ZRESID).


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT PurchaseIntention
  /METHOD=ENTER InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer 
    InfluenceScoreEmail InfluenceScoreContent InfluenceScoreSEO
  /RESIDUALS HISTOGRAM(ZRESID).



DATASET ACTIVATE DataSet1.
RELIABILITY
  /VARIABLES=RespondentID Age Gender City OwnedSmartphoneBrand InfluenceScoreMedia 
    InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail PurchaseIntention 
    InfluenceScoreContent InfluenceScoreSEO Income Education PersonalityTrait
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=RespondentID Age Gender City OwnedSmartphoneBrand InfluenceScoreMedia 
    InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail PurchaseIntention 
    InfluenceScoreContent InfluenceScoreSEO Income Education PersonalityTrait
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

FACTOR
  /VARIABLES InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail 
    InfluenceScoreContent InfluenceScoreSEO
  /MISSING LISTWISE 
  /ANALYSIS InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail 
    InfluenceScoreContent InfluenceScoreSEO
  /PRINT INITIAL ROTATION
  /PLOT EIGEN
  /CRITERIA FACTORS(5) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail 
    InfluenceScoreContent InfluenceScoreSEO
  /MISSING LISTWISE 
  /ANALYSIS InfluenceScoreMedia InfluenceScoreOnline InfluenceScoreInfuencer InfluenceScoreEmail 
    InfluenceScoreContent InfluenceScoreSEO
  /PRINT INITIAL KMO ROTATION
  /PLOT EIGEN
  /CRITERIA FACTORS(5) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.
