<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="70px"
    >
      <el-form-item label="药品编号" prop="druginno">
        <el-input
          v-model="queryParams.druginno"
          placeholder="请输入药品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="druginname">
        <el-input
          v-model="queryParams.druginname"
          placeholder="请输入药品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库时间" prop="drugintime">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.drugintime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择入库时间"
          @change="handleQuery"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="厂商" prop="druginfirm">
        <el-input
          v-model="queryParams.druginfirm"
          placeholder="请输入厂商"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          v-hasPermi="['drug:drugin:add']"
          >入库</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['drug:drugin:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['drug:drugin:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['drug:drugin:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="druginList"
      @selection-change="handleSelectionChange"
      :default-sort="defaultSort"
      @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" type="index" />
      <el-table-column label="药品编号" align="center" prop="druginno" />
      <el-table-column label="药品名称" align="center" prop="druginname" show-overflow-tooltip />
      <el-table-column  label="供应商" align="center" prop="drugsuppliername" show-overflow-tooltip/>
      <el-table-column
        label="入库时间"
        align="center"
        prop="drugintime"
        width="180"
        sortable
        :sort-orders="['descending', 'ascending']"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.drugintime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="批次" align="center" prop="druginbatch" />
      <el-table-column label="厂商" align="center" prop="druginfirm" show-overflow-tooltip />
      <el-table-column label="数量" align="center" prop="druginnum" />
      <el-table-column
        label="生产时间"
        align="center"
        prop="druginproductiontime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.druginproductiontime, "{y}-{m}-{d}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column label="过期日期" align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.time > 0" :type="scope.row.time <=90 ? 'warning' : 'success'" 
          :effect="scope.row.time <=90 ? 'dark' : 'plain'">
            {{ scope.row.time }}天后失效
          </el-tag>
          <el-tag v-else :type="scope.row.time <=90 ? 'danger' : 'success'" effect="dark">
            已过期
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['drug:drugin:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drug:drugin:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改药品入库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item  label="药品编号"  prop="druginno">
          <el-select
            v-model="form.druginno"
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
        <el-form-item label="药品名称" prop="druginname">
          <el-input v-model="form.druginname" readonly placeholder="药品名称"></el-input>
        </el-form-item>
       <el-form-item label="供应商" prop="drugsuppliername">
          <el-select v-model="form.drugsuppliername" placeholder="请选择药品供应商">
            <el-option
            v-for="(dict, index) in selectdata"
            :key="index"
            :label="dict"
            :value="dict"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="批次" prop="druginbatch">
          <el-input v-model="form.druginbatch" placeholder="请输入批次" />
        </el-form-item>
        <el-form-item label="厂商" prop="druginfirm">
          <el-input v-model="form.druginfirm" readonly placeholder="药品厂商" />
        </el-form-item>
        <el-form-item  label="数量" prop="druginnum">
          <el-input  :readonly="readonly" v-model.number="form.druginnum" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="生产时间" prop="druginproductiontime">
          <el-date-picker
            clearable
            size="small"
            v-model="form.druginproductiontime"
            type="date"
            value-format="yyyy-MM-dd"
            :picker-options="pickerOptions"
            placeholder="选择生产时间"
          >
          </el-date-picker>
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
import { getname } from "@/api/drug/info";
import {
  listDrugin,
  listDrugin1,
  getDrugin,
  delDrugin,
  addDrugin,
  updateDrugin,
} from "@/api/drug/drugin";
import { getSupplierName } from "@/api/drug/supplier";

export default {
  name: "Drugin",
  data() {
    var inNum = (rule, value, callback) => {
      setTimeout(() => {
        if(value <= 0 ) {
          callback(new Error('无法入库/无意义入库！'));
        } else {
          callback();
        }
      }, 500);
    }
    return {
      //时间选择器
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
      },
      readonly: false,
      //下拉数据
      ListNo: [],
      ListName: [],
      //供应商下拉数据
      selectdata: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      idNo: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 默认排序
      defaultSort: { prop: "drugintime", order: "descending" },
      // 药品入库表格数据
      druginList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //
      drugname: "",
      druginList1:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        druginno: null,
        druginname: null,
        drugintime: null,
        druginfirm: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        druginno: [
          { required: true, message: "药品编号不能为空", trigger: "blur" },
        ],
        druginnum: [
          { required: true, message: "数量不能为空", trigger: "blur" },
          { type: 'number', message: "请输入数字", trigger: 'blur'},
          { validator: inNum, trigger: 'blur'}
        ],
        druginproductiontime: [
          { required: true, message: "生产时间不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getlistNopage();
    this.Getname();
    this.getnamedata();
  },
  mounted(){
     setTimeout(() => {
      this.timewarning();
    }, 1000);
  },
  methods: {
        timewarning() {
         
      for (let i = 0; i < this.druginList1.length; i++) {
        if (this.druginList1[i].time > 0 &&this.druginList1[i].time <= 90) {
          setTimeout(() => {
            this.$notify({
              title: "药品即将过期警告",
              message: "生产时间为"+this.druginList1[i].druginproductiontime+"的"+ this.druginList1[i].druginname+"药品，"+this.druginList1[i].time+"天后过期！",
              type: "warning",
              offset: 100,
              duration: 0,
            });
          }, 500);
        }
        if(this.druginList1[i].time <=0){
          setTimeout(() => {
            this.$notify.error({
              title: "药品过期警告",
              message: "生产时间为"+this.druginList1[i].druginproductiontime+"的"+ this.druginList1[i].druginname+"药品，现已过期,请勿使用",
            });
          }, 500);
        }
      }
    },
    getlistNopage(){
        listDrugin1(this.queryParams).then((response)=>{
            this.druginList1 = response.rows;
            // console.log(this.druginList1);
          })
    },
    /** 查询供应商下拉框数据 */
    getnamedata() {
      this.loading = true;
      getSupplierName().then((response) =>{
        this.datalist = response.data
        for(var i=0;i<this.datalist.length;i++) {
            this.selectdata.push(this.datalist[i].suppliername)
        }
        // console.log(this.selectdata);
      })
    },
    //当联动下拉数据 编号联动名称和厂商
    changeSelect() {
      this.form.druginname = "";
      this.form.druginfirm = "";
      for (var i = 0; i < this.ListNo.length; i++) {
        if (this.form.druginno === this.ListNo[i].name) {
          this.form.druginname = this.ListNo[i].value;
          this.form.druginfirm = this.ListNo[i].vendor;
        }
      }
    },
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    //下拉选择
    Getname() {
      this.loading = true;
      getname(this.queryParams).then((response) => {
        this.getnamelist = response.data;
        // console.log(this.getnamelist);
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
    /** 查询药品入库列表 */
    getList() {  
      let _this = this;
      this.loading = true;
      listDrugin(this.queryParams).then((response) => {
        this.druginList = response.rows;
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
        druginid: null,
        druginno: null,
        druginname: null,
        drugsuppliername: null,
        drugintime: null,
        druginbatch: null,
        druginfirm: null,
        druginnum: null,
        druginproductiontime: null,
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
      this.ids = selection.map((item) => item.druginid);
      this.idNo = selection.map((item) => item.druginno);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.readonly = false;
      this.open = true;
      this.title = "添加药品入库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const druginid = row.druginid || this.ids;
      getDrugin(druginid).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改药品入库";
      });
      this.readonly = true;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.druginid != null) {
            updateDrugin(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
              this.open = false;
            });
          } else {
            addDrugin(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.getList();
              this.open = false;
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const druginids = row.druginid || this.ids;
      const druginNos = row.druginno || this.idNo;
      this.$modal
        .confirm('是否确认删除药品编号为"' + druginNos + '"的数据项？')
        .then(function () {
          return delDrugin(druginids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "drug/drugin/export",
        {
          ...this.queryParams,
        },
        `drugin_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
