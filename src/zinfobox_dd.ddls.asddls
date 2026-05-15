@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Инфобокс'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define root view entity ZINFOBOX_DD
  as select from zpersonal
  association [0..1] to ZINFOBOX_STATUS_DD as _VAC_S  on  _VAC_S.Name          = 'ZD_STATUS4'
                                                      and _VAC_S.ValuePosition = $projection.Status
  association [0..1] to zinfobox_org_dd    as _ORG_S  on  _ORG_S.id_org = $projection.Organization
  association [0..1] to ZINFOBOX_DEP_DD    as _DEP_S  on  _DEP_S.id_dep = $projection.Department
  association [0..1] to ZINFOBOX_POS_DD    as _POS_S  on  _POS_S.id_pos = $projection.Positions
  association [0..1] to ZINFOBOX_UNIT_DD   as _UNIT_S on  _UNIT_S.id_unit = $projection.Unit
{
      @UI.hidden: true
  key id                                                    as ID,
      //@UI.hidden: true
      //@Aggregation.default: #SUM
      // @Consumption.semanticObject: 'zinfobox_dep'
      tabnum                                                as Tabnum,
      @UI.defaultValue: '#CONSTANT'
      concat_with_space('Табельний №', ltrim(tabnum,'0'),1) as Tabnum_txt,
      telnum                                                as Telnum,
      @UI.dataPoint : { qualifier: '_FN' }
      @Search: { defaultSearchElement : true, fuzzinessThreshold: 0.90 }
      @UI.selectionField: [{ position: 10 }]
      //      @Aggregation.default: #NONE
      @Semantics.name.givenName: true
      firstname                                             as Firstname,
      @UI.dataPoint : { qualifier: '_LN' }
      @UI.selectionField: [{ position: 20 }]
      @Semantics.name.familyName: true
      lastname                                              as Lastname,
      @UI.dataPoint : { qualifier: '_SN' }
      @UI.selectionField: [{ position: 30 }]
      @Semantics.name.additionalName: true
      secondname                                            as Secondname,
      datebirth                                             as Datebirth,
      @ObjectModel.text.element: ['Descr2']
      organization                                          as Organization,
      _ORG_S.organization                                   as Descr2,
      @ObjectModel.text.element: ['Descr3']
      department                                            as Department,
      _DEP_S.department                                     as Descr3,
      @ObjectModel.text.element: ['Descr4']
      unit                                                  as Unit,
      _UNIT_S.unit                                          as Descr4,
      @ObjectModel.text.element: ['Descr5']
      positions                                             as Positions,
      _POS_S.positions                                      as Descr5,
      dateofadoption                                        as Dateofadoption,
      @ObjectModel.text.element: ['Descr']
      status                                                as Status,
      _VAC_S.Description                                    as Descr,
      @Semantics.imageUrl: true
      @Semantics.largeObject: {
      mimeType: 'MimeType',
      fileName: 'Filename',
      contentDispositionPreference: #INLINE }
      attachement                                           as Photo,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'Filename',
      acceptableMimeTypes: ['image/png', 'image/jpeg', 'application/pdf'],
      contentDispositionPreference: #INLINE }
      attachement                                           as Attachment,
      @Semantics.mimeType: true
      @UI.hidden: true
      mimetype                                              as MimeType,
      @UI.hidden: true
      filename                                              as Filename,
      @Semantics.systemDateTime.createdAt: true
      createdat                                             as Createdat,
      @Semantics.systemDateTime.lastChangedAt: true
      updatedat                                             as Updatedat,
      //      @Aggregation.default: #SUM
      //        1 as ItemsCount,
      _VAC_S,
      _ORG_S,
      _DEP_S,
      _POS_S,
      _UNIT_S
}
