# Masterdata Context

## Events

Type | GARAIO REM | REM | Description
---|---|---|---
[Masterdata.Property.Created](#masterdatapropertycreated) | :heavy_check_mark: | :x: | A new property has been created
[Masterdata.Property.Updated](#masterdatapropertyupdated) | :heavy_check_mark: | :x: | Data associated to a property has changed; you get changed attributes only
[Masterdata.Property.TagAdded](#masterdatapropertytagadded) | :heavy_check_mark: | :x: | A tag was added to a property; please read the specs for this event carefully
[Masterdata.Property.TagRemoved](#masterdatapropertytagremoved) | :heavy_check_mark: | :x: | A tag was removed from a property; please read the specs for this event carefully
[Masterdata.Building.Created](#masterdatabuildingcreated) | :heavy_check_mark: | :x: | A building has been created
[Masterdata.Building.Updated](#masterdatabuildingupdated) | :heavy_check_mark: | :x: | Data associated to a building has changed; you get the reference plus all changed attributes
[Masterdata.Building.Deleted](#masterdatabuildingdeleted) | :heavy_check_mark: | :x: | The building was deleted
[Masterdata.Unit.Created](#masterdataunitcreated) | :heavy_check_mark: | :x: | A rentable unit has been created
[Masterdata.Unit.Updated](#masterdataunitupdated) | :heavy_check_mark: | :x: | Data associated to a rentable unit has changed; you get the reference plus all changed attributes
[Masterdata.Unit.Deleted](#masterdataunitdeleted) | :heavy_check_mark: | :x: | The unit was deleted
[Masterdata.Unit.ReferenceChanged](#masterdataunitreferencechanged) | :heavy_check_mark: | :x: | The unit reference has changed
[Masterdata.ManagementTeam.Updated](#masterdatamanagementteamupdated) | :heavy_check_mark: | :x: | A change to a property management team was applied; only changed roles are published
[Masterdata.Configuration.SedexIdChanged](#masterdataconfigurationsedexidchanged) | :x: | :heavy_check_mark: | A new SedexID has been configured |

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
&nbsp;&nbsp;mandateTerminatedBy | string | ISO date, eg '2018-12-31'

#### Example

```json
{"eventType":"Masterdata.Property.Created",
  "data":{
    "reference":"1234",
    "description":"my property",
    "zipCode":"3000",
    "city":"Bern",
    "countryCode":"CH",
    "mandateTerminatedBy": "2018-12-31"
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
&nbsp;&nbsp;mandateTerminatedBy | string | ISO date, eg '2018-12-31'

#### Example

```json
{"eventType":"Masterdata.Property.Updated",
  "data":{
    "reference":"1234",
    "description":"my property renamed",
    "mandateTerminatedBy": "2018-12-31"
  }
}
```

### Masterdata.Property.TagAdded

If you receive this event and your service has tag constraints (you only 'see' properties tagged with certain tags), this means than an existing property has been tagged with a tag visible to you.

To get the complete data set for this property, use the GraphQL query ```property(reference: String!): Property```

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Property.TagAdded
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;tag | string | The tag that was added

#### Example

```json
{"eventType":"Masterdata.Property.TagAdded",
  "data":{
    "reference":"1234",
    "tag":"t001"
  }
}
```

### Masterdata.Property.TagRemoved

If you receive this event and your service has tag constraints (you only 'see' properties tagged with certain tags), this means that a tag visible to you has been removed from this property.

This is the very last event that you get for this property and you must remove it from your local domain model (if you store property data).

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Property.TagRemoved
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;tag | string | The tag that was removed

#### Example

```json
{"eventType":"Masterdata.Property.TagRemoved",
  "data":{
    "reference":"1234",
    "tag":"t001"
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
&nbsp;&nbsp;mandateTerminatedBy | string | ISO date, eg '2018-12-31', might be null
&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;wgs84Position | hash | Geo Coordinates
&nbsp;&nbsp;&nbsp;latitude | decimal | Latitude
&nbsp;&nbsp;&nbsp;longitude | decimal | Longitude

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
    "mandateTerminatedBy": "2025-05-31",
    "street":"Bahnhofstrasse 23",
    "zipCode":"3000",
    "city":"Bern",
    "countryCode":"CH",
    "wgs84Position":{
      "latitude":44.640672,
      "longitude":4.756836
    }
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
&nbsp;&nbsp;mandateTerminatedBy | string | ISO date, eg '2018-12-31', might be null
&nbsp;&nbsp;street | string | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'
&nbsp;&nbsp;wgs84Position | hash | Geo Coordinates; only presesnt if the geo coordinates have changed
&nbsp;&nbsp;&nbsp;latitude | decimal | Latitude
&nbsp;&nbsp;&nbsp;longitude | decimal | Longitude

#### Example

```json
{"eventType":"Masterdata.Building.Updated",
  "data":{
    "reference":"1234.01",
    "street":"Bahnhofstrasse 23a",
    "wgs84Position":{
      "latitude":44.640672,
      "longitude":4.756836
    }
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
&nbsp;&nbsp;unitCategoryCode | string | code to identify the unit category; the list of unit categories is part of the Graphql API
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the Graphql API
&nbsp;&nbsp;storeyCode | string | code to identify the unit storey; the list of storeys is part of the Graphql API; might be null
&nbsp;&nbsp;location | string | location of the unit, where appropriate, eg left, middle, right; this is free text and might be null
&nbsp;&nbsp;numberOfRooms | string | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null

#### Example

```json
{"eventType":"Masterdata.Unit.Created",
  "data":{
    "reference":"1234.01.0001",
    "unitCategoryCode":"1",
    "unitTypeCode":"01",
    "storeyCode":"1",
    "location":"links",
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
&nbsp;&nbsp;unitCategoryCode | string | code to identify the unit category; the list of unit categories is part of the Graphql API
&nbsp;&nbsp;unitTypeCode | string | code to identify the unit type; the list of unit types is part of the Graphql API
&nbsp;&nbsp;storeyCode | string | code to identify the unit storey; the list of storeys is part of the Graphql API; might be null
&nbsp;&nbsp;location | string | location of the unit, where appropriate, eg left, middle, right; this is free text and might be null
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

### Masterdata.Unit.ReferenceChanged

A user might change the reference of a unit in GARAIO REM. This event reflects such a change. If you store unit data in a local domain model you must apply this change to your data.

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Unit.ReferenceChanged
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;newReference | string | new identifier for the unit

#### Example

```json
{"eventType":"Masterdata.Unit.ReferenceChanged",
  "data":{
    "reference":"1234.01.0001",
    "newReference":"1234.01.0002"
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
