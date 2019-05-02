# REM-Cloud Message Bus API
[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO AG. The REM-Cloud Message Bus connects
these systems and enables other organisations to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/).
RabbitMQ itself implements [AMQP](https://www.amqp.org/).
## Access
If you wish to access the REM-Cloud Message Bus please contact us on [garaio-rem@garaio.com](mailto:youraddress@ucsc.edu).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
-|-
app-id | An app-id (Unique Application ID) (e.g: 'YourService'). The app-id is also the name of your queue from which you can retrieve your messages
userid / password | Login  credentials for RabbitMQ
exchange-name | The name of the exchange to which you can send messages

## Messages
### Headers
Unless specified otherwise all messages must specify following AMQP header properties:

Property | Value | Example | Description
-|-|-|-
app-id| \<app-id> | 'YourService' or 'REMCustomerA'  | Uniquely identifies the sender of a message |
content-type| application/json || Message content is formatted as JSON |
message-id | \<app-id>-\<app-specific-uid>| 'YourService-7712897' | Uniquely identifies a message. Each message must have its unique sequence number. The app specific uid is an alphanumeric, app wide unique key |
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created |

### Events
Events are messages that can be received by multiple subscribers. The message body contains a json data structure (see details for each event below). Following messages are defined as events.

Type | Description
-|-
Masterdata.Property.Created | A new property has been created
Masterdata.Property.Updated | Data associated to a property has changed; you get changed attributes only
Masterdata.House.Created | A house has been created
Masterdata.House.Updated | Data associated to a house has changed; you get changed attributes only
Masterdata.House.Deleted | The house was deleted
Masterdata.Unit.Created | A rentable unit has been created
Masterdata.Unit.Updated | Data associated to a rentable unit has changed; you get changed attributes only
Masterdata.Unit.Deleted | The unit was deleted
|||
Management.Property.ContactPersonChanged | Informs that the contact person for this property has changed
Management.Property.ManagementEnded | Informs that the REM customer ended managing a certain property
Management.Unit.TenantMovedIn | Informs that the tenant started renting the unit
Management.Unit.TenantMovedOut | Informs that the tenant stopped renting the unit

#### Masterdata.Property.Created
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.Property.Created
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;name | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{ "eventType": "Masterdata.Property.Created",
  "data": {
    "reference": "1234",
    "name": "my property",
    "zipCode": "3000",
    "city": "Bern",
    "countryCode": "CH"
  }
}
```
#### Masterdata.Property.Updated
Field | Type | Content / Remarks
-|-|-
eventType | string | Masterdata.Property.Updated
data | hash |
&nbsp;&nbsp;reference | string | unique identifier for the property
&nbsp;&nbsp;name | string |
&nbsp;&nbsp;zipCode | string |
&nbsp;&nbsp;city | string |
&nbsp;&nbsp;countryCode | string | ISO country code, eg 'CH'

##### Example

```json
{ "eventType": "Masterdata.Property.Updated",
  "data": {
    "reference": "1234",
    "name": "my property renamed"
  }
}
```
