#' 查询生产订单汇总信息
#'
#' @param token 口令
#' @param FStartDate 开始日期
#' @param FEndDate 结束日期
#'
#' @return 返回值
#' @export
#'
#' @examples
#' moStat_query()
moStat_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD',
                         FStartDate='2023-03-01',FEndDate='2023-04-30') {


  sql <- paste0("  select  Fcategory ,sum([FPlannedProductionQuantity]) as FPlanQty
      ,sum([FImplementationQuantity]) as FActualQty
	  ,sum(FQualifiedQuantity) as FQualifiedQty
	  from rds_vm_vw_std_moDetail
	  where FDateOfDocumentIssuance >='",FStartDate,"' and FDateOfDocumentIssuance <='",FEndDate,"'
	  group by Fcategory")
  res = tsda::sql_select2(token = token,sql = sql)
  return(res)
}


#' 查询生产订单明细信息
#'
#' @param token 口令
#' @param FStartDate 开始日期
#' @param FEndDate 结束日期
#'
#' @return 返回值
#' @export
#'
#' @examples
#' moDetail_query()
moDetail_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD',
                         FStartDate='2023-03-01',FEndDate='2023-04-30',Fcategory=NULL) {

  if(is.null(Fcategory)){
    sql <- paste0("SELECT
      [FNumber]  as 工单号
      ,[FSaleOrderNumber] as 订单号
      ,[FMaterialNumber] as  产品代码
      ,left([FCostObject],10)  as 产品名称
      ,[FPlannedProductionQuantity]  计划数
      ,[FImplementationQuantity]  实作数
      ,[FQualifiedQuantity]  合格数
      ,[FDateOfDocumentIssuance] 下达日期
      ,Fcategory as 产品组
  FROM [vmdls].[dbo].[rds_vm_vw_std_moDetail]
   where FDateOfDocumentIssuance >='",FStartDate,"' and FDateOfDocumentIssuance <='",FEndDate,"'")
  }else{
    sql <- paste0("SELECT
      [FNumber]  as 工单号
      ,[FSaleOrderNumber] as 订单号
      ,[FMaterialNumber] as  产品代码
      ,left([FCostObject],10)  as 产品名称
      ,[FPlannedProductionQuantity]  计划数
      ,[FImplementationQuantity]  实作数
      ,[FQualifiedQuantity]  合格数
      ,[FDateOfDocumentIssuance] 下达日期
      ,Fcategory as 产品组
  FROM [vmdls].[dbo].[rds_vm_vw_std_moDetail]
   where FDateOfDocumentIssuance >='",FStartDate,"' and FDateOfDocumentIssuance <='",FEndDate,"'
                  and Fcategory ='",Fcategory,"'")
  }

  res = tsda::sql_select2(token = token,sql = sql)
  return(res)
}






