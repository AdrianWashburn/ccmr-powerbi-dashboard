// DimIntervention query. Create a text parameter named pDataFolder that points to the sample_data folder or district CSV folder.
let
    Source = Csv.Document(File.Contents(pDataFolder & "synthetic_intervention_map.csv"), [Delimiter=",", Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    TrimmedText = Table.TransformColumns(PromotedHeaders, List.Transform(Table.Columns(PromotedHeaders), each {_, if Value.Is(_, type text) then Text.Trim(_) else _, type text})),
    Typed = Table.TransformColumnTypes(TrimmedText, {}, "en-US"),
    StandardizedYesNo = Table.TransformColumns(Typed, List.Transform(List.Select(Table.Columns(Typed), each Text.Contains(_, "Flag") or Text.Contains(_, "Passed") or Text.Contains(_, "Verified") or Text.Contains(_, "Completed") or Text.Contains(_, "Met") or Text.Contains(_, "Attempted") or Text.Contains(_, "Current") or Text.Contains(_, "Disadvantaged") or Text.Contains(_, "Bilingual") or Text.Contains(_, "Focus") or Text.Contains(_, "Mobile") or Text.Contains(_, "Care") or Text.Contains(_, "Homeless") or Text.Contains(_, "Migratory") or Text.Contains(_, "Enrolled") or Text.Contains(_, "Concern")), each {_, each if _ = "Yes" then true else if _ = "No" then false else _, type any})),
    WithSourceFile = Table.AddColumn(StandardizedYesNo, "SourceFileName", each "synthetic_intervention_map.csv", type text),
    WithRefreshTimestamp = Table.AddColumn(WithSourceFile, "RefreshTimestamp", each DateTimeZone.UtcNow(), type datetimezone)
in
    WithRefreshTimestamp
