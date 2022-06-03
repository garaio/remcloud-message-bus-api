# RentalPriceIndexSurvey context

## Events
Type | Garaio REM | REM | Description
---|---|---|---
[RentalPriceIndexSurvey.Unit.Processed](#rentalpriceindexsurveyunitprocessed) | :x: | :heavy_check_mark: | MPE-Service has processed a specific unit for price survey]


## Details
### RentalPriceIndexSurvey.Unit.Processed
Field | Type | Content / Remarks
---|---|---
eventType | string | RentalPriceIndexSurvey.Unit.Processed
data | hash |
&nbsp;&nbsp;referenceMessageId | string | reference message id of original bfs request, might be null
&nbsp;&nbsp;reference | string | unique unit identifier, eg '6020.01.0001'
&nbsp;&nbsp;referenceDate  | string | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;egid    | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/egid-ewid.html), might be null
&nbsp;&nbsp;ewid    | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/egid-ewid.html), might be null

#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)

#### Example
```json
{
  "eventType":"RentalPriceIndexSurvey.Unit.Processed",
  "data":{
    "referenceMessageId":"8773",
    "reference":"6020.01.0001",
    "referenceDate":"2019-03-01",
    "egid":"1610121",
    "ewid":"8"
  }
}
```

