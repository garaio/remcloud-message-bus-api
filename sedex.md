# Sedex Context
## Events
Type | Status | Description
---|---|---
[Sedex.Messaging.Received](#sedexmessagingreceived) |  | A message has been received from Sedex

## Commands
Request/Reply|Type | Status | Description |
---|---|--- |---
Request | [Sedex.Messaging.SendMessage](#sedexmessagingsendmessage) | | Requests a message being sent over Sedex 
Reply | [Sedex.Messaging.MessageSent](#sedexmessagingmessagesent)  | | The Sedex-Receipt confirming a message 

## Details
### Sedex.Messaging.Received
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Messaging.Received
data | hash |

#### Additional Header Properties
#### Example
```json
TODO
```

### Sedex.Messaging.SendMessage
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Messaging.SendMessage
data | hash ||
#### Additional Header Properties
#### Example
```json
TODO
```

### Sedex.Messaging.MessageSent
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Messaging.MessageSent
data | hash ||
#### Additional Header Properties
#### Example
```json
TODO
```
