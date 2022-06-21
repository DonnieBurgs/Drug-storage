package com.ruoyi.liuyb.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.liuyb.mapper.DrugMapper;
import com.ruoyi.liuyb.domain.Drug;
import com.ruoyi.liuyb.service.IDrugService;

/**
 * 药品信息管理Service业务层处理
 * 
 * @author liuyb
 * @date 2022-02-23
 */
@Service
public class DrugServiceImpl implements IDrugService 
{
    @Autowired
    private DrugMapper drugMapper;

    /**
     * 查询药品信息管理
     * 
     * @param drugid 药品信息管理主键
     * @return 药品信息管理
     */
    @Override
    public Drug selectDrugByDrugid(Long drugid)
    {
        return drugMapper.selectDrugByDrugid(drugid);
    }

    /**
     * 查询药品信息管理列表
     * 
     * @param drug 药品信息管理
     * @return 药品信息管理
     */
    @Override
    public List<Drug> selectDrugList(Drug drug)
    {
        return drugMapper.selectDrugList(drug);
    }

    @Override
    public List<Drug> selectDrugListNo(Drug drug) {
        return drugMapper.selectDrugListNo(drug);
    }

    /**
     * 查询药品名和编号
     * @param drug
     * @return
     */
    @Override
    public List<Drug> selectDrugNoName(Drug drug) {
        return drugMapper.selectDrugNoName(drug);
    }

    /**
     * 新增药品信息管理
     * 
     * @param drug 药品信息管理
     * @return 结果
     */
    @Override
    public int insertDrug(Drug drug)
    {
        try {
            return drugMapper.insertDrug(drug);
        }catch (Exception e){
            e.printStackTrace();
        }
       return 0;
    }

    /**
     * 查询存放地点
     * @param drug
     * @return
     */
//    @Override
//    public Drug selectDrugPlace(Drug drug) {
//        return drugMapper.selectDrugPlace(drug);
//    }

    /**
     * 修改药品信息管理
     * 
     * @param drug 药品信息管理
     * @return 结果
     */
    @Override
    public int updateDrug(Drug drug)
    {
        return drugMapper.updateDrug(drug);
    }

    /**
     * 批量删除药品信息管理
     * 
     * @param drugids 需要删除的药品信息管理主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugids(Long[] drugids)
    {
        return drugMapper.deleteDrugByDrugids(drugids);
    }

    /**
     * 删除药品信息管理信息
     * 
     * @param drugid 药品信息管理主键
     * @return 结果
     */
    @Override
    public int deleteDrugByDrugid(Long drugid)
    {
        return drugMapper.deleteDrugByDrugid(drugid);
    }
}
