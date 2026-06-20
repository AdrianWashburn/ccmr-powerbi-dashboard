// DimDate query
let
    StartDate = #date(2023, 7, 1),
    EndDate = #date(2028, 8, 31),
    Dates = List.Dates(StartDate, Duration.Days(EndDate-StartDate)+1, #duration(1,0,0,0)),
    TableDates = Table.FromList(Dates, Splitter.SplitByNothing(), {"Date"}),
    Typed = Table.TransformColumnTypes(TableDates, {{"Date", type date}}),
    Year = Table.AddColumn(Typed, "Year", each Date.Year([Date]), Int64.Type),
    Month = Table.AddColumn(Year, "Month", each Date.Month([Date]), Int64.Type),
    SchoolYear = Table.AddColumn(Month, "SchoolYear", each if Date.Month([Date]) >= 7 then Text.From(Date.Year([Date])) & "-" & Text.From(Date.Year([Date])+1) else Text.From(Date.Year([Date])-1) & "-" & Text.From(Date.Year([Date])), type text)
in
    SchoolYear
