# Letting Context
## Events
Type | Status | Description
---|---|---
[Letting.Tenancy.Created](#lettingtenancycreated) | | A tenancy has been created; does not reliably signal a tenant move in. A tenancy is uniquely identified by contract reference, tentant reference and unit reference
[Letting.Tenancy.Updated](#lettingtenancyupdated) | | Start and / or end date of a tenancy have been changed
[Letting.Tenancy.Deleted](#lettingtenancydeleted) | | A tenancy has been deleted; this means that the tenancy never became effective
[Letting.Tenancy.Started](#lettingtenancystarted) | Draft | A tenancy will start or has started at the specified date; At this date the tenant will or has become liable in respect to this tenancy.|
[Letting.Tenancy.StartDateChanged](#lettingstartdatechanged) | Draft | A previously reported tenancy start date has changed|
[Letting.Tenancy.StartCancelled](#lettingstartcancelled) | Draft | A previously reported teneancy has been cancelled. The tenant has never become liable.|
[Letting.Tenancy.Ended](#lettingtenancyended)| Draft | A tenancy will or has ended at the specified date; The tenant's liablity in respect to this tenancy will or has ended at this date.|
[Letting.Tenancy.EndDateChanged](#lettingtenancyenddatechanged)| Draft | A previously reported tenancy end date has changed|
[Letting.Tenancy.EndCancelled](#lettingtenancyenddatecancelled)| Draft| A previously reported tenancy end has been cancelled. The tenants liablity is again indefinite.|

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

### Letting.Tenancy.Started
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Started
data | hash |
&nbsp;&nbsp;startDate | string | ISO 8601 encoded date, eg '2019-05-25'
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
&nbsp;&nbsp;&nbsp;&nbsp;dateOfBirth | string | ISO 8601 encoded date, eg '1974-03-03'; can be null
&nbsp;&nbsp;unit (Deprecated)| hash | 
&nbsp;&nbsp;&nbsp;&nbsp;reference| string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;&nbsp;&nbsp;egid | string | unique building identifier used by Swiss Authorities, eg '140643', can be null
&nbsp;&nbsp;&nbsp;&nbsp;ewid | string | unique unit identifier used by Swiss Authorities, eg '1015174004', can be null
&nbsp;&nbsp;&nbsp;&nbsp;street| string |street name including the building number where appropriate 
&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string | zip code, eg "6037"
&nbsp;&nbsp;&nbsp;&nbsp;city | string | city, town or village, eg "Root"
&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;lettingContactPerson (Deprecated)| hash | the person who represents the property owner regarding this tenancy.
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string |
&nbsp;&nbsp;&nbsp;&nbsp;surname | string |
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string | can be null
&nbsp;&nbsp;&nbsp;&nbsp;email | string | can be null
&nbsp;&nbsp;&nbsp;&nbsp;postalAddress| Hash |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addressLine1 | string | the first line used on postal addresses, eg 'c/o Lettings', can be null
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;postOfficeBoxText | string | a line printed on postal office box, eg 'Postfach 1207', can be null
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;street| string |street name including the building number where appropriate 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string | zip code, eg "6037"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city | string | city, town or village, eg "Root"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'


#### Example
TODO

### Letting.Tenancy.StartDateChanged
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.StartDateChanged
data | hash |
&nbsp;&nbsp;startDate | string | ISO 8601 encoded date, eg '2019-07-01'
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string |  tenant reference; uniquely identifies a person
#### Example
TODO

### Letting.Tenancy.StartCancelled
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.StartCancelled
data | hash |
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string |  tenant reference; uniquely identifies a person
#### Example
TODO

### Letting.Tenancy.Ended
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Started
data | hash |
&nbsp;&nbsp;endDate | string | ISO 8601 encoded date, eg '2019-05-25'
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
&nbsp;&nbsp;&nbsp;&nbsp;dateOfBirth | string | ISO 8601 encoded date, eg '1974-03-03'; can be null
&nbsp;&nbsp;unit (Deprecated)| hash | 
&nbsp;&nbsp;&nbsp;&nbsp;reference| string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;&nbsp;&nbsp;egid | string | unique building identifier used by Swiss Authorities, eg '140643', can be null
&nbsp;&nbsp;&nbsp;&nbsp;ewid | string | unique unit identifier used by Swiss Authorities, eg '1015174004', can be null
&nbsp;&nbsp;&nbsp;&nbsp;street| string |street name including the building number where appropriate 
&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string | zip code, eg "6037"
&nbsp;&nbsp;&nbsp;&nbsp;city | string | city, town or village, eg "Root"
&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;lettingContactPerson (Deprecated)| hash | the person who represents the property owner regarding this tenancy.
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string |
&nbsp;&nbsp;&nbsp;&nbsp;surname | string |
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string | can be null
&nbsp;&nbsp;&nbsp;&nbsp;email | string | can be null
&nbsp;&nbsp;&nbsp;&nbsp;postalAddress| Hash |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addressLine1 | string | the first line used on postal addresses, eg 'c/o Lettings', can be null
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;postOfficeBoxText | string | a line printed on postal office box, eg 'Postfach 1207', can be null
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;street| string |street name including the building number where appropriate 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string | zip code, eg "6037"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city | string | city, town or village, eg "Root"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
#### Example
TODO

### Letting.Tenancy.EndDateChanged
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.EndDateChanged
data | hash |
&nbsp;&nbsp;endDate | string | ISO 8601 encoded date, eg '2019-11-30'
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string |  tenant reference; uniquely identifies a person
#### Example
TODO

### Letting.Tenancy.EndCancelled
Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.EndCancelled
data | hash |
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string |  tenant reference; uniquely identifies a person
#### Example
TODO
