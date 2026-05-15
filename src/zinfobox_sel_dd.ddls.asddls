@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Выбор справочника для корректировки'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZINFOBOX_SEL_DD
  as select from I_Language
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['Description']
  key 'DEP'         as ActionCode,
      'Департамент' as Description
}
union all select from I_Language
{
  key 'ORG'         as ActionCode,
      'Організація' as Description
}
union all select from I_Language
{
  key 'POS'    as ActionCode,
      'Посада' as Description
}
union all select from I_Language
{
  key 'UNI'       as ActionCode,
      'Підрозділ' as Description
}
where
  Language = 'R'
