# REM-Cloud Message Bus API
[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO AG. The REM-Cloud Message Bus connects
these systems and enables other organisation to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/). 
RabbitMQ itself implements [AMQP](https://www.amqp.org/).
## Access
If you wish to access the REM-Cloud Message Bus please contact us on [garaio-rem@garaio.com](mailto:youraddress@ucsc.edu).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
-|-
app-id | an app-id (Unique Application ID) (e.g: 'YourService')
queue-name | the name of a queue from where your messages can be retrieved |
exchange-name | the name of an exchange to which you can send messages |

## Messages
Unless specified otherwise all messages must specify following AMQP-properties:
### Basic Header Properties
Property | Value | Example | Description 
-|-
app-id| \<app-id> | 'YourService' or 'REMCustomerA'  | Uniquely identifies the sender of a message |
content-encoding | UTF-8 || Message content is encoded in UTF-8 |
content-type| application/json || Message content is formatted as JSON |
message-id | \<app-id>-\<sequence>| 'YourService-7712897' | Uniquely identifies a message. Each message must have its unique sequence number. |
correlation-id | \<app-id>-\<sequence> | 'REMCustomerA-459974' or empty | If a message was triggered by another message the correlation-id must contain the original message-id. Otherwise it can be left empty. |
timestamp | Unix timestamp | '1553245964' | A timestamp to indicate when the message was created. |
### Extended Header Properties
Property | Value | Example | Description 
-|-
headers.origin | \<app-id> | 'REMCustomerA' | Specifies to which REM customer a message relates to. This information is used to implement [multitenancy](https://en.wikipedia.org/wiki/Multitenancy). |

### Events
routing-key | type | content/body | Description | 
-|-|-|-
n/a | Provisioning.Provisioned | [content](./contents/Provisioning.Provisioned.json) | |


### Commands