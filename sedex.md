# Sedex Context
## Events
Type | Status | Description
---|---|---
[Sedex.Message.Received](#sedexmessagereceived) |  | A message has been recevied from Sedex

## Commands
Request/Reply|Type | Status | Description |
---|---|--- |---
Request | [Sedex.Message.Send](#sedexmessagesend) | | Requests a message being sent over Sedex 
Reply | [Sedex.Message.SendReply](#sedexmessagesendreply)  | | The Sedex-Receipt confirming a message 

## Details
### Sedex.Message.Received
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Message.Received
data | hash |

#### Additional Header Properties
#### Example
```json
TODO
```

### Sedex.Message.Send
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Message.Send
data | hash ||
#### Additional Header Properties
#### Example
```json
TODO
```

### Sedex.Message.SendReply
Field | Type | Content / Remarks
---|---|---
eventType | string | Sedex.Message.SendReply
data | hash ||
#### Additional Header Properties
#### Example
```json
TODO
```
