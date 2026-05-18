CLASS zcl_fill_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_personal TYPE TABLE OF zpersonal.
*        DELETE FROM zpersonal.
*        return.
    CLEAR: lt_personal[].

    lt_personal = VALUE #(
            ( client = sy-mandt
              id = '96AE1CC0067A1FE1918CF99617A4FCF2'
              tabnum = '0000000001'
              telnum = '+38(097)156-09-74'
              firstname = 'Serhii'
              lastname = 'Hrybanov'
              secondname = 'Hikolaevich'
              datebirth = '19690623'
              organization = '96AE1CC0067A1FE1918CF99617A4FC12'
              department = '96AE1CC0067A1FE1918CF99617A4FD22'
              unit = '96AE1CC0067A1FE1918CF99617A4AE12'
              positions = '96AE1CC0067A1FE1918CF99617A4FE12'
              dateofadoption = '20150207'
              status = '0001'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id = '96AE1CC0067A1FE1918CF99617A4FCF3'
              tabnum = '0000000002'
              telnum = '+38(097)156-09-74'
              firstname = 'Andrii'
              lastname = 'Alkhimchenkov'
              secondname = ''
              datebirth = '19680323'
              organization = '96AE1CC0067A1FE1918CF99617A4FC12'
              department = '96AE1CC0067A1FE1918CF99617A4FD22'
              unit = '96AE1CC0067A1FE1918CF99617A4AE12'
              positions = '96AE1CC0067A1FE1918CF99617A4FE22'
              dateofadoption = '20150207'
              status = '0001'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
            ( client = sy-mandt
              id = '96AE1CC0067A1FE1918CF99617A4FCF4'
              tabnum = '0000000003'
              telnum = '+38(097)156-09-74'
              firstname = 'Daniil'
              lastname = 'Bialyk'
              secondname = ''
              datebirth = '20000113'
              organization = '96AE1CC0067A1FE1918CF99617A4FC22'
              department = '96AE1CC0067A1FE1918CF99617A4FD12'
              unit = '96AE1CC0067A1FE1918CF99617A4AE22'
              positions = '96AE1CC0067A1FE1918CF99617A4FE23'
              dateofadoption = '20100207'
              status = '0001'
              createdat = '+20160207120711.0'
              updatedat = '+20160207120711.0'
            )
          ).

    DELETE FROM zpersonal.

    INSERT zpersonal FROM TABLE @lt_personal.

    out->write( |{ sy-dbcnt } запись(и). Таблица zpersonal успешно создана!| ).
  ENDMETHOD.
ENDCLASS.
