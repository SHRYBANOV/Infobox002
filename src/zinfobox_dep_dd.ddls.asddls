@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник депортаментов'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_DEP_DD
  as select from zdepartment2
{
      @ObjectModel.text.element: ['description']
      @UI.hidden: true
  key id_dep,
      @EndUserText.label: 'Департамент'
      department,
      description,
      createdat,
      updatedat
}
