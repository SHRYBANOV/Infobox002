@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник підрозділов'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_UNIT_DD
  as select from zunit_1
{
      @ObjectModel.text.element: ['description']
      @UI.hidden: true
  key id_unit,
      @EndUserText.label: 'Підрозділ'
      unit,
      description,
      createdat,
      updatedat
}
