package com.ruoyi.liuyb.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.liuyb.mapper.DrugSupplierMapper;
import com.ruoyi.liuyb.domain.DrugSupplier;
import com.ruoyi.liuyb.service.IDrugSupplierService;

/**
 * 供应商信息Service业务层处理
 * 
 * @author Liuyb
 * @date 2022-03-02
 */
@Service
public class DrugSupplierServiceImpl implements IDrugSupplierService 
{
    @Autowired
    private DrugSupplierMapper drugSupplierMapper;

    /**
     * 查询供应商信息
     * 
     * @param supplierid 供应商信息主键
     * @return 供应商信息
     */
    @Override
    public DrugSupplier selectDrugSupplierBySupplierid(Long supplierid)
    {
        return drugSupplierMapper.selectDrugSupplierBySupplierid(supplierid);
    }

    /**
     * 下拉查询数据  查询供应商名称...
     * @param drugSupplier
     * @return
     */
    @Override
    public List<DrugSupplier> selectSupplierName(DrugSupplier drugSupplier) {
        return drugSupplierMapper.selectSupplierName(drugSupplier);
    }

    /**
     * 查询供应商信息列表
     * 
     * @param drugSupplier 供应商信息
     * @return 供应商信息
     */
    @Override
    public List<DrugSupplier> selectDrugSupplierList(DrugSupplier drugSupplier)
    {
        return drugSupplierMapper.selectDrugSupplierList(drugSupplier);
    }

    /**
     * 新增供应商信息
     * 
     * @param drugSupplier 供应商信息
     * @return 结果
     */
    @Override
    public int insertDrugSupplier(DrugSupplier drugSupplier)
    {
        return drugSupplierMapper.insertDrugSupplier(drugSupplier);
    }

    /**
     * 修改供应商信息
     * 
     * @param drugSupplier 供应商信息
     * @return 结果
     */
    @Override
    public int updateDrugSupplier(DrugSupplier drugSupplier)
    {
        return drugSupplierMapper.updateDrugSupplier(drugSupplier);
    }

    /**
     * 批量删除供应商信息
     * 
     * @param supplierids 需要删除的供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteDrugSupplierBySupplierids(Long[] supplierids)
    {
        return drugSupplierMapper.deleteDrugSupplierBySupplierids(supplierids);
    }

    /**
     * 删除供应商信息信息
     * 
     * @param supplierid 供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteDrugSupplierBySupplierid(Long supplierid)
    {
        return drugSupplierMapper.deleteDrugSupplierBySupplierid(supplierid);
    }
}
