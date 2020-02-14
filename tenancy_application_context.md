# Tenancy Application Context
## Events

Events in this context are always fired for a single grem instance. The recipient header property must be set to the grem instance name in order to route the event to the customer, e.g. recepient: grem_demo1

Type | Status | Description
---|---|---
[TenancyApplication.Dossier.Selected](#tenancyapplicationdossierselected) | | A tenancy application has been selected on a tenancy application platform
[TenancyApplication.Dossier.Received](#tenancyapplicationdossierreceived) | | A tenancy application has been received on a tenancy application platform
[TenancyApplication.Dossier.Processed](#tenancyapplicationdossierprocessed) | | A tenancy application has been processed (Removed, Rejected or Affirmed) on a tenancy application platform

### TenancyApplication.Dossier.Selected

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

#### Example

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

### TenancyApplication.Dossier.Received

Field | Type | Content / Remarks
---|---|---
eventType | string | TenancyApplication.Dossier.Received
data | hash |
&nbsp;&nbsp;unitReference | string | String referencing an existing unit in the target GARAIO REM |
&nbsp;&nbsp;title | hash | containing the title of the application in 4 languages
&nbsp;&nbsp;&nbsp;&nbsp;de | string | String containing the title of the application in german
&nbsp;&nbsp;&nbsp;&nbsp;fr | string | String containing the title of the application in french
&nbsp;&nbsp;&nbsp;&nbsp;it | string | String containing the title of the application in italian
&nbsp;&nbsp;&nbsp;&nbsp;en | string | String containing the title of the application in english
&nbsp;&nbsp;text | hash | containing the text of the application in 4 languages
&nbsp;&nbsp;&nbsp;&nbsp;de | string | Html string containing the text of the application in german
&nbsp;&nbsp;&nbsp;&nbsp;fr | string | Html string containing the text of the application in french
&nbsp;&nbsp;&nbsp;&nbsp;it | string | Html string containing the text of the application in italian
&nbsp;&nbsp;&nbsp;&nbsp;en | string | Html string containing the text of the application in english
&nbsp;&nbsp;url | hash | containing the url of the application for 4 languages
&nbsp;&nbsp;&nbsp;&nbsp;de | string | String containing the url of the application in german
&nbsp;&nbsp;&nbsp;&nbsp;fr | string | String containing the url of the application in french
&nbsp;&nbsp;&nbsp;&nbsp;en | string | String containing the url of the application in english
&nbsp;&nbsp;&nbsp;&nbsp;it | string | String containing the url of the application in italian

#### Example

```json
{
  "eventType":"TenancyApplication.Dossier.Received",
  "data":{
    "title":
      {
        "de":"Neue Bewerbung für Gartenstrasse 1",
        "fr":"Nouveau dossier pour la Gartenstrasse 1",
        "it":"Neue Bewerbung für Gartenstrasse 1",
        "en":"New dossier for Gartenstrasse 1"
      },
      "text":
      {
        "de":"Bewerbung A<br>22.02.2020",
        "fr":"Dossier A<br>22.02.2020",
        "it":"Bewerbung A<br>22.02.2020",
        "en":"Dossier A<br>22.02.2020"
      },
      "url":
      {
        "de":"http://aroov.ch/de/bewerbung/201",
        "fr":"http://aroov.ch/fr/bewerbung/201",
        "it":"http://aroov.ch/it/bewerbung/201",
        "en":"http://aroov.ch/en/bewerbung/201"
      },
    "unitReference":"1234.01.0001"
    }
  }
}
```

### TenancyApplication.Dossier.Processed

Field | Type | Content / Remarks
---|---|---
eventType | string | TenancyApplication.Dossier.Processed
data | hash |
&nbsp;&nbsp;unitReference | string | String referencing an existing unit in the target GARAIO REM |

#### Example

```json
{"eventType":"TenancyApplication.Dossier.Processed",
  "data":{
    "unitReference":"1234.01.0001"
    }
  }
}
```
