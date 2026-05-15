CLASS lhc_ZINFOBOX_DD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zinfobox_dd RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zinfobox_dd RESULT result.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE zinfobox_dd.
*    METHODS getdefaultsforcreate FOR READ
*      IMPORTING keys FOR FUNCTION zinfobox_dd~getdefaultsforcreate RESULT result.
    METHODS setInitialValues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zinfobox_dd~setInitialValues.
*    METHODS DEPData FOR MODIFY
*      IMPORTING keys FOR ACTION ZINFOBOX_DD~DEPData RESULT result.
*
*    METHODS ORGData FOR MODIFY
*      IMPORTING keys FOR ACTION ZINFOBOX_DD~ORGData RESULT result.
*
*    METHODS POSData FOR MODIFY
*      IMPORTING keys FOR ACTION ZINFOBOX_DD~POSData RESULT result.
*
*    METHODS UNITData FOR MODIFY
*      IMPORTING keys FOR ACTION ZINFOBOX_DD~UNITData RESULT result.

ENDCLASS.

CLASS lhc_ZINFOBOX_DD IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

*  METHOD GetDefaultsForCreate.
**    TRY.
**        cl_numberrange_objects=>read(
**                  EXPORTING
**                    language        = sy-langu
**                    object          = 'ZINFOB_TAB'
**                  IMPORTING
**                    attributes      = data(ls_attributes)
**                    interval_exists = data(lv_interval_exists)
**                    obj_text        = data(obj_text)
**                ).
**        IF lv_interval_exists = abap_true.
**          " ... do something ...
**        ENDIF.
**      CATCH cx_number_ranges.
**        "handle exception
**    ENDTRY.
*    DATA: nr_number     TYPE cl_numberrange_runtime=>nr_number.
*    DATA: lv_jo TYPE ze_tabnum .
*    DATA: lv_jo_opt TYPE ze_tabnum.
*    TRY.
*        CALL METHOD cl_numberrange_runtime=>number_get " generating number
*          EXPORTING
**           ignore_buffer     =
*            nr_range_nr = '01'
*            object      = 'ZINFOB_TAB' "object name
*            quantity    = 0000000001
**           subobject   =
**           toyear      =
*          IMPORTING
*            number      = nr_number.
**     returncode        =
**     returned_quantity =
*
*      CATCH cx_nr_object_not_found.
*      CATCH cx_number_ranges.
*    ENDTRY.
*
*
*    result = VALUE #( FOR key IN keys
*                      ( %cid    = key-%cid
*                        %param  = VALUE #( Tabnum = nr_number ) ) ).
*  ENDMETHOD.

  METHOD setInitialValues.
    DATA: nr_number     TYPE cl_numberrange_runtime=>nr_number.
    DATA: lv_jo TYPE ze_tabnum .
    DATA: lv_jo_opt TYPE ze_tabnum.
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get " generating number
          EXPORTING
            nr_range_nr = '01'
            object      = 'ZINFOB_TAB' "object name
          IMPORTING
            number      = nr_number.

        " 1. Получить текущие данные
        READ ENTITIES OF zinfobox_dd IN LOCAL MODE
          ENTITY zinfobox_dd
            FIELDS ( Tabnum )
            WITH CORRESPONDING #( keys )
          RESULT DATA(lt_objects).

        DATA: lt_update TYPE TABLE FOR UPDATE zinfobox_dd.

        " 2. Логика автозаполнения
        LOOP AT lt_objects ASSIGNING FIELD-SYMBOL(<fs_obj>).
          APPEND VALUE #(
            %tky = <fs_obj>-%tky
            Tabnum = CONV ze_tabnum( nr_number )
            %control-Tabnum = if_abap_behv=>mk-on
          ) TO lt_update.
        ENDLOOP.

        " 3. Обновить сущность
        MODIFY ENTITIES OF zinfobox_dd IN LOCAL MODE
          ENTITY zinfobox_dd
            UPDATE FIELDS ( Tabnum )
            WITH lt_update.

      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges.
    ENDTRY.

  ENDMETHOD.

*  METHOD DEPData.
*
*  ENDMETHOD.
*
*  METHOD ORGData.
*  ENDMETHOD.
*
*  METHOD POSData.
*  ENDMETHOD.
*
*  METHOD UNITData.
*  ENDMETHOD.

ENDCLASS.
