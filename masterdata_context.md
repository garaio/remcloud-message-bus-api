# Masterdata Context

## Events

Type | GARAIO REM | REM | Description
---|---|---|---
[Masterdata.Property.Created](#masterdatapropertycreated) | x | Draft | A new property has been created
[Masterdata.Property.Updated](#masterdatapropertyupdated) | x | Draft | Data associated to a property has changed; you get changed attributes only
[Masterdata.Property.TagAdded](#masterdatapropertytagadded) | x | | A tag was added to a property; please read the specs for this event carefully
[Masterdata.Property.TagRemoved](#masterdatapropertytagremoved) | x | | A tag was removed from a property; please read the specs for this event carefully
[Masterdata.Building.Created](#masterdatabuildingcreated) | x | Draft | A building has been created
[Masterdata.Building.Updated](#masterdatabuildingupdated) | x | Draft | Data associated to a building has changed; you get the reference plus all changed attributes
[Masterdata.Building.Deleted](#masterdatabuildingdeleted) | x | Draft | The building was deleted
[Masterdata.Unit.Created](#masterdataunitcreated) | x | Draft | A rentable unit has been created
[Masterdata.Unit.Updated](#masterdataunitupdated) | x | Draft | Data associated to a rentable unit has changed; you get the reference plus all changed attributes
[Masterdata.Unit.Deleted](#masterdataunitdeleted) | x | Draft | The unit was deleted
[Masterdata.Unit.ReferenceChanged](#masterdataunitreferencechanged) | x | Draft | The unit reference has changed
[Masterdata.ManagementTeam.Updated](#masterdatamanagementteamupdated) | x | | A change to a property management team was applied; only changed roles are published
[Masterdata.Configuration.SedexIdChanged](#masterdataconfigurationsedexidchanged) | | x | A new SedexID has been configured |

### Masterdata.Property.Created

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Property.Created
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the property
&nbsp;&nbsp;description | string | x | Draft |
&nbsp;&nbsp;zipCode | string | x | Draft |
&nbsp;&nbsp;city | string | x | Draft |
&nbsp;&nbsp;countryCode | string | x | Draft | ISO country code, eg 'CH'
&nbsp;&nbsp;mandateTerminatedBy | string | Deprecated | | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;startOfAdministration | string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;endOfAdministration | string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'

#### Example

```json
{"eventType":"Masterdata.Property.Created",
  "data":{
    "reference":"1234",
    "description":"my property",
    "zipCode":"3000",
    "city":"Bern",
    "countryCode":"CH",
    "endOfAdministration": "2018-12-31"
  }
}
```

### Masterdata.Property.Updated

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Property.Updated
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the property
&nbsp;&nbsp;description | string | x | Draft |
&nbsp;&nbsp;zipCode | string | x | Draft |
&nbsp;&nbsp;city | string | x | Draft |
&nbsp;&nbsp;countryCode | string | x | Draft | ISO country code, eg 'CH'
&nbsp;&nbsp;mandateTerminatedBy | string | Deprecated | | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;startOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;endOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'

#### Example

```json
{"eventType":"Masterdata.Property.Updated",
  "data":{
    "reference":"1234",
    "description":"my property renamed",
    "endOfAdministration": "2018-12-31"
  }
}
```

### Masterdata.Property.TagAdded

If you receive this event and your service has tag constraints (you only 'see' properties tagged with certain tags), this means than an existing property has been tagged with a tag visible to you.

To get the complete data set for this property, use the GraphQL query ```property(reference: String!): Property```

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | | Masterdata.Property.TagAdded
data | hash | x | |
&nbsp;&nbsp;reference | string | x | | unique identifier for the property
&nbsp;&nbsp;tag | string | x | | The tag that was added

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | | Masterdata.Property.TagRemoved
data | hash | x | |
&nbsp;&nbsp;reference | string | x | | unique identifier for the property
&nbsp;&nbsp;tag | string | x | | The tag that was removed

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Building.Created
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | x | Draft | might be null
&nbsp;&nbsp;numberOfElevators | integer | x | Draft | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | x | | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | x | | might be null
&nbsp;&nbsp;egid | integer | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | x | Draft | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string | x | Draft |
&nbsp;&nbsp;city | string | x | Draft |
&nbsp;&nbsp;countryCode | string | x | Draft | ISO country code, eg 'CH'
&nbsp;&nbsp;wgs84Position | hash | x | Draft | Geo Coordinates
&nbsp;&nbsp;&nbsp;latitude | decimal | x | Draft | Latitude
&nbsp;&nbsp;&nbsp;longitude | decimal | x | Draft | Longitude
&nbsp;&nbsp;startOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;endOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'

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
    "countryCode":"CH",
    "wgs84Position":{
      "latitude":44.640672,
      "longitude":4.756836
    }
  }
}
```

### Masterdata.Building.Updated

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Building.Updated
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'
&nbsp;&nbsp;description | string | x | Draft | might be null
&nbsp;&nbsp;numberOfElevators | integer | x | Draft | might be null
&nbsp;&nbsp;numberOfFloorsAboveGround | integer | x | Draft | might be null
&nbsp;&nbsp;numberOfFloorsBelowGround | integer | x | Draft | might be null
&nbsp;&nbsp;egid | integer | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;street | string | x | Draft | street name including the building number where appropriate
&nbsp;&nbsp;zipCode | string | x | Draft |
&nbsp;&nbsp;city | string | x | Draft |
&nbsp;&nbsp;countryCode | string | x | Draft | ISO country code, eg 'CH'
&nbsp;&nbsp;wgs84Position | hash | x | Draft | Geo Coordinates
&nbsp;&nbsp;&nbsp;latitude | decimal | x | Draft | Latitude
&nbsp;&nbsp;&nbsp;longitude | decimal | x | Draft | Longitude
&nbsp;&nbsp;startOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;endOfAdministration | string | Draft | Draft | ISO 8601 encoded date, eg '2019-03-01'

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Building.Deleted
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the building; the first segment of the key is the property reference, eg '1234.01'

#### Example

```json
{"eventType":"Masterdata.Building.Deleted",
  "data":{
    "reference":"1234.01"
  }
}
```

### Masterdata.Unit.Created

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Unit.Created
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;unitCategoryCode | string | x | | code to identify the unit category; the list of unit categories is part of the Graphql API
&nbsp;&nbsp;unitTypeCode | string | x | Draft | code to identify the unit type; the list of unit types is part of the Graphql API
&nbsp;&nbsp;storeyCode | string | x | Draft | code to identify the unit storey; the list of storeys is part of the Graphql API; might be null
&nbsp;&nbsp;location | string | x | Draft | location of the unit, where appropriate, eg left, middle, right; this is free text and might be null
&nbsp;&nbsp;numberOfRooms | string | x | Draft | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null
&nbsp;&nbsp;validFrom | string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;validUntil| string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Building.Updated
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;unitCategoryCode | string | x | N/A | code to identify the unit category; the list of unit categories is part of the Graphql API
&nbsp;&nbsp;unitTypeCode | string | x | Draft | code to identify the unit type; the list of unit types is part of the Graphql API
&nbsp;&nbsp;storeyCode | string | x | Draft | code to identify the unit storey; the list of storeys is part of the Graphql API; might be null
&nbsp;&nbsp;location | string | x | Draft | location of the unit, where appropriate, eg left, middle, right; this is free text and might be null
&nbsp;&nbsp;numberOfRooms | string | x | Draft | number of rooms as a decimal, eg "3.5"; might be null
&nbsp;&nbsp;ewid | integer | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/personenregister/registerharmonisierung/minimaler-inhalt-einwohnerregister/egid-ewid.html), might be null
&nbsp;&nbsp;bfsId | string | x | Draft | [read about it](https://www.bfs.admin.ch/bfs/de/home/register/gebaeude-wohnungsregister/gebaeudeadressen.html), might be null
&nbsp;&nbsp;validFrom | string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;validUntil| string | x | Draft | ISO 8601 encoded date, eg '2019-03-01'

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Building.Deleted
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | Draft | Masterdata.Unit.ReferenceChanged
data | hash | x | Draft |
&nbsp;&nbsp;reference | string | x | Draft | unique identifier for the unit; the first segment of the key is the property reference, the second is the building reference eg '1234.01.0001'
&nbsp;&nbsp;newReference | string | x | Draft | new identifier for the unit

#### Example

```json
{"eventType":"Masterdata.Unit.ReferenceChanged",
  "data":{
    "reference":"1234.01.0001",
    "newReference":"1234.01.0002",
  }
}
```

### Masterdata.ManagementTeam.Updated

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | x | | Masterdata.ManagementTeam.Updated
data | hash | x | |
&nbsp;&nbsp;propertyReference | string | x | | unique identifier for the property
&nbsp;&nbsp;managementTeamChanges | array | x | |
&nbsp;&nbsp;&nbsp;&nbsp;userRoleCode | string | x | | user role code, eg R001
&nbsp;&nbsp;&nbsp;&nbsp;surname | string | x | |
&nbsp;&nbsp;&nbsp;&nbsp;firstName | string | x | |
&nbsp;&nbsp;&nbsp;&nbsp;languageCode | string | x | | de, fr, it or en
&nbsp;&nbsp;&nbsp;&nbsp;phoneNumber | string | x | |
&nbsp;&nbsp;&nbsp;&nbsp;email | string | x | |

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

Field | Type | GARAIO REM | REM | Content / Remarks
---|---|---|---|---
eventType | string | | x | Masterdata.Configuration.SedexIdChanged
data | hash | | x |
&nbsp;&nbsp;sedexId | string | | x | the new SedexID (e.g. T4-123456-2); A value null means the previously used SedexID is not valid anymore.

#### Example

```json
{"eventType":"Masterdata.Configuration.SedexIdChanged",
  "data":{
    "sedexId":"T-123456-2"
  }
}
```
