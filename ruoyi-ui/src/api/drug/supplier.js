import request from '@/utils/request'

// 查询供应商信息列表
export function listSupplier(query) {
  return request({
    url: '/drug/supplier/list',
    method: 'get',
    params: query
  })
}

// 查询供应商信息详细
export function getSupplier(supplierid) {
  return request({
    url: '/drug/supplier/' + supplierid,
    method: 'get'
  })
}

//下拉框数据接口
export function getSupplierName() {
  return request({
    url: '/drug/supplier/getname',
    method: 'get'
  })
}

// 新增供应商信息
export function addSupplier(data) {
  return request({
    url: '/drug/supplier',
    method: 'post',
    data: data
  })
}

// 修改供应商信息
export function updateSupplier(data) {
  return request({
    url: '/drug/supplier',
    method: 'put',
    data: data
  })
}

// 删除供应商信息
export function delSupplier(supplierid) {
  return request({
    url: '/drug/supplier/' + supplierid,
    method: 'delete'
  })
}
