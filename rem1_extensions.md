# REM 1 Extensions
REM 1 Extensions are Messages and Events that only REM 1 issues. They may or may not be adopted by G-REM.
# Masterdata Context
## Events
Type | GARAIO REM | REM | Description
---|---|---
[Masterdata.Configuration.ApiUrlChanged](#masterdataconfigurationapiurlchanged) | | x | The url to the graphql api has changed |
[Masterdata.Configuration.ApiCredentialsChanged](#masterdataconfigurationapicredentialschanged) | | x | The credentials to the graphql api have changed |

### Masterdata.Configuration.ApiUrlChanged

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Configuration.ApiUrlChanged
data | hash |
&nbsp;&nbsp;url| string | the new url (e.g. https://rem.customer.ch/api); A value null means that the Api is not available anymore.|
&nbsp;&nbsp;authenticationUrl| string | the new url for authentication (e.g. https://rem.customer.ch/oauth2/token); A value null means that the authentication endpoint is not available anymore.|

#### Example

```json
{"eventType":"Masterdata.Configuration.ApiUrlChanged",
  "data":{
    "url":"https://rem.customer.ch/api",
    "authenticationUrl":"https://rem.customer.ch/oauth2/token"
  }
}
```

### Masterdata.Configuration.ApiCredentialsChanged

Field | Type | Content / Remarks
---|---|---
eventType | string | Masterdata.Configuration.ApiCredentialsChanged
data | hash |
&nbsp;&nbsp;secret| string | the new secret(e.g. 46Yr!ew3jjeX). The value must not be null.|

#### Example

```json
{"eventType":"Masterdata.Configuration.ApiCredentialsChanged",
  "data":{
    "secret":"46Yr!ew3jjeX"
  }
}
```


