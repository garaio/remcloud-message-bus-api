# Thirdparty Notification Context
## Events
Type | Status | Description
---|---|---
[ThirdpartyNotification.Tenancy.MoveInNotified](#thirdpartynotificationtenancymoveinnotified) |  | A thirdparty has confirmed the receipt of a move-in notification
[ThirdpartyNotification.Tenancy.MoveOutNotified](#thirdpartynotificationtenancymoveoutnotified) |  | A thirdparty has confirmed the receipt of a move-out notification

### ThirdpartyNotification.Tenancy.MoveInNotified
Field | Type | Content / Remarks
---|---|---
eventType | string |ThirdpartyNotification.Tenancy.MoveInNotified
data | hash |
&nbsp;&nbsp;tenancyStartDate | string | ISO 8601 encoded date, eg '2019-03-01'
&nbsp;&nbsp;tenancyAgreementReference| string | unique tenancy agreement identifier, eg '1234.01.0001.01'
&nbsp;&nbsp;unitReference|string|unique unit identifier, eg '234.01.0001'
&nbsp;&nbsp;tenenatReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string | LocalAuthority
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the local authority, eg '1-261-1' for Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the recipient received the notification, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains the receipt returned by the recipient. eg an XML or just a transaction or message identifier 

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
&nbsp;&nbsp;tenenatReference | string | tenant reference; uniquely identifies a person, eg '133123'
&nbsp;&nbsp;receipt | hash |
&nbsp;&nbsp;&nbsp;&nbsp;recipientType | string | LocalAuthority
&nbsp;&nbsp;&nbsp;&nbsp;recipientReference| string | unique identifier of the local authority, eg '1-261-1' for Zurich
&nbsp;&nbsp;&nbsp;&nbsp;date| string | the ISO 8601 encode date when the recipient received the notification, eg '2019-12-12T15:17:57.000Z'
&nbsp;&nbsp;&nbsp;&nbsp;content| string | contains the receipt returned by the recipient. eg an XML or just a transaction or message identifier 

#### Example
TODO

