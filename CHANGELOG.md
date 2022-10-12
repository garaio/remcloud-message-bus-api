# Changelog

## 1.16 (2022-08-17)

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
