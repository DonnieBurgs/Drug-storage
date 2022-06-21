import request from '@/utils/request'

// 查询药品入库列表
export function listDrugin(query) {
  return request({
    url: '/drug/drugin/list',
    method: 'get',
    params: query
  })
}
//不分页
export function listDrugin1(query) {
  return request({
    url: '/drug/drugin/list1',
    method: 'get',
    params: query
  })
}

// 按月统计入库数据
export function getDrugMonth() {
  return request({
    url: '/drug/drugin/getmonthdata',
    method: 'get'
  })
}
//test
export function GetNameAndNo() {
  return request({
    url: '/drug/drugin/getname',
    method: 'get'
  })
}

//查询本月入库记录
export function ChartData() {
  return request({
    url: '/drug/drugin/getdata',
    method: 'get'
  })
}

// 查询药品入库详细
export function getDrugin(druginid) {
  return request({
    url: '/drug/drugin/' + druginid,
    method: 'get'
  })
}

// 新增药品入库
export function addDrugin(data) {
  return request({
    url: '/drug/drugin',
    method: 'post',
    data: data
  })
}

// 修改药品入库
export function updateDrugin(data) {
  return request({
    url: '/drug/drugin',
    method: 'put',
    data: data
  })
}

// 删除药品入库
export function delDrugin(druginid) {
  return request({
    url: '/drug/drugin/' + druginid,
    method: 'delete'
  })
}
