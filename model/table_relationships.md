# Relationships

Create one-to-many, single-direction relationships from DimStudent[LocalStudentID] to each fact LocalStudentID. DimDate[Date] relates to assessment, note, intervention, IBC, discipline, and completion dates as inactive alternates where needed. DimProgramOfStudy relates to FactCTEProgress and FactIBC. DimCCMRRule is used as a disconnected/configuration dimension for rule evaluation and slicers. DimIntervention relates to FactInterventionAssignment by ContentArea + SkillName where composite modeling is available or through a generated key.
