CLASS zcl_pw_tst01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    "! Fills table ZPW_TST1_01 with 10 test records (previous content is deleted)
    "! @parameter rv_count | Number of inserted records
    METHODS init_data
      RETURNING
        VALUE(rv_count) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pw_tst01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lv_count) = init_data( ).
    out->write( |Inserted { lv_count } records into ZPW_TST1_01.| ).
  ENDMETHOD.


  METHOD init_data.
    " test data is fixed in code, UUIDs are generated at runtime
    DATA(lt_data) = VALUE STANDARD TABLE OF zpw_tst1_01 WITH EMPTY KEY(
      ( line_id = 'LINE001' line_txt = 'Alpha' )
      ( line_id = 'LINE002' line_txt = 'Beta' )
      ( line_id = 'LINE003' line_txt = 'Gamma' )
      ( line_id = 'LINE004' line_txt = 'Delta' )
      ( line_id = 'LINE005' line_txt = 'Epsilon' )
      ( line_id = 'LINE006' line_txt = 'Zeta' )
      ( line_id = 'LINE007' line_txt = 'Eta' )
      ( line_id = 'LINE008' line_txt = 'Theta' )
      ( line_id = 'LINE009' line_txt = 'Iota' )
      ( line_id = 'LINE010' line_txt = 'Kappa' ) ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls_data>).
      TRY.
          <ls_data>-line_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error.
          RETURN.
      ENDTRY.
    ENDLOOP.

    " clear old data so the method can be run repeatedly
    DELETE FROM zpw_tst1_01.
    INSERT zpw_tst1_01 FROM TABLE @lt_data.
    rv_count = sy-dbcnt.
  ENDMETHOD.
ENDCLASS.
