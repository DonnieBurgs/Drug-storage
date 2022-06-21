package com.ruoyi.liuyb.mapper;

import java.util.List;
import com.ruoyi.liuyb.domain.Stock;

/**
 * 库存Mapper接口
 * 
 * @author liuyb
 * @date 2022-02-23
 */
public interface StockMapper 
{
    /**
     * 查询库存
     * 
     * @param stockid 库存主键
     * @return 库存
     */
    public Stock selectStockByStockid(Long stockid);

    /**
     * 查询库存列表
     * 
     * @param stock 库存
     * @return 库存集合
     */
    public List<Stock> selectStockList(Stock stock);

    /**
     * 新增库存
     * 
     * @param stock 库存
     * @return 结果
     */
    public int insertStock(Stock stock);

    /**
     * 修改库存
     * 
     * @param stock 库存
     * @return 结果
     */
    public int updateStock(Stock stock);

    /**
     * 删除库存
     * 
     * @param stockid 库存主键
     * @return 结果
     */
    public int deleteStockByStockid(Long stockid);

    /**
     * 批量删除库存
     * 
     * @param stockids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStockByStockids(Long[] stockids);
}
