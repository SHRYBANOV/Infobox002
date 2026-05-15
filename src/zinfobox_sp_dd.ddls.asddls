@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Справочник персонала'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_SP_DD
  as select from zpersonal
{
      @ObjectModel.text.element: ['description']
      @UI.textArrangement: #TEXT_ONLY
  key id as ID,
      @Semantics.text: true
      @EndUserText.label: 'ІПП'
      concat( concat_with_space(lastname, left(firstname, 1), 1),
              concat('.', concat(left(secondname, 1), '.'))
            ) as description
}
