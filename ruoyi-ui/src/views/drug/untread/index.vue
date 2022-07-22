<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="70px">
      <el-form-item label="药品编号" prop="untreadno">
        <el-input
          v-model="queryParams.untreadno"
          placeholder="请输入药品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="untreaddrugname">
        <el-input
          v-model="queryParams.untreaddrugname"
          placeholder="请输入药品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商" prop="untreadsuppliername">
        <el-input
          v-model="queryParams.untreadsuppliername"
          placeholder="请输入供应商"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂商" prop="untreaddrugvendor">
        <el-input
          v-model="queryParams.untreaddrugvendor"
          placeholder="请输入厂商"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
        <el-form-item label="退货日期" prop="untreadtime">
         <el-date-picker clearable size="small"
          v-model="queryParams.untreadtime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择退货时间"
          @change="handleQuery">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['drug:untread:add']"
        >退回</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['drug:untread:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['drug:untread:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['drug:untread:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :default-sort="defaultSort" :data="untreadList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" type="index" />
      <el-table-column label="药品编号" align="center" prop="untreadno" />
      <el-table-column label="药品名称" align="center" prop="untreaddrugname" show-overflow-tooltip />
      <el-table-column label="供应商" align="center" prop="untreadsuppliername" show-overflow-tooltip />
      <el-table-column label="厂商" align="center" prop="untreaddrugvendor" show-overflow-tooltip />
      <el-table-column label="退回数量" align="center" prop="untreadnum" />
      <el-table-column label="退货日期" align="center" prop="untreadtime" width="180"
      sortable
      :sort-orders="['descending', 'ascending']"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.untreadtime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退货原因" align="center" prop="untreadreason" show-overflow-tooltip />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drug:untread:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drug:untread:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改药品退回对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="药品编号" prop="untreadno">
         <el-select
            v-model="form.untreadno"
            filterable
            placeholder="请选择药品编号"
            @change="changeSelect"
          >
            <el-option
              v-for="(dict, index) in ListNo"
              :key="index"
              :label="dict.name"
              :value="dict.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="药品名称" prop="untreaddrugname">
          <el-input v-model="form.untreaddrugname" readonly placeholder="药品名称" ></el-input>
        </el-form-item>
        <el-form-item label="供应商" prop="untreadsuppliername">
         <el-select v-model="form.untreadsuppliername" placeholder="请选择药品供应商">
            <el-option
            v-for="(dict, index) in selectdata"
            :key="index"
            :label="dict"
            :value="dict"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="厂商" prop="untreaddrugvendor">
          <el-input v-model="form.untreaddrugvendor" readonly placeholder="药品厂商" />
        </el-form-item>
        <el-form-item label="退回数量" prop="untreadnum">
          <el-input v-model.number="form.untreadnum" placeholder="请输入退回数量" />
        </el-form-item>
        <el-form-item label="退货原因" prop="untreadreason">
          <el-input v-model="form.untreadreason" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listUntread, getUntread, delUntread, addUntread, updateUntread } from "@/api/drug/untread";
import { getname } from "@/api/drug/info";
import { getBatch } from "@/api/drug/out";
import { getSupplierName } from "@/api/drug/supplier";

export default {
  name: "Untread",
  data() {
    let outNum = (rule, value, callback) => {
      setTimeout(() => {
        if (value <= 0) {
          callback(new Error("无法退货/无意义退货！"));
        } else if (value > this.NowStockNum) {
          callback(new Error("超出现有库存,无法退货！"));
        } else {
          callback();
        }
      }, 500);
    };
    return {
      //下拉数据
      ListNo: [],
      ListName: [],
      //供应商下拉数据
      selectdata: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 药品退回表格数据
      untreadList: [],
      // 默认排序
      defaultSort: { prop: "untreadtime", order: "descending" },
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        untreadno: null,
        untreaddrugname: null,
        untreadsuppliername: null,
        untreaddrugvendor: null,
      },
      // 表单参数
      form: {},
      NowStockNum: "0",
      batch:[],
      // 表单校验
      rules: {
        untreadno: [
          { required: true, message: "药品编号不能为空", trigger: "blur" }
        ],
        untreadsuppliername: [
          { required: true, message: "供应商不能为空", trigger: "blur" }
        ],
        untreadnum: [
          { required: true, message: "退回数量不能为空", trigger: "blur" },
          { type: "number", message: "请输入数字", trigger: "blur" },
          { validator: outNum, trigger: "blur" },
        ],
        untreadreason: [
          { required: true, message: "退货原因不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
        this.Getname();
    this.getnamedata();
    this.getbatch();
  },
  methods: {
    /** 查询供应商下拉框数据 */
    getnamedata() {
      this.loading = true;
      getSupplierName().then((response) =>{
        this.datalist = response.data
        for(let i=0;i<this.datalist.length;i++) {
            this.selectdata.push(this.datalist[i].suppliername)
        }
        // console.log(this.selectdata);
      })
    },
    //当联动下拉数据 编号联动名称和厂商
    changeSelect() {
      this.NowStockNum=0;
      this.form.untreaddrugname = "";
      this.form.untreaddrugvendor = "";
      for (let i = 0; i < this.ListNo.length; i++) {
        if (this.form.untreadno === this.ListNo[i].name) {
          this.form.untreaddrugname = this.ListNo[i].value;
          this.form.untreaddrugvendor = this.ListNo[i].vendor;

          for (let j = 0; j < this.batch.length; j++) {
         
          if(this.ListNo[i].name == this.batch[j].name) {
            this.NowStockNum = this.batch[j].num;
          }
          
        }
        }
        
      }
      // console.log(this.NowStockNum);
    },
    //下拉选择
    Getname() {
      this.loading = true;
      getname(this.queryParams).then((response) => {
        this.getnamelist = response.data;
        console.log(this.getnamelist);
        var jsondata = {};
        for (var i = 0; i < this.getnamelist.length; i++) {
          jsondata["name"] = this.getnamelist[i].drugno;
          jsondata["value"] = this.getnamelist[i].drugname;
          jsondata["vendor"] = this.getnamelist[i].drugvendor;
          this.ListNo.push(jsondata);
          jsondata = {};
        }
        // console.log(this.ListNo);
      });
    },
      //获取药品现有库存
      getbatch() {
      getBatch().then((response) => {
        this.batchlist = response.data;
        console.log(this.batchlist);
        var batchdata = {};
        for (var i = 0; i < this.batchlist.length; i++) {
          batchdata["name"] = this.batchlist[i].druginno;
          batchdata["num"] = this.batchlist[i].druginnum;
          this.batch.push(batchdata);
          batchdata = {};
        }
        console.log(this.batch);
      });
    },
    /** 查询药品退回列表 */
    getList() {
      this.loading = true;
      listUntread(this.queryParams).then(response => {
        this.untreadList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        untreadid: null,
        untreadno: null,
        untreaddrugname: null,
        untreadsuppliername: null,
        untreaddrugvendor: null,
        untreadnum: null,
        untreadtime: null,
        untreadreason: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.untreadid)
      this.nos = selection.map(item => item.untreadno)
      this.single = selection.length!==1
      this.multiple = !selection.length
      },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加药品退回";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const untreadid = row.untreadid || this.ids
      getUntread(untreadid).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改药品退回";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.untreadid != null) {
            updateUntread(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
              this.open = false;
              // location.reload(true);
            });
          } else {
            addUntread(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.getList();
              this.open = false;
              // location.reload(true);
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const untreadids = row.untreadid || this.ids;
      const untreadnos = row.untreadno || this.nos;
      this.$modal.confirm('是否确认删除药品退回编号为"' + untreadnos + '"的数据项？').then(function() {
        return delUntread(untreadids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('drug/untread/export', {
        ...this.queryParams
      }, `untread_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
