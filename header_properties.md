# Header Properties
All message must contain following header properties:

Property | Value | Example | Description
---|---|---|---
app_id | \<app_id> | headers: { app_id: 'YourService' }  | In order to be able to route the messages we need the app id in the headers, too

# Additional Header Properties
Some message or event specifications mention additional header properties. These are:

Property | Value | Example | Description
---|---|---|---
local_authority | true or false | headers: { local_authority: true }  | A value of true indicates that an event can be forwarded to local authorities (Gemeinden)
