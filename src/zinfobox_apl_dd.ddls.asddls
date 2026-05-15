@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Мои заявки'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZINFOBOX_APL_DD
  as select from zmy_applications
  association [0..1] to ZINFOBOX_STAPL_DD as _VAC_SA on  _VAC_SA.Name          = 'ZD_STATUS5'
                                                     and _VAC_SA.ValuePosition = $projection.Status
  association [0..1] to ZINFOBOX_TYPE_DD as _TYP_S on  _TYP_S.Name          = 'ZD_TYPEVAC'
                                                     and _TYP_S.ValuePosition = $projection.Typevac
  association [0..1] to ZINFOBOX_DD       as _INF_S  on  _INF_S.ID = $projection.Person
{

@UI.hidden: true
  key id_apl    as ID_apl,
      applnum   as Applnum,
      @ObjectModel.text.element: ['Person_txt']
      person    as Person,
      @UI.defaultValue: '#CONSTANT'
      concat( concat_with_space(_INF_S.Lastname, left(_INF_S.Firstname, 1), 1),
              concat('.', concat(left(_INF_S.Secondname, 1), '.'))
            ) as Person_txt,
      @Search: { defaultSearchElement : true, fuzzinessThreshold: 0.90 }
      @UI.selectionField: [{ position: 10 }]      
      typevac   as Typevac,
      _TYP_S.Description as TypevacDescr,
      @UI.selectionField: [{ position: 20 }]
      created   as Created,
      @UI.selectionField: [{ position: 30 }]
      startdate as Startdate,
      daysvac   as Daysvac,
      status    as Status,
      _VAC_SA.Description as StatusDescr,
      createdat as Createdat,
      updatedat as Updatedat,

      _VAC_SA,
      _TYP_S,
      _INF_S
}
