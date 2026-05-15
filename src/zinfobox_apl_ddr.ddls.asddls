@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Мои заявки'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZINFOBOX_APL_DDR
  as select from ZINFOBOX_APL_DD
{
      @UI.facet:
       [ {position : 10 , type : #IDENTIFICATION_REFERENCE ,label: 'Мои заявки'}]
      @UI.hidden: true
  key ID_apl,
      @UI: {lineItem:      [ { position: 10, label: 'Номер', importance: #HIGH }  ],
             identification: [ { position: 10, label: 'Номер'  } ] }
      Applnum,
      @UI: {lineItem:      [ { position: 20, label: 'Ініціатор', importance: #HIGH }  ],
             identification: [ { position: 20, label: 'Ініціатор'  } ] }
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZINFOBOX_SP_DD' , element: 'ID' } }]
      @ObjectModel.text.element: ['Person_txt']
      @UI.textArrangement: #TEXT_ONLY
      Person,
      @UI.hidden: true
      Person_txt,
      @UI: {lineItem:      [ { position: 30, label: 'Тип відпустки', importance: #HIGH }  ],
             identification: [ { position: 30, label: 'Тип відпустки'  } ] }
      @Consumption.valueHelpDefinition: [{ entity:
             { name: 'ZINFOBOX_TYPE_DD' , element: 'Value' },
                distinctValues: true
             }]
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['TypevacDescr']
      Typevac,
      @UI.hidden: true
      TypevacDescr,
      @UI: {lineItem:      [ { position: 40, label: 'Створено', importance: #HIGH }  ],
             identification: [ { position: 40, label: 'Створено'  } ] }
      Created,
      @UI: {lineItem:      [ { position: 50, label: 'Дата початку', importance: #HIGH }  ],
             identification: [ { position: 50, label: 'Дата початку'  } ] }
      Startdate,
      @UI: {lineItem:      [ { position: 60, label: 'Днів', importance: #HIGH }  ],
             identification: [ { position: 60, label: 'Днів'  } ] }
      Daysvac,
      @UI: {lineItem:      [ { position: 70, label: 'Статус', importance: #HIGH }  ],
             identification: [ { position: 70, label: 'Статус'  } ] }
      @Consumption.valueHelpDefinition: [{ entity:
             { name: 'ZINFOBOX_STAPL_DD' , element: 'Value' },
                distinctValues: true
             }]
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['StatusDescr']
      Status,
      @UI.hidden: true
      StatusDescr,
      @UI.hidden: true
      Createdat,
      @UI.hidden: true
      Updatedat,
      /* Associations */
      _INF_S,
      _TYP_S,
      _VAC_SA
}
