import request from '@/utils/request'

// 查询药品信息管理列表
export function listInfo(query) {
  return request({
    url: '/drug/info/list',
    method: 'get',
    params: query
  })
}

//下拉
export function getname() {
  return request({
    url: '/drug/info/getname',
    method: 'get',
  })
}
// 查询药品信息管理详细
export function getInfo(drugid) {
  return request({
    url: '/drug/info/' + drugid,
    method: 'get'
  })
}

// 新增药品信息管理
export function addInfo(data) {
  return request({
    url: '/drug/info',
    method: 'post',
    data: data
  })
}

// 修改药品信息管理
export function updateInfo(data) {
  return request({
    url: '/drug/info',
    method: 'put',
    data: data
  })
}

// 删除药品信息管理
export function delInfo(drugid) {
  return request({
    url: '/drug/info/' + drugid,
    method: 'delete'
  })
}
