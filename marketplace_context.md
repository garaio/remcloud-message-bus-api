# Marketplace Context

## Events

Type | GARAIO REM | REM | Description
---|---|---|---
[Marketplace.Unit.AvailableForRent](#marketplaceunitavailableforrent) | :heavy_check_mark: | :x: | A unit became available for rent |
[Marketplace.Unit.UnavailableForRent](#marketplaceunitunavailableforrent) | :heavy_check_mark: | :x: | A unit became unavailable for rent |

### Marketplace.Unit.AvailableForRent

Field | Type | Content / Remarks
---|---|---
eventType | string | Marketplace.Unit.AvailableForRent
data | hash |
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;availableFrom | string | ISO 8601 encoded date, eg '2022-05-01'; the unit may be advertised as available for rent from this date on
&nbsp;&nbsp;liableUntil | string | ISO 8601 encoded date, eg '2022-05-01'; up to his date rent is still payed for this unit by the former tenant(s); might be null

#### Example

```json
{"eventType":"Marketplace.Unit.AvailableForRent",
  "data":{
    "unitReference":"10001.786.29",
    "availableFrom":"2022-05-01",
    "liableUntil":"2022-06-30"
  }
}
```

### Marketplace.Unit.UnavailableForRent

Field | Type | Content / Remarks
---|---|---
eventType | string | Marketplace.Unit.UnavailableForRent
data | hash |
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;chosenDossierId | string | External dossier id if the new tenancy agreement was created from a tenancy application dossier; the dossier id is sent when a tenancy agreement with an associated tenancy application dossier is activated

#### Example

```json
{"eventType":"Marketplace.Unit.UnavailableForRent",
  "data":{
    "unitReference":"10001.786.29",
    "chosenDossierId":"A-23"
  }
}
```
