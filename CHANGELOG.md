# CHANGE LOG for REM-Cloud Message Bus API

## GaraioREM v1.16

- 11.08.2022 - **Invoicing.Invoice.Created** (SwissQRCode v2.2 fully-compliant)

  Corrected API - compliant with SIX SwissQRCode Standard v2.2 - now `addInfo` fields are correctly nested within `rmtInf`
  ```
    rmtInf: {
      tp: ,
      ref: ,
      addInf: {
        ustrd: ,
        trailer: ,
        strdBkgInf:
      }
    }
  ```

  Until v1.16 GREM was non-compliant with SIX SwissQRCode Standard v2.2 it had defined `addInf` attributes at the TopLevel of a SwissQRCode invoice
  ```
    rmtInf: {
      tp: ,
      ref:
    },
    addInf: {
      ustrd: ,
      trailer: ,
      strdBkgInf:
    }
  ```
