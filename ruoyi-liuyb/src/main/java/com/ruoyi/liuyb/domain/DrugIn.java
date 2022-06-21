package com.ruoyi.liuyb.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品入库对象 drug_in
 * 
 * @author liuyb
 * @date 2022-02-23
 */
public class DrugIn extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long druginid;

    /** 药品编号 */
    @Excel(name = "药品编号")
    private Long druginno;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String druginname;

    /** 供应商 */
    @Excel(name = "供应商")
    private String drugsuppliername;

    /** 入库时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入库时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date drugintime;

    /** 批次 */
    @Excel(name = "批次")
    private String druginbatch;

    /** 厂商 */
    @Excel(name = "厂商")
    private String druginfirm;

    /** 数量 */
    @Excel(name = "数量")
    private Long druginnum;

    /** 生产时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生产时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date druginproductiontime;

    /** 保质期 */
    private Long drugexpirydata;

    /** 过期时间 */
    @Excel(name = "可使用天数/天")
    private Long time;

    public void setDruginid(Long druginid) 
    {
        this.druginid = druginid;
    }

    public Long getDruginid() 
    {
        return druginid;
    }
    public void setDruginno(Long druginno) 
    {
        this.druginno = druginno;
    }

    public Long getDruginno() 
    {
        return druginno;
    }
    public void setDruginname(String druginname) 
    {
        this.druginname = druginname;
    }

    public String getDruginname() 
    {
        return druginname;
    }
    public void setDrugintime(Date drugintime) 
    {
        this.drugintime = drugintime;
    }

    public Date getDrugintime() 
    {
        return drugintime;
    }
    public void setDruginbatch(String druginbatch) 
    {
        this.druginbatch = druginbatch;
    }

    public String getDruginbatch() 
    {
        return druginbatch;
    }
    public void setDruginfirm(String druginfirm) 
    {
        this.druginfirm = druginfirm;
    }

    public String getDruginfirm() 
    {
        return druginfirm;
    }
    public void setDruginnum(Long druginnum) 
    {
        this.druginnum = druginnum;
    }

    public Long getDruginnum() 
    {
        return druginnum;
    }
    public void setDruginproductiontime(Date druginproductiontime) 
    {
        this.druginproductiontime = druginproductiontime;
    }

    public Date getDruginproductiontime() 
    {
        return druginproductiontime;
    }

    public String getDrugsuppliername() {
        return drugsuppliername;
    }

    public Long getDrugexpirydata() {
        return drugexpirydata;
    }

    public void setDrugexpirydata(Long drugexpirydata) {
        this.drugexpirydata = drugexpirydata;
    }

    public void setDrugsuppliername(String drugsuppliername) {
        this.drugsuppliername = drugsuppliername;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("druginid", getDruginid())
            .append("druginno", getDruginno())
            .append("druginname", getDruginname())
            .append("drugsuppliername",getDrugsuppliername())
            .append("drugintime", getDrugintime())
            .append("druginbatch", getDruginbatch())
            .append("druginfirm", getDruginfirm())
            .append("druginnum", getDruginnum())
            .append("druginproductiontime", getDruginproductiontime())
            .append("drugexpirydata",getDrugexpirydata())
            .append("time",getTime())
            .toString();
    }
}
