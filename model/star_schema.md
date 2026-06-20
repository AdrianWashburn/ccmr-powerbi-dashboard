# Star schema

Dimensions: DimStudent, DimDate, DimAssessment, DimCourse, DimProgramOfStudy, DimPathway, DimCampus, DimCounselor, DimIntervention, DimCCMRRule. Facts: FactAssessmentAttempt, FactSkillPerformance, FactTranscriptCourse, FactCurrentSchedule, FactCourseRequest, FactCTEProgress, FactIBC, FactDualCreditOnRamps, FactCounselorNote, FactInterventionAssignment, FactAttendance, FactDiscipline, FactCCMRStatus. `LocalStudentID` is the text student key. Facts remain many-side tables to support many assessments, courses, notes, interventions, CTE pathway attempts, and IBC attempts.
