# Row-level security

Recommended security table: UserEmail, Role, CampusID, CounselorName, TeacherID, ProgramAccess, CanViewNotes, CanViewSensitiveFlags.

Example campus role: `DimStudent[CampusID] IN VALUES(Security[CampusID]) || LOOKUPVALUE(Security[Role], Security[UserEmail], USERPRINCIPALNAME()) = "District"`. Counselor role filters `DimStudent[CounselorName]`. Teacher role filters `DimStudent[TeacherID]`. Testing coordinators should see testing roster fields and limited notes. Sensitive flags such as SPED, EB, 504, foster, homeless, and confidential notes should be hidden or separated into perspectives/reports where permissions require.
