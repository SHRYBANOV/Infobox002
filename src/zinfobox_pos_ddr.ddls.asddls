@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Довідник посад'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZINFOBOX_POS_DDR
  as select from ZINFOBOX_POS_DD
{
      @UI.facet:
      [ {position : 10 , type : #IDENTIFICATION_REFERENCE ,label: 'Посада'}]
      @UI.hidden: true
  key id_pos,
      @UI: {lineItem:      [ { position: 10, label: 'Посада', importance: #HIGH }  ],
             identification: [ { position: 10, label: 'Посада'  } ] }
      positions,
      @UI: {lineItem:      [ { position: 20, label: 'Опис', importance: #HIGH }  ],
            identification: [ { position: 20, label: 'Опис'  } ] }
      description,
      @UI.hidden: true
      createdat,
      @UI.hidden: true
      updatedat
}
