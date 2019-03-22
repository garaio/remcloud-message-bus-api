# REM-Cloud Message Bus API
[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO AG. The REM-Cloud Message Bus connects
these systems and enables other organisations to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/). 
RabbitMQ itself implements [AMQP](https://www.amqp.org/).
## Access
If you wish to access the REM-Cloud Message Bus please contact us on [garaio-rem@garaio.com](mailto:youraddress@ucsc.edu).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
-|-
app-id | An app-id (Unique Application ID) (e.g: 'YourService'). The app-id is also the name of your queue from which you can retrieve your messages.
exchange-name | The name of an exchange to which you can send messages.

## Messages
### Headers
Unless specified otherwise all messages must specify following AMQP header properties:

Property | Value | Example | Description 
-|-|-|-
app-id| \<app-id> | 'YourService' or 'REMCustomerA'  | Uniquely identifies the sender of a message |
content-encoding | UTF-8 || Message content is encoded in UTF-8 |
content-type| application/json || Message content is formatted as JSON |
message-id | \<app-id>-\<sequence>| 'YourService-7712897' | Uniquely identifies a message. Each message must have its unique sequence number. |
correlation-id | \<app-id>-\<sequence> | 'REMCustomerA-459974' or empty | If a message was triggered by another message the correlation-id must contain the original message-id. Otherwise it can be left empty. |
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created. |
headers.origin | \<app-id> | 'REMCustomerA' | Specifies to which REM customer a message relates to. This information is used to implement [multitenancy](https://en.wikipedia.org/wiki/Multitenancy). |

### Events
Events are messages that can be received by multiple subscribers. Following messages are defined as events. 

routing-key | type | content/body | Description 
-|-|-|-
n/a | Provisioning.Customer.Provisioned | [content](./contents/Provisioning.Customer.Provisioned.json) | Informs that a new application/service has been made available to a certain REM customer. This customer can start using that application now.|
n/a | Provisioning.Tenant.Provisioned |  [content](./contents/Provisioning.Tenant.Provisioned.json) | Informs that a tenant has been provisioned for a new application/service. This tenant can start using that application now.|
|||
n/a | Masterdata.Property.InitialData | [content](./contents/Masterdata.Property.InitialData.json) | Response to Provisioning.GetInitialData command. 
n/a | Masterdata.Property.Created |  | A new property has been created.
n/a | Masterdata.Property.Updated | | Data associated to a property have changed.
n/a | Masterdata.House.InitialData | | Response to Provisioning.GetInitialData command. 
n/a | Masterdata.House.Created || A house has been created.
n/a | Masterdata.House.Updated || Data associated to house have changed.
|||
n/a | Management.Property.ManagementEnded | | Informs that the REM customer ended managing a certain property.
n/a | Management.Object.TenantMovedIn | | Informs that the tenant moved into an object.
n/a | Management.Object.TenantMovedOut | | Informs that the tenant moved out of an object.


### Command/Replies
Commands are message that remain private between the sender and receiver.
Following messages are defined as command/replies:

routing-key | type | reply-to | content/body | Description 
-|-|-|-|-
? | Provisioning.GetInitialData | \<app-id>|  [content](./contents/Provisioning.GetInitialData.json) | Requests the receiver to send an initial data-dump |

