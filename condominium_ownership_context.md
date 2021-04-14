# Condominium Ownership Context

## Events

Type | GARAIO REM | REM | Description
---|---|---|---
[`Condominium.Ownership.Created`](#condominiumownershipcreated) | :heavy_check_mark: | :x: | A condominium ownership was added to the system
[`Condominium.Ownership.Updated`](#condominiumownershipupdated) | :heavy_check_mark: | :x: | Some condominium data was updated
[`Condominium.Ownership.Deleted`](#condominiumownershipdeleted) | :heavy_check_mark: | :x: | A condominium ownership has been deleted

### `Condominium.Ownership.Created`

Field | Type | Content / Remarks
---|---|---
`eventType` | `string` | `Condominium.Ownership.Created`
`data` | `hash` |
&nbsp;&nbsp;`startDate` | `string` | ISO 8601 encoded date, e.g. `2019-05-25`
&nbsp;&nbsp;`unitReference` | `string` | unique unit identifier, e.g. `234.01.0001`
&nbsp;&nbsp;`owner` | `hash` |
&nbsp;&nbsp;&nbsp;&nbsp;`reference` | `string` | owner reference; uniquely identifies a person
&nbsp;&nbsp;&nbsp;&nbsp;`salutationLines` | `array` of `string` | This field contains a list of salutations. This might not correspond to the amount of `nameLines`. |
&nbsp;&nbsp;&nbsp;&nbsp;`nameLines` | `array` of `string` | This field contains a list of names. This might not correspond to the amount of `salutationLines`. |
&nbsp;&nbsp;&nbsp;&nbsp;`languageCode` | `string` | `de`, `fr`, `it` or `en`
&nbsp;&nbsp;&nbsp;&nbsp;`nationalityCode` | `string` | ISO country code, e.g. `CH`
&nbsp;&nbsp;&nbsp;&nbsp;`phoneNumber` | `string` | might be `null`
&nbsp;&nbsp;&nbsp;&nbsp;`email` | `string` | might be `null`

#### Example

```json
{"eventType":"Condominium.Ownership.Created",
  "data":{
    "accessionDate":"2019-05-01",
    "effectiveAccessionDate":"2019-05-01",
    "unitReference":"10001.786.29",
    "owner":{
      "reference":"100004",
      "salutationLines":[
        "Sehr geehrter Herr Mustermann"
      ],
      "nameLines":[
        "Hans Mustermann",
        "Erika Mustermann"
      ],
      "languageCode":"de",
      "nationalityCode":"AT",
      "phoneNumber":"+41 31 331 21 11",
      "email":"email@test-mail.xy"
    }
  }
}
```

### `Condominium.Ownership.Updated`

Field | Type | Content / Remarks
---|---|---
`eventType` | `string` | `Condominium.Ownership.Updated`
`data` | `hash` |
&nbsp;&nbsp;`startDate` | `string` | ISO 8601 encoded date, e.g. `2019-05-25`
&nbsp;&nbsp;`unitReference` | `string` | unique unit identifier, e.g. `234.01.0001`
&nbsp;&nbsp;`owner` | `hash` |
&nbsp;&nbsp;&nbsp;&nbsp;`reference` | `string` | owner reference; uniquely identifies a person
&nbsp;&nbsp;&nbsp;&nbsp;`salutationLines` | `array` of `string` | This field contains a list of salutations. This might not correspond to the amount of `nameLines`. |
&nbsp;&nbsp;&nbsp;&nbsp;`nameLines` | `array` of `string` | This field contains a list of names. This might not correspond to the amount of `salutationLines`. |
&nbsp;&nbsp;&nbsp;&nbsp;`languageCode` | `string` | `de`, `fr`, `it` or `en`
&nbsp;&nbsp;&nbsp;&nbsp;`nationalityCode` | `string` | ISO country code, e.g. `CH`
&nbsp;&nbsp;&nbsp;&nbsp;`phoneNumber` | `string` | might be `null`
&nbsp;&nbsp;&nbsp;&nbsp;`email` | `string` | might be `null`

#### Example

```json
{"eventType":"Condominium.Ownership.Updated",
  "data":{
    "accessionDate":"2019-05-01",
    "effectiveAccessionDate":"2019-05-01",
    "unitReference":"10001.786.29",
    "owner":{
      "reference":"100004",
      "salutationLines":[
        "Sehr geehrter Herr Mustermann"
      ],
      "nameLines":[
        "Hans Mustermann",
        "Erika Mustermann"
      ],
      "languageCode":"de",
      "nationalityCode":"AT",
      "phoneNumber":"+41 31 331 21 11",
      "email":"email@test-mail.xy"
    }
  }
}
```

### `Condominium.Ownership.Deleted`

Field | Type | Content / Remarks
---|---|---
`eventType` | `string` | `Condominium.Ownership.Deleted`
`data` | `hash` |
&nbsp;&nbsp;`unitReference` | `string` | unique unit identifier, e.g. `234.01.0001`, might be `null`
&nbsp;&nbsp;`startDate` | `string` | ISO 8601 encoded date, e.g. `2019-05-25`
&nbsp;&nbsp;`endDate` | `string` | ISO 8601 encoded date, e.g. `2019-05-25`
&nbsp;&nbsp;`owner` | `hash` |
&nbsp;&nbsp;&nbsp;&nbsp;`reference` | `string` | owner reference; uniquely identifies a person

#### Example

```json
{"eventType":"Condominium.Ownership.Deleted",
  "data":{
    "unitReference":"10001.786.29",
    "startDate":"2021-04-08",
    "endDate":"2021-04-08",
    "owner":{
      "reference":"100010"
    }
  }
}
```
