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
content-encoding | UTF-8 || Message content is encoded in UTF-8 |
content-type| application/json || Message content is formatted as JSON |
message-id | \<app-id>-\<app-specific-uid>| 'YourService-7712897' | Uniquely identifies a message. Each message must have its unique sequence number. The app specific uid is an alphanumeric, app wide unique key |
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created |

### Events
Events are messages that can be received by multiple subscribers. Following messages are defined as events.

type | content/body | Description
-|-|-
Masterdata.Property.Created | tbd | A new property has been created
Masterdata.Property.Updated | tbd | Data associated to a property has changed
Masterdata.House.Created | tbd | A house has been created
Masterdata.House.Updated | tbd | Data associated to a house has changed
Masterdata.House.Deleted | tbd | The house was deleted
Masterdata.Unit.Created | tbd | A rentable unit has been created
Masterdata.Unit.Updated | tbd | Data associated to a rentable unit has changed
Masterdata.Unit.Deleted | tbd | The unit was deleted
|||
Management.Property.ContactPersonChanged | tbd | Informs that the contact person for this property has changed
Management.Property.ManagementEnded | tbd | Informs that the REM customer ended managing a certain property
Management.Unit.TenantMovedIn | tbd | Informs that the tenant started renting the unit
Management.Unit.TenantMovedOut | tbd | Informs that the tenant stopped renting the unit
