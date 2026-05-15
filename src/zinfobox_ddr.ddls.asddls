@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Инфобокс'
@Metadata.allowExtensions: true

define root view entity ZINFOBOX_DDR
provider contract transactional_query
as projection on ZINFOBOX_DD
{
      @UI.hidden: true
  key ID,
      Tabnum,
      Tabnum_txt,
      Telnum,
      Firstname,
      Lastname,
      Secondname,
      Datebirth,
      Organization,
      Descr2,
      Department,
      Descr3,
      Unit,
      Descr4,
      Positions,
      Descr5,
      Dateofadoption,
      Status,
      Descr,
      Photo,
      Attachment,
      MimeType,
      Filename,
      Createdat,
      Updatedat,

      _VAC_S,
      _ORG_S,
      _DEP_S,
      _POS_S,
      _UNIT_S
}
