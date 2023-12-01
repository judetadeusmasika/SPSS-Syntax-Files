"""PROBLEM ONE"""


DATASET ACTIVATE DataSet0.
ONEWAY Response BY Groups
  /STATISTICS DESCRIPTIVES 
  /PLOT MEANS
  /MISSING ANALYSIS
  /POSTHOC=TUKEY SCHEFFE BONFERRONI ALPHA(0.05).

"""PROBLEM TWO"""



DATASET ACTIVATE DataSet1.
UNIANOVA Scores BY Treatment Gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(Treatment*Gender Gender*Treatment)
  /EMMEANS=TABLES(Treatment) 
  /EMMEANS=TABLES(Gender) 
  /EMMEANS=TABLES(Treatment*Gender) 
  /CRITERIA=ALPHA(.05)
  /DESIGN=Treatment Gender Treatment*Gender.


"""PROBLEM THREE"""



DATASET ACTIVATE DataSet2.
UNIANOVA Grades BY Level_School Groups
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(Level_School*Groups Groups*Level_School)
  /EMMEANS=TABLES(Level_School) 
  /EMMEANS=TABLES(Groups) 
  /EMMEANS=TABLES(Level_School*Groups) 
  /CRITERIA=ALPHA(.05)
  /DESIGN=Level_School Groups Level_School*Groups.
