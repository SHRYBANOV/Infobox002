CLASS zcl_fill_chart DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_CHART IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_sales_table2 TYPE TABLE OF zsales_table2.
*        DELETE FROM zsales_table2.
*        return.
    CLEAR: lt_sales_table2[].

    lt_sales_table2 = VALUE #(
  ( sales_id = '1' product_category = 'Electronics' region = 'North' sales_amount = '1500.00' currency_code = 'USD' )
  ( sales_id = '2' product_category = 'Electronics' region = 'South' sales_amount = '1200.00' currency_code = 'USD' )
  ( sales_id = '3' product_category = 'Software'    region = 'North' sales_amount = '5000.00' currency_code = 'USD' )
  ( sales_id = '4' product_category = 'Software'    region = 'East'  sales_amount = '2500.00' currency_code = 'USD' )
  ( sales_id = '5' product_category = 'Hardware'    region = 'West'  sales_amount = '800.00'  currency_code = 'USD' )
  ( sales_id = '6' product_category = 'Hardware'    region = 'North' sales_amount = '1100.00' currency_code = 'USD' )
  ( sales_id = '7' product_category = 'Electronics' region = 'East'  sales_amount = '900.00'  currency_code = 'USD' )
          ).

    DELETE FROM zsales_table2.

    INSERT zsales_table2 FROM TABLE @lt_sales_table2.

    out->write( |{ sy-dbcnt } запись(и). Таблица zsales_table2 успешно создана!| ).
  ENDMETHOD.
ENDCLASS.
