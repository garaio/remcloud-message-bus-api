﻿# REM-Cloud Message Bus API

[REM](https://www.garaio-rem.ch/) (Real Estate Management) is a suite of products and systems developed by GARAIO REM AG. The REM-Cloud Message Bus connects
these systems and enables other organisations to integrate with REM. The REM-Cloud Message Bus is a [RabbitMQ Message Bus](https://www.rabbitmq.com/).
RabbitMQ itself implements [AMQP](https://www.amqp.org/).

## Access

If you wish to access the REM-Cloud Message Bus please contact us on [info@garaio-rem.ch](mailto:info@garaio-rem.ch).

Once you're granted access, credentials and access details are sent to you. The access details contain:

Detail | Description
---|---
app id | An app id (Unique Application ID) (e.g: `'YourService'`). The app id is also the name of your queue from which you can retrieve your messages
user id / password | Login  credentials for RabbitMQ
exchange name | The name of the exchange to which you can send messages

## About this specification

Messages in this specification have a specification status. These status are:

Status | Meaning
---|---
:heavy_check_mark:| The information is available and will not change without further notice. |
:x:| The information is not available. |
:warning:| The information is deprecated and may become invalid in future releases. |

Please remember that only the master branch of this documentation reflects the current state of our productive REM systems.
Other branches are used to describe new or amended information applicable to future releases of our REM systems.

## Messages

### Message Properties

All messages must specify at least the following AMQP message properties:

Property | Value | Example | Description
---|---|---|---
`app_id`| `<app_id>` | `'YourService'` or `'REMCustomerA'`  | Uniquely identifies the sender of a message
`user_id`| `<user_id>` | `'YourService'` or `'REMCustomerA'` | Uniquely identifies the authenticated RabbitMQ user
`content_type`| `application/json `|| The content type must always be JSON |
`content_encoding` | `UTF-8` || The message encoding must always be UTF-8 |
`event_id` | `<app_id>-<app_specific_uid>`| `'YourService-7712897'` | Uniquely identifies the event that _caused_ this message. The app specific uid is an alphanumeric, app wide unique key
`message_id` | `<app_id>-<app_specific_uid>-<message_id_string>`| `'YourService-7712897-c693a9100ec6d6dd75ed0b8e631286f4'` | Uniquely identifies a message. The app specific uid is an alphanumeric, app wide unique key
`timestamp` | Unix timestamp | `1553245964` | A timestamp to indicate when the message was created

### Headers

The headers are part of the message properties and must specify at least the app id.

Property | Type | Value | Example | Description
---|---|---|---|---
`app_id` | `string` | `<app_id>` | `headers: { app_id: 'YourService' }`  | In order to be able to route the messages we need the app id in the headers, too

Some messages must contain additional properties. Please refer to [Header Properties](/header_properties.md) for more information.

### Events

Events are messages that can be received by multiple subscribers. The message body contains a json data structure.

## Contexts

Events are grouped by contexts. A context relates to a certain subdomain within the domain of property management,
or to a domain outside of property management.

Context | Description
---|---
[Letting](letting_context.md)| Events related to the letting process
[Masterdata](masterdata_context.md)| Informs about changed data in the context of Property, Buildings and Units
[Planning Application](planning_application.md)| Events related to planning applications
[Sedex](sedex.md) | Allows clients to send and receive Sedex-Messages
[Tenancy Application](tenancy_application_context.md)| Events related to tenancy applications
[Tenant Portal](tenant_portal.md)| Events that occur on a Tenant Portal
[Thirdparty Notification](thirdparty_notification.md) | Events that related to a Thirdparty Notification. This events are issued by the Thirdparty Notification Service (Drittmeldung Service)
