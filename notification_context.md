# Notification Context

## Events

Type | GARAIO REM | REM | Description
---|---|---|---
[Notification.Message.Created](#notificationmessagecreated) | :heavy_check_mark: | :x: | A notification message has been created

### Notification.Message.Created

This message represents a message from a messaging participant to a GARAIO REM instance. Set the recipient property in the headers, eg "grem_derham"

Field | Type | Content / Remarks
---|---|---
eventType | string | Notification.Message.Created
data | hash |
&nbsp;&nbsp;externalReference | string | external, unique case identifier; **required**
&nbsp;&nbsp;masterdataReference | string | optional reference of a property / building / unit
&nbsp;&nbsp;sender | string | optional sender info (email address, name...)
&nbsp;&nbsp;mimetype | string | mimetype describing the message format (text/plain, text/markdown...); **required**
&nbsp;&nbsp;message | string | notification message; **required**
&nbsp;&nbsp;backlinkUrl | string | optional url to navigate to the sending system; **must be an url that the local browser can resolve**

#### Example

```json
{"eventType":"Notification.Message.Created",
  "data":{
    "externalReference":"1234",
    "masterdataReference":"4712.01.0001",
    "sender":"max.muster@mailprovider.com",
    "mimetype":"text/plain",
    "message":"something happened",
    "backlinkUrl":"https://instance.external_system.ch/case/3",
  }
}
```
