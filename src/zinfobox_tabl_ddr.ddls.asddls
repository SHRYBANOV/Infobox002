@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Таблеграмма'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZINFOBOX_TABL_DDR
  as select from ZINFOBOX_TABL_DD
{
      @UI.facet:
       [ {position : 10 , type : #IDENTIFICATION_REFERENCE ,label: 'Таблеграмма'}]
      @UI.hidden: true
  key IdTab,
      @UI: {lineItem:      [ { position: 10, label: 'Детальна структура', importance: #HIGH }  ],
            identification: [ { position: 10, label: 'Детальна структура'  } ] }
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZINFOBOX_STRUK_DD' , element: 'Value' },
          distinctValues: true }]
      @ObjectModel.text.element: ['StDescr']
      @UI.textArrangement: #TEXT_ONLY
      Struktura,
      @UI.hidden: true
      StDescr,
      @UI: {lineItem:      [ { position: 20, label: 'Від рабіт', importance: #HIGH }  ],
            identification: [ { position: 20, label: 'Від рабіт'  } ] }
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZINFOBOX_VIDR_DD' , element: 'Value' },
          distinctValues: true }]
      @ObjectModel.text.element: ['VidDescr']
      @UI.textArrangement: #TEXT_ONLY
      VidRobot,
      @UI.hidden: true
      VidDescr,
      @UI: {lineItem:      [ { position: 30, label: 'Дата робіт', importance: #HIGH }  ],
            identification: [ { position: 30, label: 'Дата робіт'  } ] }
      Datarobot,
      @UI: {lineItem:      [ { position: 40, label: 'Оплачено', importance: #HIGH }  ],
            identification: [ { position: 40, label: 'Оплачено'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Oplacheno,
      @UI: {lineItem:      [ { position: 50, label: 'Надбавки', importance: #HIGH }  ],
            identification: [ { position: 50, label: 'Надбавки'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Nadbavki,
      @UI: {lineItem:      [ { position: 60, label: 'Аванс', importance: #HIGH }  ],
            identification: [ { position: 60, label: 'Аванс'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Avans,
      @UI: {lineItem:      [ { position: 70, label: 'ЗП', importance: #HIGH }  ],
           identification: [ { position: 70, label: 'ЗП'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Zarplata,
      @UI: {lineItem:      [ { position: 80, label: 'Благодійний внесок', importance: #HIGH }  ],
           identification: [ { position: 80, label: 'Благодійний внесок'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Blagvnesok,
      @UI: {lineItem:      [ { position: 90, label: 'Виконавча', importance: #HIGH }  ],
           identification: [ { position: 90, label: 'Виконавча'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Vykonavcha,
      @Semantics.amount.currencyCode: 'Currencycode'
      @UI: {lineItem:      [ { position: 100, label: 'ПДФО', importance: #HIGH }  ],
           identification: [ { position: 100, label: 'ПДФО'  } ] }
      Pdfo,
      @UI: {lineItem:      [ { position: 110, label: 'Війсковий збір', importance: #HIGH }  ],
           identification: [ { position: 110, label: 'Війсковий збір'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Viyskovi,
      @UI: {lineItem:      [ { position: 120, label: 'Заява на утримання', importance: #HIGH }  ],
           identification: [ { position: 120, label: 'Заява на утримання'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Utrymannia,
      @UI: {lineItem:      [ { position: 130, label: 'Базова доплата', importance: #HIGH }  ],
           identification: [ { position: 130, label: 'Базова доплата'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Doplbaz,
      @UI: {lineItem:      [ { position: 140, label: 'Доплата за класність', importance: #HIGH }  ],
           identification: [ { position: 140, label: 'Доплата за класність'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Doplklass,
      @UI: {lineItem:      [ { position: 150, label: 'Доплата за стаж', importance: #HIGH }  ],
           identification: [ { position: 150, label: 'Доплата за стаж'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Doplstaj,
      @UI: {lineItem:      [ { position: 160, label: 'Премія по СЗ', importance: #HIGH }  ],
           identification: [ { position: 160, label: 'Премія по СЗ'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      PremSz,
      @UI: {lineItem:      [ { position: 170, label: 'Лікарняні', importance: #HIGH }  ],
           identification: [ { position: 170, label: 'Лікарняні'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Likarni,
      @UI: {lineItem:      [ { position: 180, label: 'Відпускні', importance: #HIGH }  ],
           identification: [ { position: 180, label: 'Відпускні'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Vidpuskni,
      @UI: {lineItem:      [ { position: 190, label: 'Бережливе ставлення', importance: #HIGH }  ],
           identification: [ { position: 190, label: 'Бережливе ставлення'  } ] }
      @Semantics.amount.currencyCode: 'Currencycode'
      Berejlivi,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency' , element: 'Currency' } }]
      Currencycode,
      @UI.hidden: true
      Createdat,
      @UI.hidden: true
      Updatedat,

      _STRUK,
      _VIDRAB
}
