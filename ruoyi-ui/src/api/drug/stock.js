import request from '@/utils/request'

// 查询库存列表
export function listStock(query) {
  return request({
    url: '/drug/stock/list',
    method: 'get',
    params: query
  })
}

//不分页
export function listStock1(query) {
  return request({
    url: '/drug/stock/listnopage',
    method: 'get',
    params: query
  })
}
// 查询库存详细
export function getStock(stockid) {
  return request({
    url: '/drug/stock/' + stockid,
    method: 'get'
  })
}

// 新增库存
export function addStock(data) {
  return request({
    url: '/drug/stock',
    method: 'post',
    data: data
  })
}

// 修改库存
export function updateStock(data) {
  return request({
    url: '/drug/stock',
    method: 'put',
    data: data
  })
}

// 删除库存
export function delStock(stockid) {
  return request({
    url: '/drug/stock/' + stockid,
    method: 'delete'
  })
}
