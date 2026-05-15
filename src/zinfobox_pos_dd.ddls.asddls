@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник посад'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_POS_DD
  as select from zposition
{
      @ObjectModel.text.element: ['description']
      @UI.hidden: true
  key id_pos,
      @EndUserText.label: 'Посада'
      positions,
      description,
      createdat,
      updatedat
}
