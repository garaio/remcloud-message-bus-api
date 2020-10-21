# Orders and Invoicing Context

## Events

Type | Status | Description
---|---|---
[Invoicing.Invoice.Created](#invoicinginvoicecreated) | | An invoice has been created

### Invoicing.Invoice.Created

All attributes are mandatory unless noted otherwise in the remarks

Field | Type | Content / Remarks
---|---|---
eventType | string | Invoicing.Invoice.Created
data | hash |
&nbsp;&nbsp;externalReference | string | unique external identifier from the invoice provider
&nbsp;&nbsp;orderReference | string | optional reference of the associated order
&nbsp;&nbsp;creditorReference | string | reference of the creditor (supplier)
&nbsp;&nbsp;accountingReference | string | reference of the accounting
&nbsp;&nbsp;iban | string | iban for the payment (optional). Always pass the iban if you know it and leave the esr attributes empty
&nbsp;&nbsp;esrReference | string | Reference number on the payment slip. Pass this number together with the esrParticipantNumber if you don't have an iban
&nbsp;&nbsp;esrParticipantNumber | string | Reference number on the payment slip. Pass this number together with the esrReference if you don't have an iban
&nbsp;&nbsp;invoiceDate | string | ISO 8601 encoded date, eg '2020-10-21'
&nbsp;&nbsp;dueDate | string | ISO 8601 encoded date, eg '2020-10-21'
&nbsp;&nbsp;bookingDate | string | ISO 8601 encoded date, eg '2020-10-21' **(to be discussed)**
&nbsp;&nbsp;userId | string | user id of the GARAIO REM user **(to be discussed)**
&nbsp;&nbsp;notes | string | Notes for the invoice (optional)
&nbsp;&nbsp;invoiceLines | array | at least one line is required
&nbsp;&nbsp;&nbsp;&nbsp;accountNumber | string | Accounting account number, prefixed by the accounting reference, eg "6056.10122"
&nbsp;&nbsp;&nbsp;&nbsp;costCenterNumber | string | Cost center number; might be required depending on the accountNumber
&nbsp;&nbsp;&nbsp;&nbsp;taxCode | string | Tax code known to GARAIO REM, eg 'NO'; might be required depending on the accountNumber
&nbsp;&nbsp;&nbsp;&nbsp;bookingAmount | decimal | amount to book (including taxes, if appropriate)
&nbsp;&nbsp;&nbsp;&nbsp;bookingText | string | Optional booking text
&nbsp;&nbsp;&nbsp;&nbsp;masterdataReference | string | Optional reference of a property / building / unit; might be required depending on the accountNumber
&nbsp;&nbsp;&nbsp;&nbsp;valueDate | string | ISO 8601 encoded date, eg '2020-10-21' (Valuta)
&nbsp;&nbsp;&nbsp;&nbsp;amount | decimal | Required depending on the accountNumber, eg. litres of oil
&nbsp;&nbsp;transitoryDeferralDate | string | ISO 8601 encoded date, eg '2020-10-21', optional (transitorisches Abgrenzungsdatum)

#### Example

```json
{"eventType":"Invoicing.Invoice.Created",
  "data":{
    "externalReference":"1234",
    "orderReference":"5678",
    "creditorReference":"5555",
    "accountingReference":"4711",
    "iban":"CH0209000000100013997",
    "invoiceDate":"2020-10-21",
    "dueDate":"2020-11-21",
    "bookingDate":"2020-10-21",
    "userId":"gersan",
    "notes":"some infos concerning the invoice",
    "invoiceLines:[
      {"accountNumber":"4712.100001",
       "costCenterNumber":"700",
       "taxCode":"00",
       "bookingAmount":1200.50,
       "bookingText":"this goes into the booking movement",
       "masterdataReference":"4712.01",
       "valueDate":"2020-10-21",
       "amount":100.00,
       "transitoryDeferralDate":"2020-12-31",
      }
    ]
  }
}
```

## Message Flows

### Invoice submission happy path

GARAIO REM receives an invoice that passes the validations, stores the invoice, creates the booking and sends the InvoiceAccepted message back to the invoice provider with the external invoice reference

![Alt text](./sequence_diagrams/invoicing/invoice_submission_happy_path.svg)

### Invoice validation errors

GARAIO REM receives an invoice that does not pass the validations, does NOT store the invoice and sends the InvoiceRejected message back to the invoice provider with the external invoice reference and the reasons (validation errors)

![Alt text](./sequence_diagrams/invoicing/invoice_validation_errors.svg)

### Invoice cancelled

GARAIO REM receives an invoice that passes the validations, stores the invoice, creates the booking and sends the InvoiceAccepted message back to the invoice provider with the external invoice reference

Later, a user cancels the invoice and GARAIO REM sends the InvoiceCancelled message back to the invoice provider with the external invoice reference

![Alt text](./sequence_diagrams/invoicing/invoice_cancelled.svg)

### Invoice payed

GARAIO REM receives an invoice that passes the validations, stores the invoice, creates the booking and sends the InvoiceAccepted message back to the invoice provider with the external invoice reference

Later, GARAIO REM pays the invoice and GARAIO REM sends the InvoicePayed message back to the invoice provider with the external invoice reference

![Alt text](./sequence_diagrams/invoicing/invoice_payed.svg)
