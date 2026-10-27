@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PW test table 01 - view entity'
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo: {
  typeName: 'Test Line',
  typeNamePlural: 'Test Lines',
  title: { type: #STANDARD, value: 'LineId' },
  description: { type: #STANDARD, value: 'LineTxt' }
}
define view entity ZI_PW_TST1_01
  as select from zpw_tst1_01
{
      @UI.facet: [ {
        id: 'General',
        purpose: #STANDARD,
        type: #IDENTIFICATION_REFERENCE,
        label: 'General Information',
        position: 10
      } ]
      @UI.hidden: true
  key line_uuid as LineUuid,

      @EndUserText.label: 'Line ID'
      @Search.defaultSearchElement: true
      @UI.lineItem: [ { position: 10, importance: #HIGH } ]
      @UI.identification: [ { position: 10 } ]
      @UI.selectionField: [ { position: 10 } ]
      line_id   as LineId,

      @EndUserText.label: 'Line Text'
      @Search.defaultSearchElement: true
      @UI.lineItem: [ { position: 20, importance: #HIGH } ]
      @UI.identification: [ { position: 20 } ]
      @UI.selectionField: [ { position: 20 } ]
      line_txt  as LineTxt
}
