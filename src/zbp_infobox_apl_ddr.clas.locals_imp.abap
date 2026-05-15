CLASS lhc_ZINFOBOX_APL_DDR DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zinfobox_apl_ddr RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zinfobox_apl_ddr RESULT result.

    METHODS setInitialValues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zinfobox_apl_ddr~setInitialValues.

ENDCLASS.

CLASS lhc_ZINFOBOX_APL_DDR IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setInitialValues.
    DATA: nr_number     TYPE cl_numberrange_runtime=>nr_number.
    DATA: lv_jo TYPE ze_tabnum .
    DATA: lv_jo_opt TYPE ze_tabnum.
    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get " generating number
          EXPORTING
            nr_range_nr = '01'
            object      = 'ZINFOB_APL' "object name
          IMPORTING
            number      = nr_number.

        " 1. Получить текущие данные
        READ ENTITIES OF zinfobox_apl_ddr IN LOCAL MODE
          ENTITY zinfobox_apl_ddr
            FIELDS ( Applnum Status )
            WITH CORRESPONDING #( keys )
          RESULT DATA(lt_objects).

        DATA: lt_update TYPE TABLE FOR UPDATE zinfobox_apl_ddr.

        " 2. Логика автозаполнения
        LOOP AT lt_objects ASSIGNING FIELD-SYMBOL(<fs_obj>).
          APPEND VALUE #(
            %tky = <fs_obj>-%tky
            Applnum = CONV ze_applnum( nr_number )
            Status = '0001'
            %control-Applnum = if_abap_behv=>mk-on
            %control-Status = if_abap_behv=>mk-on
          ) TO lt_update.
        ENDLOOP.

        " 3. Обновить сущность
        MODIFY ENTITIES OF zinfobox_apl_ddr IN LOCAL MODE
          ENTITY zinfobox_apl_ddr
            UPDATE FIELDS ( Applnum Status )
            WITH lt_update.

      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
