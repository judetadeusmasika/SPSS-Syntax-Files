/* Independent samples t-test (two tailed test)

DATASET ACTIVATE DataSet1.
T-TEST GROUPS=Gender(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Satisfaction
  /CRITERIA=CI(.95).
/* Plotting a bar graph to display the level of satisfaction of the two groups (male and female employees)
/* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Gender MEAN(Satisfaction)[name="MEAN_Satisfaction"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Gender=col(source(s), name("Gender"), unit.category())
  DATA: MEAN_Satisfaction=col(source(s), name("MEAN_Satisfaction"))
  GUIDE: axis(dim(1), label("Gender"))
  GUIDE: axis(dim(2), label("Mean Satisfaction"))
  SCALE: cat(dim(1), include("0", "1"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(Gender*MEAN_Satisfaction), shape.interior(shape.square))
END GPL.
/* Repeated measures anaysis of variance


GLM Skills1 Skills2 Skills3
  /WSFACTOR=factor1 3 Polynomial 
  /METHOD=SSTYPE(3)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=factor1.

/* Chart Builder.

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Events Satisfaction MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Events=col(source(s), name("Events"))
  DATA: Satisfaction=col(source(s), name("Satisfaction"))
  GUIDE: axis(dim(1), label("Events"))
  GUIDE: axis(dim(2), label("Satisfaction"))
  ELEMENT: point(position(Events*Satisfaction))
END GPL.

NONPAR CORR
  /VARIABLES=Events Satisfaction
  /PRINT=BOTH TWOTAIL SIG
  /MISSING=PAIRWISE.



