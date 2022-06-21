package com.ruoyi.liuyb.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出库对象 drug_out
 *
 * @author liuyb
 * @date 2022-02-24
 */
public class DrugOut extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long drugoutid;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugoutname;

    /** 药品编号 */
    @Excel(name = "药品编号")
    private Long drugoutno;

    /** 出库时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出库时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date drugouttime;

    /** 批次 */
    @Excel(name = "批次")
    private String drugoutbatch;

    /** 数量 */
    @Excel(name = "数量")
    private Long drugoutnum;

    /** 现有库存 */
    private Long stocknum;

    public void setDrugoutid(Long drugoutid)
    {
        this.drugoutid = drugoutid;
    }

    public Long getDrugoutid()
    {
        return drugoutid;
    }
    public void setDrugoutname(String drugoutname)
    {
        this.drugoutname = drugoutname;
    }

    public String getDrugoutname()
    {
        return drugoutname;
    }
    public void setDrugoutno(Long drugoutno)
    {
        this.drugoutno = drugoutno;
    }

    public Long getDrugoutno()
    {
        return drugoutno;
    }
    public void setDrugouttime(Date drugouttime)
    {
        this.drugouttime = drugouttime;
    }

    public Long getStocknum() {
        return stocknum;
    }

    public void setStocknum(Long stocknum) {
        this.stocknum = stocknum;
    }

    public Date getDrugouttime()
    {
        return drugouttime;
    }
    public void setDrugoutbatch(String drugoutbatch)
    {
        this.drugoutbatch = drugoutbatch;
    }

    public String getDrugoutbatch()
    {
        return drugoutbatch;
    }
    public void setDrugoutnum(Long drugoutnum)
    {
        this.drugoutnum = drugoutnum;
    }

    public Long getDrugoutnum()
    {
        return drugoutnum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("drugoutid", getDrugoutid())
                .append("drugoutname", getDrugoutname())
                .append("drugoutno", getDrugoutno())
                .append("drugouttime", getDrugouttime())
                .append("drugoutbatch", getDrugoutbatch())
                .append("drugoutnum", getDrugoutnum())
                .toString();
    }
}
