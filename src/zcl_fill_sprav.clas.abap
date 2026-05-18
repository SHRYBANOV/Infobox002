CLASS zcl_fill_sprav DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_SPRAV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_org  TYPE TABLE OF zorganizations,
          lt_dep  TYPE TABLE OF zdepartment2,
          lt_pos  TYPE TABLE OF zposition,
          lt_unit TYPE TABLE OF zunit_1.


*        DELETE FROM zorganizations.
*        DELETE FROM zdepartment2.
*        DELETE FROM zposition.
*        DELETE FROM zunit_1.
*        return.

    CLEAR: lt_org[], lt_dep[], lt_pos[], lt_unit[].

*zorganizations
    lt_org = VALUE #(
            ( client = sy-mandt
              id_org = '96AE1CC0067A1FE1918CF99617A4FC12'
              organization = 'Sapiens Tech'
              description = 'Sapiens Tech'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id_org = '96AE1CC0067A1FE1918CF99617A4FC22'
              organization = 'Kormotex'
              description = 'Kormotex'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
          ).

    DELETE FROM zorganizations.

    INSERT zorganizations FROM TABLE @lt_org.

    out->write( |{ sy-dbcnt } запись(и). Таблица zorganizations успешно создана!| ).

*zdepartment2
    lt_dep = VALUE #(
            ( client = sy-mandt
              id_dep = '96AE1CC0067A1FE1918CF99617A4FD12'
              department = 'SAP AG'
              description = 'SAP AG'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id_dep = '96AE1CC0067A1FE1918CF99617A4FD22'
              department = 'BTP'
              description = 'BTP'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
          ).

    DELETE FROM zdepartment2.

    INSERT zdepartment2 FROM TABLE @lt_dep.

    out->write( |{ sy-dbcnt } запись(и). Таблица zdepartment2 успешно создана!| ).

*zposition
    lt_pos = VALUE #(
            ( client = sy-mandt
              id_pos = '96AE1CC0067A1FE1918CF99617A4FE12'
              positions = 'Розробник'
              description = 'Розробник'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id_pos = '96AE1CC0067A1FE1918CF99617A4FE22'
              positions = 'Team Lider'
              description = 'Team Lider'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id_pos = '96AE1CC0067A1FE1918CF99617A4FE23'
              positions = 'CEO'
              description = 'CEO'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
          ).

    DELETE FROM zposition.

    INSERT zposition FROM TABLE @lt_pos.

    out->write( |{ sy-dbcnt } запись(и). Таблица zposition успешно создана!| ).

*zunit_1
    lt_unit = VALUE #(
            ( client = sy-mandt
              id_unit = '96AE1CC0067A1FE1918CF99617A4AE12'
              unit = 'Developer'
              description = 'Developer'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id_unit = '96AE1CC0067A1FE1918CF99617A4AE22'
              unit = 'Consultant'
              description = 'Consultant'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
          ).

    DELETE FROM zunit_1.

    INSERT zunit_1 FROM TABLE @lt_unit.

    out->write( |{ sy-dbcnt } запись(и). Таблица zunit_1 успешно создана!| ).
  ENDMETHOD.
ENDCLASS.
