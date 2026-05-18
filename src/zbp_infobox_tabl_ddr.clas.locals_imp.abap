CLASS lhc_ZINFOBOX_TABL_DDR DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zinfobox_tabl_ddr RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zinfobox_tabl_ddr RESULT result.
    METHODS set_default_currency FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zinfobox_tabl_ddr~set_default_currency.

ENDCLASS.

CLASS lhc_ZINFOBOX_TABL_DDR IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD set_default_currency.
    " 1. Читаем создаваемые записи, чтобы проверить, не заполнена ли уже валюта
    READ ENTITIES OF zinfobox_tabl_ddr IN LOCAL MODE
      ENTITY zinfobox_tabl_ddr
        FIELDS ( Currencycode Datarobot ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_records).

    " Таблица для обновления записей
    DATA lt_update TYPE TABLE FOR UPDATE zinfobox_tabl_ddr.

    LOOP AT lt_records ASSIGNING FIELD-SYMBOL(<fs_record>).
      " Подставляем 'UAH' только если поле изначально пустое
      IF <fs_record>-Currencycode IS INITIAL.
        APPEND VALUE #( %tky         = <fs_record>-%tky
                        Currencycode = COND #( WHEN <fs_record>-Currencycode IS INITIAL THEN 'UAH' ELSE <fs_record>-Currencycode )
                        Datarobot    = COND #( WHEN <fs_record>-Datarobot IS INITIAL THEN cl_abap_context_info=>get_system_date( ) ELSE <fs_record>-Datarobot )
                        %control-Currencycode = if_abap_behv=>mk-on " Сигнализируем об изменении поля
                        %control-Datarobot = if_abap_behv=>mk-on
                      ) TO lt_update.
      ENDIF.
    ENDLOOP.

    " 2. Записываем дефолтное значение обратно в контекст бизнес-объекта
    IF lt_update IS NOT INITIAL.
      MODIFY ENTITIES OF zinfobox_tabl_ddr IN LOCAL MODE
        ENTITY zinfobox_tabl_ddr
          UPDATE FIELDS ( Currencycode Datarobot ) WITH lt_update
        REPORTED DATA(lt_reported).

      " Передаем возможные ошибки в вызывающий UI слой
      reported = CORRESPONDING #( DEEP lt_reported ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
