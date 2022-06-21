import request from '@/utils/request'

// 查询药品退回列表
export function listUntread(query) {
  return request({
    url: '/drug/untread/list',
    method: 'get',
    params: query
  })
}

// 近期三十条退回记录
export function UntreadChartData(){
  return request({
    url: 'drug/untread/getchartdata',
    method: 'get'
  })
}

// 查询药品退回详细
export function getUntread(untreadid) {
  return request({
    url: '/drug/untread/' + untreadid,
    method: 'get'
  })
}

// 新增药品退回
export function addUntread(data) {
  return request({
    url: '/drug/untread',
    method: 'post',
    data: data
  })
}

// 修改药品退回
export function updateUntread(data) {
  return request({
    url: '/drug/untread',
    method: 'put',
    data: data
  })
}

// 删除药品退回
export function delUntread(untreadid) {
  return request({
    url: '/drug/untread/' + untreadid,
    method: 'delete'
  })
}
