#' 产成品逾期查询
#'
#' @param token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueListPrd_query()
overDueListPrd_query <- function(token='D62212AC-5651-4387-B3AC-42D3E38D6AFD') {
sql <- paste0("  select * from rds_vm_vw_std_overDueListPrd
  order by Category,[planned ship Date]")
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
