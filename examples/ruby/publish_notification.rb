# Ruby Script as an executable message publishing spec. In order to make it work, you need
# ruby and the bunny gem: https://github.com/ruby-amqp/bunny
require 'bunny'
require 'json'

# Credentials and message recipient; if you don't know these, please contact your GARAIO REM
# service manager
service_name   = '<your_service>'
password       = '<your_password>'
recipient      = 'grem_<your_customer>'

# As an example, we send a notification message
# See the specs here: https://github.com/garaio/remcloud-message-bus-api/blob/master/notification_context.md#notificationmessagecreated
message_type   = 'Notification.Message.Created'
payload        = { externalReference: 'case_0001',
                   mimetype:          'text/plain',
                   message:           'Hello from the other side'
                 }

rabbitmq_session = Bunny.new(host:     'mbus.garaio-rem.ch',
                             vhost:    '/',
                             port:     5671,
                             ssl:      true,
                             username: service_name,
                             password: password).start
channel = rabbitmq_session.create_channel
exchange = channel.topic "#{service_name}_publish", durable: true, no_declare: true

message_properties = { app_id:       service_name,
                       content_type: 'application/json',
                       timestamp:    Time.now.utc.to_i,
                       persistent:   true,
                       headers: {
                         app_id:    service_name,
                         recipient: recipient
                       },
                       routing_key: message_type }

message_body = { eventType: message_type,
                 data:      payload
               }

exchange.publish message_body.to_json, message_properties
