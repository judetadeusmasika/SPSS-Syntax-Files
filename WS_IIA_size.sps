
DATASET ACTIVATE DataSet2.
FREQUENCIES VARIABLES=IIA_size
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=IIA_size
  /FORMAT=NOTABLE
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=IIA_size
  /FORMAT=NOTABLE
  /STATISTICS=SUM
  /HISTOGRAM
  /ORDER=ANALYSIS.

GRAPH
  /BAR(SIMPLE)=COUNT BY marital_status
  /TITLE='Bar plot representing the marital status variable'.

DATASET ACTIVATE DataSet3.
EXAMINE VARIABLES=birthweight
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

DATASET ACTIVATE DataSet4.
EXAMINE VARIABLES=Birthweight
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

DATASET ACTIVATE DataSet3.
EXAMINE VARIABLES=birthweight 
  /COMPARE VARIABLE
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /MISSING=LISTWISE.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=sex MEAN(birthweight)[name="MEAN_birthweight"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: sex=col(source(s), name("sex"), unit.category())
  DATA: MEAN_birthweight=col(source(s), name("MEAN_birthweight"))
  GUIDE: axis(dim(1), label("sex"))
  GUIDE: axis(dim(2), label("Mean birthweight"))
  GUIDE: text.title(label("A histogram showing the distribution of birthweight by sex"))
  SCALE: cat(dim(1), include("1", "2"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(sex*MEAN_birthweight), shape.interior(shape.square))
END GPL.
