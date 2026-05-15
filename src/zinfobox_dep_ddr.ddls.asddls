@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Департамент'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZINFOBOX_DEP_DDR
  as select from ZINFOBOX_DEP_DD
{
      @UI.facet:
       [ {position : 10 , type : #IDENTIFICATION_REFERENCE ,label: 'Депортамент'}]
      @UI.hidden: true
  key id_dep,
      @UI: {lineItem:      [ { position: 10, label: 'Депортамент', importance: #HIGH }  ],
             identification: [ { position: 10, label: 'Депортамент'  } ] }
      department,
      @UI: {lineItem:      [ { position: 20, label: 'Опис', importance: #HIGH }  ],
            identification: [ { position: 20, label: 'Опис'  } ] }
      description,
      @UI.hidden: true
      createdat,
      @UI.hidden: true
      updatedat
}
