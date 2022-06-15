# RentalPriceSurvey context

## Events
Type | Garaio REM | REM | Description
---|---|---|---
[RentalPriceSurvey.Unit.Processed](#rentalpricesurveyunitprocessed) | :x: | :heavy_check_mark: | MPE-Service has processed a specific unit for price survey]


## Details
### RentalPriceSurvey.Unit.Processed
Field | Type | Content / Remarks
---|---|---
eventType | string | RentalPriceSurvey.Unit.Processed
data | hash |
&nbsp;&nbsp;referenceMessageId | string | reference message id of original bfs request, might be null
&nbsp;&nbsp;reference | string | unique unit identifier, eg '6020.01.0001'
&nbsp;&nbsp;referenceDate  | string | ISO 8601 encoded date, eg '2019-03-01'

#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)

#### Example
```json
{
  "eventType":"RentalPriceSurvey.Unit.Processed",
  "data":{
    "referenceMessageId":"8773",
    "reference":"6020.01.0001",
    "referenceDate":"2019-03-01"
  }
}
```

