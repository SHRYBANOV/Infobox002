@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник статуса по домену'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_STAPL_DD
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'ZD_STATUS5') as Value
  association [0..1] to DDCDS_CUSTOMER_DOMAIN_VALUE_T as _Text on  Value.domain_name    = _Text.domain_name
                                                               and Value.value_position = _Text.value_position
                                                               and _Text.language       = $session.system_language
{
      @UI.hidden: true
  key Value.domain_name                          as Name,
      @UI.hidden: true
  key Value.value_position                       as ValuePosition,
      @ObjectModel.text.element: ['Description']
      @UI.textArrangement: #TEXT_ONLY
      Value.value_low                            as Value,
      @Semantics.text: true
      _Text( p_domain_name : 'ZD_STATUS5' ).text as Description
}
