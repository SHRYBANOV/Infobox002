@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Таблеграмма'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZINFOBOX_TABL_DD 
as select from ztablegramma
  association [0..1] to ZINFOBOX_STRUK_DD as _STRUK on  _STRUK.Name          = 'ZD_STRUKTURA'
                                                     and _STRUK.Value = $projection.Struktura
  association [0..1] to ZINFOBOX_VIDR_DD as _VIDRAB on  _VIDRAB.Name          = 'ZD_VIDROBOT'
                                                     and _VIDRAB.ValuePosition = $projection.VidRobot
{
    key id_tab as IdTab,
    struktura as Struktura,
    _STRUK.Description as StDescr,
    vid_robot as VidRobot,
    _VIDRAB.Description as VidDescr,
    datarobot as Datarobot,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    oplacheno as Oplacheno,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    nadbavki as Nadbavki,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    avans as Avans,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    zarplata as Zarplata,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    blagvnesok as Blagvnesok,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    vykonavcha as Vykonavcha,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    pdfo as Pdfo,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    viyskovi as Viyskovi,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    utrymannia as Utrymannia,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    doplbaz as Doplbaz,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    doplklass as Doplklass,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    doplstaj as Doplstaj,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    prem_sz as PremSz,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    likarni as Likarni,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    vidpuskni as Vidpuskni,
    @Semantics.amount.currencyCode: 'CURRENCYCODE'
    berejlivi as Berejlivi,
    currencycode as Currencycode,
    @Semantics.systemDateTime.createdAt: true
    createdat as Createdat,
    @Semantics.systemDateTime.lastChangedAt: true
    updatedat as Updatedat,
    
    _STRUK,
    _VIDRAB
}
