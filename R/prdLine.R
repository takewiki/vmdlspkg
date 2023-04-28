#' 查询产线统计信息
#'
#' @param token 口令
#' @param FStartDate 开始日期
#' @param FEndDate 结束日期
#'
#' @return 返回值
#' @export
#'
#' @examples
#' prdLineStat_query()
prdLineStat_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD',
                         FStartDate='2023-03-01',FEndDate='2023-04-30') {


  sql <- paste0("    select  FProductionLine ,sum([FPlannedProductionQuantity]) as FPlanQty
      ,sum([FImplementationQuantity]) as FActualQty
	  ,sum(FQualifiedQuantity) as FQualifiedQty
	  from rds_vm_vw_std_moDetail
	  where FDateOfDocumentIssuance >='",FStartDate,"' and FDateOfDocumentIssuance <='",FEndDate,"'
	  group by FProductionLine")
  res = tsda::sql_select2(token = token,sql = sql)
  return(res)
}
