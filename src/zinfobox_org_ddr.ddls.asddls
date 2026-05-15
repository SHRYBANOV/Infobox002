@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Довідник організаціі'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZINFOBOX_ORG_DDR
  as select from zinfobox_org_dd
{
      @UI.facet:
      [ {position : 10 , type : #IDENTIFICATION_REFERENCE ,label: 'Організація'}]
      @UI.hidden: true
  key id_org,
      @UI: {lineItem:      [ { position: 10, label: 'Організація', importance: #HIGH }  ],
             identification: [ { position: 10, label: 'Організація'  } ] }
      organization,
      @UI: {lineItem:      [ { position: 20, label: 'Опис', importance: #HIGH }  ],
            identification: [ { position: 20, label: 'Опис'  } ] }
      description,
      @UI.hidden: true
      createdat,
      @UI.hidden: true
      updatedat
}
