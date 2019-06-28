# REM-Cloud Message Bus API
[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO AG. The REM-Cloud Message Bus connects
these systems and enables other organisations to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/).
RabbitMQ itself implements [AMQP](https://www.amqp.org/).
## Access
If you wish to access the REM-Cloud Message Bus please contact us on [garaio-rem@garaio.com](mailto:youraddress@ucsc.edu).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
-|-
app-id | An app-id (Unique Application ID) (e.g: 'YourService'). The app-id is also the name of your queue from which you can retrieve your messages
userid / password | Login  credentials for RabbitMQ
exchange-name | The name of the exchange to which you can send messages

## Messages
### Headers
Unless specified otherwise all messages must specify at least the following AMQP header properties:

Property | Value | Example | Description
-|-|-|-
app-id| \<app-id> | 'YourService' or 'REMCustomerA'  | Uniquely identifies the sender of a message
content-type| application/json || Message content is formatted as JSON
message-id | \<app-id>-\<app-specific-uid>| 'YourService-7712897' | Uniquely identifies a message. The app specific uid is an alphanumeric, app wide unique key
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created

Apps may add additional properties as needed

### Events
Events are messages that can be received by multiple subscribers. The message body contains a json data structure (see details for each event below). Following messages are defined as events:

Type | Description
-|-
[Masterdata.Property.Created](#masterdatapropertycreated) | A new property has been created
[Masterdata.Property.Updated](#masterdatapropertyupdated) | Data associated to a property has changed; you get changed attributes only
[Masterdata.House.Created](#masterdatahousecreated) | A house has been created
[Masterdata.House.Updated](#masterdatahouseupdated) | Data associated to a house has changed; you get the reference plus all changed attributes
[Masterdata.House.Deleted](#masterdatahousedeleted) | The house was deleted
[Masterdata.Unit.Created](#masterdataunitcreated) | A rentable unit has been created
[Masterdata.Unit.Updated](#masterdataunitupdated) | Data associated to a rentable unit has changed; you get the reference plus all changed attributes
[Masterdata.Unit.Deleted](#masterdataunitdeleted) | The unit was deleted
|||
[Letting.Tenancy.Created](#lettingtenancycreated) | A tenancy has been created; does not reliably signal a tenant move in. A tenancy is uniquely identified by contract reference, tentant reference and unit reference
[Letting.Tenancy.Updated](#lettingtenancyupdated) | Start and / or end date of a tenancy have been changed
[Letting.Tenancy.Deleted](#lettingtenancydeleted) | A tenancy has been deleted; this means that the tenancy never became effective

#### Masterdata.Property.Created
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.Property.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;description | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{"eventType":"Masterdata.Property.Created",
  "data":{
    "reference":"1234",
    "description":"my property",
    "zipCode":"3000",
    "city":"Bern",
    "countryCode":"CH"
  }
}
```
#### Masterdata.Property.Updated
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.Property.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;description | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{"eventType":"Masterdata.Property.Updated",
  "data":{
    "reference":"1234",
    "description":"my property renamed"
  }
}
```

#### Masterdata.House.Created
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.House.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the house; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | might be null
&nbsp;&nbsp;numberOfElevators | integer | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | might be null
&nbsp;&nbsp;egid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | street name including the house number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{"eventType": "Masterdata.House.Created",
  "data":{
    "reference":"1234.01",
    "description":"a house",
    "numberOfElevators":null,
    "numberOfFloorsAboveGround":3,
    "numberOfFloorsBelowGround":null,
    "egid":123456,
    "street":"Bahnhofstrasse 23",
    "zipCode":"3000",
    "city":"Bern",
    "countryCode":"CH"
  }
}
```

#### Masterdata.House.Updated
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.House.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the house; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | might be null
&nbsp;&nbsp;numberOfElevators | integer | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | might be null
&nbsp;&nbsp;egid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | street name including the house number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{"eventType":"Masterdata.House.Updated",
  "data":{
    "reference":"1234.01",
    "street":"Bahnhofstrasse 23a"
  }
}
```

#### Masterdata.House.Deleted
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.House.Deleted
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the house; the first segment of the key is the property reference, eg '1234.01'

##### Example

```json
{"eventType":"Masterdata.House.Deleted",
  "data":{
    "reference":"1234.01"
  }
}
```

#### Masterdata.Unit.Created
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.Unit.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the house reference eg '1234.01.0001'
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the initial load data
&nbsp;&nbsp;numberOfRooms | string | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null

##### Example

```json
{"eventType":"Masterdata.Unit.Created",
  "data":{
    "reference":"1234.01.0001",
    "unitTypeCode":"01",
    "numberOfRooms":"3.5",
    "ewid":123456,
    "bfsId":"A654321",
  }
}
```

#### Masterdata.Unit.Updated
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.House.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the house reference eg '1234.01.0001'
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the initial load data
&nbsp;&nbsp;numberOfRooms | string | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null

##### Example

```json
{"eventType":"Masterdata.Unit.Updated",
  "data":{
    "reference":"1234.01.0001",
    "numberOfRooms":"3.0"
  }
}
```

#### Masterdata.Unit.Deleted
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.House.Deleted
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the house reference eg '1234.01.0001'

##### Example

```json
{"eventType":"Masterdata.Unit.Deleted",
  "data":{
    "reference":"1234.01.0001"
  }
}
```

#### Letting.Tenancy.Created
Field | Type | Content / Remarks
-|-|-
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
-|-|-
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
-|-|-
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
