
/* 1 ) DEMOGRAPHIC ANALYSIS

/* Frequency tables

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Whatisyourage
  /BARCHART FREQ
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /BARCHART FREQ
  /ORDER=ANALYSIS.

/* Frequencies and percentages for categorical variables

FREQUENCIES VARIABLES=Howoftendoyouusesocialmediaplatforms 
    WhichofthefollowingsocialmediaplatformsdoyouusemostfrequentlyCan AreyoufamiliarwithAsianfoodbrands 
    HaveyounoticedanyadvertisementsforAsianfoodbrandsonsocialmediain 
    Whichtypesofsocialmediacontentdoyounormallyengagewith Canchoosem
  /ORDER=ANALYSIS.

/* CROSSTABS

CROSSTABS
  /TABLES=Inwhichcountrydoyoucurrentlyreside BY 
    DoyouthinkTikTokorInstagramaremoreeffectiveforlearningaboutnewfo
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /BARCHART.

/* 2)  PLATFORM PREFERENCE ANALYSIS

FREQUENCIES VARIABLES=Howoftendoyouusesocialmediaplatforms 
    WhichofthefollowingsocialmediaplatformsdoyouusemostfrequentlyCan
  /ORDER=ANALYSIS.

/* Crosstab Platform Usage with Demographics

CROSSTABS
  /TABLES=Howoftendoyouusesocialmediaplatforms BY Whatisyourage Whatisyourgender 
    Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN 
  /COUNT ASIS
  /BARCHART.

/* Chi-Square Test for Associations

CROSSTABS
  /TABLES=Howoftendoyouusesocialmediaplatforms BY Whatisyourage Whatisyourgender 
    Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ASIS
  /BARCHART.

/* 3)  Effectiveness of Social Media Content


DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Whichtypesofsocialmediacontentdoyounormallyengagewith Canchoosem 
    ForAsianfoodbrandswhattypeofcontentdoyouprefertoseeonsocialmedia
  /BARCHART FREQ
  /ORDER=ANALYSIS.


/* Chi-Square Test: Preferred Content Types and Engagement

CROSSTABS
  /TABLES=ForAsianfoodbrandswhattypeofcontentdoyouprefertoseeonsocialmedia BY 
    IfyouseeawellreviewedAsianfoodproductonsocialmediawouldyoubemore
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS.

/*  ANOVA or T-tests: Engagement Across Platforms

AUTORECODE VARIABLES=DoyouthinkTikTokorInstagramaremoreeffectiveforlearningaboutnewfo 
  /INTO PlatformUsage
  /PRINT.

T-TEST GROUPS=PlatformUsage(2 4)
  /MISSING=ANALYSIS
  /VARIABLES=HowlikelyareyoutointeractlikesharecommentwithanadvertisementforA
  /CRITERIA=CI(.95).


/* Influence of Social Media Advertising

/* correlation analysis

CORRELATIONS
  /VARIABLES=HowwouldyourateyourinterestintryingnewAsianfoodproducts 
    Howlikelyareyoutotryaproductafterseeingitadvertisedonsocialmedia 
    Howmuchinfluencedosocialmediainfluencershaveonyourpurchasingdeci
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* Regression Analysis: To predict the likelihood of purchase based on advertisement elements

AUTORECODE VARIABLES=Whatelementsinasocialmediapostwouldmostlikelycatchyourattention  
  /INTO SocialMediaElements
  /PRINT.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Howlikelyareyoutotryaproductafterseeingitadvertisedonsocialmedia
  /METHOD=ENTER Howimportantisafoodadvertisementinhavingaculturalorauthenticfeel 
    HowlikelyareyoutointeractlikesharecommentwithanadvertisementforA SocialMediaElements
  /RESIDUALS DURBIN NORMPROB(ZRESID).

/* Purchasing Behavior Analysis

/* Frequency of Purchasing Asian Food Products

FREQUENCIES VARIABLES=HowfrequentlydoyoupurchaseAsianfoodproducts
  /BARCHART FREQ
  /ORDER=ANALYSIS.

/* Impact of Reviews, Influencer Recommendations, and Authenticity

AUTORECODE VARIABLES=IfyouseeawellreviewedAsianfoodproductonsocialmediawouldyoubemore 
  /INTO ImpactwellReview
  /PRINT.

DESCRIPTIVES VARIABLES=Howmuchinfluencedosocialmediainfluencershaveonyourpurchasingdeci 
    Howimportantisafoodadvertisementinhavingaculturalorauthenticfeel ImpactwellReview
  /STATISTICS=MEAN STDDEV MIN MAX.

/* Chi-Square Test: Associations Between Purchasing Frequency and Demographics

CROSSTABS
  /TABLES=HowfrequentlydoyoupurchaseAsianfoodproducts BY Whatisyourage Whatisyourgender 
    Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS.

/* Logistic Regression: Predicting Purchasing Likelihood

RECODE HowfrequentlydoyoupurchaseAsianfoodproducts 
    ("A few times per year" = 0) 
    ("Rarely" = 0) 
    ("Weekly" = 1) 
    ("Monthly" = 1) 
    INTO PurchaseFreq.
VARIABLE LABELS PurchaseFreq 'Low freq vs High freq'.
EXECUTE.

LOGISTIC REGRESSION VARIABLES PurchaseFreq
  /METHOD=ENTER SocialMediaElements 
    Howmuchinfluencedosocialmediainfluencershaveonyourpurchasingdeci 
    Howimportantisafoodadvertisementinhavingaculturalorauthenticfeel ImpactwellReview 
  /CLASSPLOT
  /PRINT=GOODFIT SUMMARY
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

/* Engagement Levels

/* conduct ANOVA

ONEWAY HowlikelyareyoutointeractlikesharecommentwithanadvertisementforA BY PlatformUsage
  /STATISTICS DESCRIPTIVES 
  /PLOT MEANS
  /MISSING ANALYSIS
  /POSTHOC=TUKEY ALPHA(0.05).

/*  Chi-Square Test: Associations Between Engagement Levels and Ad Elements

CROSSTABS
  /TABLES=IfyouseeawellreviewedAsianfoodproductonsocialmediawouldyoubemore BY 
    Whatelementsinasocialmediapostwouldmostlikelycatchyourattention 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS.

/* Open ended questions ( 5 questions)

/* 1) frequency tables

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Auntentic_Innovate
  /BARCHART FREQ
  /ORDER=ANALYSIS.

/* crosstabs and chi-square tests

CROSSTABS
  /TABLES=Auntentic_Innovate BY Whatisyourage Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS
  /BARCHART.


/* 2)  frequency tables

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Comment_NoComment
  /BARCHART FREQ
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Comment_NoComment BY Whatisyourage Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS
  /BARCHART.

/*  3) frequecny tables 

FREQUENCIES VARIABLES=Interactive_content
  /BARCHART FREQ
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Interactive_content BY Whatisyourage Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS
  /BARCHART.

/* 4)  frequency tables 

FREQUENCIES VARIABLES=Sentiments
  /BARCHART FREQ
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=Sentiments BY Whatisyourage Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS
  /BARCHART.

/* 5) Frequency tables

FREQUENCIES VARIABLES=UpdatesthroughEmail
  /BARCHART FREQ
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=UpdatesthroughEmail BY Whatisyourage Whatisyourgender Inwhichcountrydoyoucurrentlyreside
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT EXPECTED COLUMN 
  /COUNT ASIS
  /BARCHART.


