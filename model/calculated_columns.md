# Calculated columns and rule engine

Create a calculated `StudentName = DimStudent[LastName] & ", " & DimStudent[FirstName]`. Create recommendation bucket columns in a materialized FactCCMRStatus table: Already CCMR-met, Met but evidence unverified, ELA only needed, Math only needed, Both sides needed, Near SAT EBRW, Near SAT Math, Near TSIA ELAR, Near TSIA Math, AP/IB pathway potential, Dual credit pathway potential, OnRamps pathway potential, CTE one course away, IBC needed, IBC verification needed, SPED pathway review, Military pathway review, Instruction first then retest, and No clear pathway.

Use DimCCMRRule to store assessment type, subject, metric, cut score, secondary criterion, pathway category, rule weight, active year range, and status. Do not hard-code values in visuals; update the CSV annually after reviewing TEA guidance.
