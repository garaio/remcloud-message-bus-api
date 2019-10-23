# REM-Cloud Message Bus API
[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO AG. The REM-Cloud Message Bus connects
these systems and enables other organisations to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/).
RabbitMQ itself implements [AMQP](https://www.amqp.org/).
## Access
If you wish to access the REM-Cloud Message Bus please contact us on [garaio-rem@garaio.com](mailto:youraddress@ucsc.edu).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
---|---
app id | An app id (Unique Application ID) (e.g: 'YourService'). The app id is also the name of your queue from which you can retrieve your messages
userid / password | Login  credentials for RabbitMQ
exchange name | The name of the exchange to which you can send messages

## Messages

### Message Properties

All messages must specify at least the following AMQP message properties:

Property | Value | Example | Description
---|---|---|---
app_id| \<app_id> | 'YourService' or 'REMCustomerA'  | Uniquely identifies the sender of a message
content_type| application/json || Message content is formatted as JSON
message_id | \<app_id>-\<app_specific_uid>| 'YourService-7712897' | Uniquely identifies a message. The app specific uid is an alphanumeric, app wide unique key
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created

### Headers

The headers are part of the message properties and must specify at least the app id

Property | Value | Example | Description
---|---|---|---
app_id | \<app_id> | headers: { app_id: 'YourService' }  | In order to be able to route the messages we need the app id in the headers, too

Some events require additional header properties. They are documented in the event description where needed.

### Events

Events are messages that can be received by multiple subscribers. The message body contains a json data structure. Events are grouped by Contexts. 

### Contexts

Context | Description
---|---|
[Masterdata](masterdata_context.md)|

#### Letting Context

Type | Description
---|---
[Letting.Tenancy.Created](#lettingtenancycreated) | A tenancy has been created; does not reliably signal a tenant move in. A tenancy is uniquely identified by contract reference, tentant reference and unit reference
[Letting.Tenancy.Updated](#lettingtenancyupdated) | Start and / or end date of a tenancy have been changed
[Letting.Tenancy.Deleted](#lettingtenancydeleted) | A tenancy has been deleted; this means that the tenancy never became effective

#### Tenancy Application Context

Events in this context are always fired for a single grem instance. The recipient header property must be set to the grem instance name in order to route the event to the customer, e.g. recepient: grem_demo1

Type | Description
---|---
[TenancyApplication.Dossier.Selected](#tenancyapplicationdossierselected) | A tenancy application has been selected on a tenancy application platform

#### Tenant Portal Context

Events in this context are always fired for a single grem instance. The recipient header property must be set to the grem instance name in order to route the event to the customer, e.g. recepient: grem_demo1

Type | Description
---|---
[TenantPortal.Tenant.Registered](#tenantportaltenantregistered) | A tenant has been registered in the tenant portal and an access code has been created



#### Letting.Tenancy.Created

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

##### Example

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

#### Letting.Tenancy.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Updated
data | hash |
&nbsp;&nbsp;startDate | string | ISO 8601 encoded date, eg '2019-05-25'
&nbsp;&nbsp;endDate | string | ISO 8601 encoded date, eg '2019-05-25'; might be null
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | unique person identifier, eg '1234'

##### Example

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

#### Letting.Tenancy.Deleted

Field | Type | Content / Remarks
---|---|---
eventType | string | Letting.Tenancy.Deleted
data | hash |
&nbsp;&nbsp;tenancyAgreementReference | string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference | string | unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | unique person identifier, eg '1234'

##### Example

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

#### TenancyApplication.Dossier.Selected

Field | Type | Content / Remarks
---|---|---
eventType | string | TenancyApplication.Dossier.Selected
data | hash |
&nbsp;&nbsp;dossierId | string | Unique identifier within the tenancy application platform |
&nbsp;&nbsp;unitReference | string | String referencing an existing unit in the target GARAIO REM |
&nbsp;&nbsp;requestedMovingDate | string | ISO 8601 encoded date, eg '1980-02-17'; might be null |
&nbsp;&nbsp;applicants | array | list of applicants; must contain at least one applicant |
&nbsp;&nbsp;&nbsp;&nbsp;address | hash | address data for this applicant; might be null |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;street | string | name of street, including the number, where appropriate |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zipCode | string | |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city | string | |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH' |
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;surname | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;dateOfBirth | string | ISO 8601 encoded date, eg '1980-02-17'; might be null |
&nbsp;&nbsp;&nbsp;&nbsp;homeTown | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;jobTitle | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;email | string | might be null |
&nbsp;&nbsp;&nbsp;&nbsp;nationalityCode | string | ISO country code, eg 'CH'; might be null |
&nbsp;&nbsp;&nbsp;&nbsp;marriageStatus | string | Accepted stati: unmarried, married, civil_union, divorced, widowed, separated; might be null |

##### Example

```json
{"eventType":"TenancyApplication.Dossier.Selected",
  "data":{
    "applicants":[
      {"address":
        {"city":"Bern",
         "countryCode":"CH",
         "street":"Gartenstr. 3",
         "zipCode":"3007"
        },
        "dateOfBirth":"1980-02-17",
        "email":"max.muster@gmail.com",
        "firstName":"Max",
        "hometown":"Bern",
        "jobTitle":"Software Engineer",
        "marriageStatus":"married",
        "nationalityCode":"CH",
        "phoneNumber":"555 123 456",
        "surname":"Muster"
      }
    ],
    "dossierId":"1111",
    "requestedMovingDate":"2019-08-01",
    "unitReference":"1234.01.0001"
    }
  }
}
```

#### TenantPortal.Tenant.Registered

Field | Type | Content / Remarks
---|---|---
eventType | string | TenantPortal.Tenant.Registered
data | hash |
&nbsp;&nbsp;tenantReference | string | unique person identifier, eg '1234' |
&nbsp;&nbsp;unitReference | string | String referencing an existing unit in the target GARAIO REM |
&nbsp;&nbsp;registrationCode | string | Registration code coming from the TenantPortal |
&nbsp;&nbsp;onboardingUrl | string | Onboarding url which will be sent to the tenant |

##### Example

```json
{"eventType":"TenantPortal.Tenant.Registered",
  "data":{
    "tenantReference":"100004",
    "unitReference":"1234.01.0001",
    "registrationCode":"A1234B99",
    "onboardingUrl":"https://mieterportal.garaio.com"
    }
  }
}
```

#### Masterdata.ManagementTeam.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.ManagementTeam.Updated
data | hash |
&nbsp;&nbsp;propertyReference | string | unique identifier for the property
&nbsp;&nbsp;managementTeamChanges | array |
&nbsp;&nbsp;&nbsp;&nbsp;userRoleCode | string | user role code, eg R001
&nbsp;&nbsp;&nbsp;&nbsp;surname | string |
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string |
&nbsp;&nbsp;&nbsp;&nbsp;languageCode | string | de, fr, it or en
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string |
&nbsp;&nbsp;&nbsp;&nbsp;email | string |

##### Example

```json
{"eventType":"Masterdata.Property.ManagementTeam.Updated",
  "data":{
    "propertyReference":"1234",
    "managementTeamChanges":[
      {"userRoleCode":"R001",
       "surname":"Muster",
       "firstName":"Max",
       "languageCode":"de",
       "phoneNumber":"555 123 456",
       "email":"max.muster@test-mail.com"
      },
      {"userRoleCode":"R002",
       "surname":"Muster",
       "firstName":"Maxine",
       "languageCode":"fr",
       "phoneNumber":"555 654 321",
       "email":"maxine.muster@test-mail.com"
      }
    ]
  }
}
```
