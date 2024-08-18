
Excluding Non-relevant Responses (Filter out respondents who do not watch sports or use social media.)

SELECT IF (Q6 > 1 AND Q19 > 1).
EXECUTE.

Recoding and creating new variables

COMPUTE SocialMediaUse = MEDIAN(Q7_1, Q7_2, Q7_3, Q7_4, Q7_5, Q7_6, Q7_7, Q7_8).
EXECUTE.

COMPUTE ContentEngagement = MEAN(Q14, Q15).
EXECUTE.

COMPUTE InteractionWithContent = MEAN(Q21_1, Q21_2, Q21_3, Q21_4, Q21_5).
EXECUTE.

COMPUTE CommunityEngagement = MEAN(Q26, Q27).
EXECUTE.

COMPUTE OnlineExperience = MEAN(ContentEngagement, InteractionWithContent, Q24, CommunityEngagement, Q28).
EXECUTE.

* Compute LocalizedMarketing as an average of Q25_1 to Q25_6 

COMPUTE LocalizedMarketing = MEAN(Q25_1, Q25_2, Q25_3, Q25_4, Q25_5, Q25_6).
EXECUTE.



CORRELATIONS
  /VARIABLES=Q6 SocialMediaUse
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


