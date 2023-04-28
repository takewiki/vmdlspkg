#' 产成品逾期查询
#'
#' @param token 口令
#' @param FCategory 产品分组
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueListPrd_query()
overDuePrd_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD',FCategory=NULL) {

  if(is.null(FCategory)){
    sql <- paste0("    select * from rds_vm_vw_std_overDueListPrd
  order by Category,[planned ship Date]")
  }else{
    sql <- paste0("    select * from rds_vm_vw_std_overDueListPrd
  where category ='",FCategory,"'
  order by Category,[planned ship Date]")
  }

res = tsda::sql_select2(token = token,sql = sql)
return(res)
}


#' 产品逾期将视图数据插入对应表
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDuePrd_insert()
overDuePrd_insert <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {

  sql <- paste0("insert into rds_vm_t_std_overDueListPrd
select * from rds_vm_vw_std_overDueListPrd")
  res <-tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}





#' 产品逾期表删除所有数据
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDuePrd_delete()
overDuePrd_delete <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {

  sql <- paste0("delete from  rds_vm_t_std_overDueListPrd")
  res <-tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}


#' 备件逾期表查询数据
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueSParts_query()
overDueSParts_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {

  sql <- paste0("select * from  rds_vm_vw_std_overDueListSParts order by Category,plannedshipDate")
  res <-tsda::sql_select2(token = token,sql = sql)
  return(res)
}

#' 备件逾期表数据将视图数据插入对应表
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueSParts_insert()
overDueSParts_insert <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {

  sql <- paste0("insert into rds_vm_t_std_overDueListSParts select * from rds_vm_vw_std_overDueListSParts")
  res <-tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}


#' 备件逾期对应表删除所有数据
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueSParts_delete()
overDueSParts_delete <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {

  sql <- paste0("delete from rds_vm_t_std_overDueListSParts")
  res <-tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}






