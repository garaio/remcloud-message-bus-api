# Thirdparty Notification Context
Thirdparty Notifications are not meant to be implemented by external services.

## Events
Type | Status | Description
---|---|---
[ThirdpartyNotification.Tenancy.MoveInNotified](#thirdpartynotificationtenancymoveinnotified) | :heavy_check_mark: | A thirdparty has confirmed the receipt of a move-in notification
[ThirdpartyNotification.Tenancy.MoveOutNotified](#thirdpartynotificationtenancymoveoutnotified) | :heavy_check_mark: | A thirdparty has confirmed the receipt of a move-out notification
[ThirdpartyNotification.Tenancy.MoveInNotificationFailed](#thirdpartynotificationtenancymoveinnotificationfailed) | :heavy_check_mark: | Sending a move-out notification to the third party has failed
[ThirdpartyNotification.Tenancy.MoveOutNotificationFailed](#thirdpartynotificationtenancymoveoutnotificationfailed) | :heavy_check_mark: | Sending a move-in notification to the third party has failed

## Commands
Request/Reply| Type | Status | Description
---|---|---|---
Request | [ThirdpartyNotification.GraphQL.Query](#thirdpartynotificationgraphqlquery) | :heavy_check_mark: | Requests Information (via GraphQL) related to Third-Parties
Reply | [ThirdpartyNotification.GraphQL.QueryReply](#thirdpartynotificationgraphqlqueryreply)  | :heavy_check_mark: | Reply to a GraphQL-Query

## Details
### ThirdpartyNotification.Tenancy.MoveInNotified
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.Tenancy.MoveInNotified
data | hash |
&nbsp;&nbsp;tenancyStartDate | string | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;tenancyAgreementReference| string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference|string|unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string | LocalAuthority or ElectricityNetworkOperator
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the recipient, eg '1-261-1' for the local authorities in Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the recipient received the notification, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains the receipt returned by the recipient. eg an XML or just a transaction or message identifier

#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
TODO

### ThirdpartyNotification.Tenancy.MoveOutNotified
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.Tenancy.MoveOutNotified
data | hash |
&nbsp;&nbsp;tenancyEndDate | string | ISO 8601 encoded date, eg '2019-03-31'
&nbsp;&nbsp;tenancyAgreementReference| string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference|string|unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string |  LocalAuthority or ElectricityNetworkOperator
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the recipient, eg '1-261-1' for the local authorities in Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the recipient received the notification, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains the receipt returned by the recipient. eg an XML or just a transaction or message identifier 

#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
TODO

### ThirdpartyNotification.Tenancy.MoveInNotificationFailed
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.Tenancy.MoveInNotificationFailed
data | hash |
&nbsp;&nbsp;tenancyStartDate | string | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;tenancyAgreementReference| string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference|string|unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string | LocalAuthority or ElectricityNetworkOperator
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the recipient, eg '1-261-1' for the local authorities in Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the notification was declined or error occurred, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains information regarding the failure. eg an XML or just an error text detailing the problem.
#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
TODO

### ThirdpartyNotification.Tenancy.MoveOutNotificationFailed
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.Tenancy.MoveOutNotificationFailed
data | hash |
&nbsp;&nbsp;tenancyEndDate | string | ISO 8601 encoded date, eg '2019-03-31'
&nbsp;&nbsp;tenancyAgreementReference| string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference|string|unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenantReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string |  LocalAuthority or ElectricityNetworkOperator
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the recipient, eg '1-261-1' for the local authorities in Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the notification was declined or error occurred, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains information regarding the failure. eg an XML or just an error text detailing the problem.
#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
TODO
### ThirdpartyNotification.GraphQL.Query
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.GraphQL.Query
data | hash ||
&nbsp;&nbsp;query |  string | the GraphQL-Query. eg 'query Authorities($type: String){thirdParties(type:$type){reference}}'
&nbsp;&nbsp;variables | hash | empty or the GraphQL-Variables. eg '{"type":"LocalAuthority"}'
&nbsp;&nbsp;operationName | string | the GraphQL-Operation. null or eg 'Authorities'
#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
```json
{
  "eventType":"ThirdpartyNotification.GraphQL.Query",
  "data":{
    "query":"query($type:String){thirdParties(type:$type){reference}}",
    "variables": {"type":"LocalAuthority"},
    "operationName":null
  }
}
```

### ThirdpartyNotification.GraphQL.QueryReply
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.GraphQL.QueryReply
data | hash ||
&nbsp;&nbsp;data | hash | The GraphQL query result. In case of error this field is not present.
&nbsp;&nbsp;errors | array  | The GraphQL query errors. This field is only present when an error occurred.
#### Additional Header Properties
[recipient](/header_properties.md/#AdditionalHeaderProperties)
#### Example
```json
{
  "eventType":"ThirdpartyNotification.GraphQL.QueryReply",
  "data":{
    "data":{
      "thirdParties":[{"reference":"6"},{"reference":"42"},{"reference":"4236"}]
    }
  }
}
```
or in case of an error
```json
{
  "eventType":"ThirdpartyNotification.GraphQL.QueryReply",
  "data":{
    "errors":[{"message":"Variable $type is declared by  but not used","locations":[{"line":1,"column":1}],"path":["query"],"extensions":{"code":"variableNotUsed","variableName":"type"}},{"message":"Variable $typffe is used by  but not declared","locations":[{"line":1,"column":39}],"path":["query","thirdParties","type"],"extensions":{"code":"variableNotDefined","variableName":"typffe"}}]
  }
}
```
