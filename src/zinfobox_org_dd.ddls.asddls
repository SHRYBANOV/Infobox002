@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник организации'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity zinfobox_org_dd
  as select from zorganizations
{
      @ObjectModel.text.element: ['description']
      @UI.hidden: true
  key id_org,
      @EndUserText.label: 'Організація'
      organization,
      description,
      createdat,
      updatedat
}
