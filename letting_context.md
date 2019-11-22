# Letting Context
## Events
Type | Status | Description
---|---|---
[Letting.Tenancy.Created](#lettingtenancycreated) | | A tenancy has been created; does not reliably signal a tenant move in. A tenancy is uniquely identified by contract reference, tentant reference and unit reference
[Letting.Tenancy.Updated](#lettingtenancyupdated) | | Start and / or end date of a tenancy have been changed
[Letting.Tenancy.Deleted](#lettingtenancydeleted) | | A tenancy has been deleted; this means that the tenancy never became effective
[Letting.Tenancy.MoveInConfirmed](#lettingtenancymoveinconfirmed) | Draft | Confirms a tenant will move or has moved into a unit. This event is only raised for tenants that live or trade in a given unit. For example the event is not raised for tenants that act as guarantors or for tenants that have had their tenancy agreement changed while staying in the same unit.  |
[Letting.Tenancy.MoveOutConfirmed](#lettingtenancymoveoutconfirmed) | Draft | Confirms a tenant will move out or has moved out of a unit. Like Letting.Tenancy.MoveInConfirmed the event is also only raised when a tenant has lived or traded in person at the given unit. |
### Letting.Tenancy.Created

Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Created
data | hash |
&nbsp;&nbsp;startDate | string | ISO 8601 encoded date, eg '2019-05-25'
&nbsp;&nbsp;endDate | string | ISO 8601 encoded date, eg '2019-05-25'; might be null
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenant | hash |
&nbsp;&nbsp;&nbsp;&nbsp;reference | string | tenant reference; uniquely identifies a person
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string |
&nbsp;&nbsp;&nbsp;&nbsp;surname | string |
&nbsp;&nbsp;&nbsp;&nbsp;languageCode | string | de, fr, it or en
&nbsp;&nbsp;&nbsp;&nbsp;nationalityCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string | might be null
&nbsp;&nbsp;&nbsp;&nbsp;email | string | might be null

#### Example

```json
{"eventType":"Letting.Tenancy.Created",
  "data":{
    "startDate":"2019-05-01",
    "endDate":null,
    "tenancyAgreementReference":"10001.786.29.01",
    "unitReference":"10001.786.29",
    "tenant":{
      "reference":"100004",
      "firstName":"Haupt",
      "surname":"Mieter",
      "languageCode":"de",
      "nationalityCode":"AT",
      "phoneNumber":"+41 31 331 21 11",
      "email":"email@test-mail.xy"
    }
  }
}
```

### Letting.Tenancy.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Updated
data | hash |
&nbsp;&nbsp;startDate | string | ISO 8601 encoded date, eg '2019-05-25'
&nbsp;&nbsp;endDate | string | ISO 8601 encoded date, eg '2019-05-25'; might be null
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | unique person identifier, eg '1234'

#### Example

```json
{"eventType":"Letting.Tenancy.Updated",
  "data":{
    "startDate":"2019-05-01",
    "endDate":null,
    "tenancyAgreementReference":"10001.786.29.01",
    "unitReference":"10001.786.29",
    "tenantReference":"100004"
    }
  }
}
```

### Letting.Tenancy.Deleted

Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Deleted
data | hash |
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | unique person identifier, eg '1234'

#### Example

```json
{"eventType":"Letting.Tenancy.Updated",
  "data":{
    "tenancyAgreementReference":"10001.786.29.01",
    "unitReference":"10001.786.29",
    "tenantReference":"100004"
    }
  }
}
```

### Letting.Tenancy.MoveInConfirmed
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.MoveInConfirmed
data | hash |
&nbsp;&nbsp;tenancyStartDate | string | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenant | hash |
&nbsp;&nbsp;&nbsp;&nbsp;reference | string | tenant reference; uniquely identifies a person
&nbsp;&nbsp;&nbsp;&nbsp;previousAddress | hash | the address where the tenant lived or traded before. Can be nil if unknown.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city | string |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;lettingContactReference | string | uniquely identifies the management team member who represents the property owner regarding this tenancy.

#### Example
```json
TODO
```
### Letting.Tenancy.MoveOutConfirmed
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.MoveOutConfirmed
data | hash |
&nbsp;&nbsp;tenancyEndDate | string | ISO 8601 encoded date, eg '2019-05-30'
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenant | hash |
&nbsp;&nbsp;&nbsp;&nbsp;reference | string | tenant reference; uniquely identifies a person
&nbsp;&nbsp;&nbsp;&nbsp;nextAddress | hash | the address where the tenant will live or trade next. Can be nil if unknown.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city | string |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;lettingContactReference | string | uniquely identifies the management team member who represents the property owner regarding this tenancy.

#### Example
```json
TODO
```
