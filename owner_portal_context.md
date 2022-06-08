# Owner Portal Context

## Events

Events in this context are always fired for a single grem instance. The [recipient](/header_properties.md/#AdditionalHeaderProperties) header property must be set to the GARAIO REM instance name in order to route the event to the customer, e.g. recipient: `grem_demo1`

Type | GARAIO REM | REM | Description
---|---|---|---
[`OwnerPortal.Person.Updated`](#ownerportalpersonupdated) | :heavy_check_mark: | :x: | A tenancy application has been received on a tenancy application platform

### OwnerPortal.Person.Updated

Field | Type | Content / Remarks
---|---|---
`eventType` | `string` | `OwnerPortal.Person.Updated`
&nbsp;&nbsp;`personReference` | `string` | `String` referencing an existing person in the target GARAIO REM |
&nbsp;&nbsp;`onboardingDate` | `string` | ISO 8601 encoded date, eg `'1980-02-17'`; might be null |
&nbsp;&nbsp;`deactivationDate` | `string` | ISO 8601 encoded date, eg `'1980-02-17'`; might be null |
&nbsp;&nbsp;`status` | `string` | Accepted statuses: `inactive`, `active` |

#### Example

```json
{"eventType":"OwnerPortal.Person.Updated",
  "data":{
    "onboardingDate":"1980-02-17",
    "deactivationDate":"1980-02-17",
    "personReference":"12345",
    "status":"inactive"
  }
}
```
