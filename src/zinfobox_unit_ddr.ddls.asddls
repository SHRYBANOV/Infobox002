@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Довідник підрозділів'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZINFOBOX_UNIT_DDR
  as select from ZINFOBOX_UNIT_DD
{
      @ObjectModel.text.element: ['description']
      @UI.hidden: true
  key id_unit,
      @EndUserText.label: 'Підрозділ'
      @UI: {lineItem:      [ { position: 10, label: 'Підрозділ', importance: #HIGH }  ],
              identification: [ { position: 10, label: 'Підрозділ'  } ] }
      unit,
      @UI: {lineItem:      [ { position: 20, label: 'Опис', importance: #HIGH }  ],
            identification: [ { position: 20, label: 'Опис'  } ] }
      description,
      @UI.hidden: true
      createdat,
      @UI.hidden: true
      updatedat
}
