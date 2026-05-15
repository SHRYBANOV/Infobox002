@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Пример графика продаж'
@Analytics.dataCategory: #CUBE

@Metadata.allowExtensions: true
define view entity ZC_SalesChart
  as select from zsales_table2
{
  key sales_id,

      product_category,

      region,

      @Aggregation.default: #SUM
      sales_amount,

      currency_code
}
 
