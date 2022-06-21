import request from '@/utils/request'

// 查询出库列表
export function listOut(query) {
  return request({
    url: '/drug/out/list',
    method: 'get',
    params: query
  })
}

// 查询出库详细
export function getOut(drugoutid) {
  return request({
    url: '/drug/out/' + drugoutid,
    method: 'get'
  })
}

// 查询入库药品信息
export function getBatch(){
  return request({
    url: '/drug/drugin/drunginbatch',
    method: 'get'
  })
}

//  查询当月出库数据 -图表
export function getdatalist() {
  return request({
    url: 'drug/out/listdataout',
    method: 'get',
  })
}

// 按月统计出库数量
export function  getdatamonth() {
  return request({
    url: 'drug/out/getmonthdata',
    method: 'get',
  })
}
// 新增出库
export function addOut(data) {
  return request({
    url: '/drug/out',
    method: 'post',
    data: data
  })
}

// 修改出库
export function updateOut(data) {
  return request({
    url: '/drug/out',
    method: 'put',
    data: data
  })
}

// 删除出库
export function delOut(drugoutid) {
  return request({
    url: '/drug/out/' + drugoutid,
    method: 'delete'
  })
}
