# Masterdata Context
## Events
Type | Status | Description
---|---|---
[Masterdata.Property.Created](#masterdatapropertycreated) | | A new property has been created
[Masterdata.Property.Updated](#masterdatapropertyupdated) | | Data associated to a property has changed; you get changed attributes only
[Masterdata.Building.Created](#masterdatabuildingcreated) | | A building has been created
[Masterdata.Building.Updated](#masterdatabuildingupdated) | | Data associated to a building has changed; you get the reference plus all changed attributes
[Masterdata.Building.Deleted](#masterdatabuildingdeleted) | | The building was deleted
[Masterdata.Unit.Created](#masterdataunitcreated) | | A rentable unit has been created
[Masterdata.Unit.Updated](#masterdataunitupdated) | | Data associated to a rentable unit has changed; you get the reference plus all changed attributes
[Masterdata.Unit.Deleted](#masterdataunitdeleted) | | The unit was deleted
[Masterdata.ManagementTeam.Updated](#masterdatamanagementteamupdated) | | A change to a property management team was applied; only changed roles are published
[Masterdata.Configuration.SedexIdChanged](#masterdataconfigurationsedexidchanged) | Draft | A new SedexID has been configured |

### Masterdata.Property.Created

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Property.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;description | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

#### Example

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

### Masterdata.Property.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Property.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;description | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

#### Example

```json
{"eventType":"Masterdata.Property.Updated",
  "data":{
    "reference":"1234",
    "description":"my property renamed"
  }
}
```

### Masterdata.Building.Created

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Building.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | might be null
&nbsp;&nbsp;numberOfElevators | integer | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | might be null
&nbsp;&nbsp;egid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

#### Example

```json
{"eventType": "Masterdata.Building.Created",
  "data":{
    "reference":"1234.01",
    "description":"a building",
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

### Masterdata.Building.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Building.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | might be null
&nbsp;&nbsp;numberOfElevators | integer | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | might be null
&nbsp;&nbsp;egid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

#### Example

```json
{"eventType":"Masterdata.Building.Updated",
  "data":{
    "reference":"1234.01",
    "street":"Bahnhofstrasse 23a"
  }
}
```

### Masterdata.Building.Deleted

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Building.Deleted
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'

#### Example

```json
{"eventType":"Masterdata.Building.Deleted",
  "data":{
    "reference":"1234.01"
  }
}
```

### Masterdata.Unit.Created

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Unit.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the initial load data
&nbsp;&nbsp;numberOfRooms | string | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null

#### Example

```json
{"eventType":"Masterdata.Unit.Created",
  "data":{
    "reference":"1234.01.0001",
    "unitTypeCode":"01",
    "numberOfRooms":"3.5",
    "ewid":123456,
    "bfsId":"A654321"
  }
}
```

### Masterdata.Unit.Updated

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Building.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the initial load data
&nbsp;&nbsp;numberOfRooms | string | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null

#### Example

```json
{"eventType":"Masterdata.Unit.Updated",
  "data":{
    "reference":"1234.01.0001",
    "numberOfRooms":"3.0"
  }
}
```

### Masterdata.Unit.Deleted

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Building.Deleted
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'

#### Example

```json
{"eventType":"Masterdata.Unit.Deleted",
  "data":{
    "reference":"1234.01.0001"
  }
}
```


### Masterdata.ManagementTeam.Updated

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

#### Example

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

### Masterdata.Configuration.SedexIdChanged

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Configuration.SedexIdChanged
data | hash |
&nbsp;&nbsp;sedexId | string | the new SedexID (e.g. T4-123456-2); A value null means the previously used SedexID is not valid anymore.

#### Example

```json
{"eventType":"Masterdata.Configuration.SedexIdChanged",
  "data":{
    "sedexId":"T-123456-2"
  }
}
```

