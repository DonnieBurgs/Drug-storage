<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="70px"
    >
      <el-form-item label="药品编号" prop="stockdrugno">
        <el-input
          v-model="queryParams.stockdrugno"
          placeholder="请输入药品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名" prop="stockdrugname">
        <el-input
          v-model="queryParams.stockdrugname"
          placeholder="请输入药品名"
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
          disabled
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['drug:stock:add']"
          >新增</el-button
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
          v-hasPermi="['drug:stock:edit']"
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
          v-hasPermi="['drug:stock:remove']"
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
          v-hasPermi="['drug:stock:export']"
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
      :data="stockList"
      :default-sort="defaultSort"
      @sort-change="handleSortChange"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" type="index" />
      <el-table-column label="药品编号" align="center" prop="stockdrugno" />
      <el-table-column label="药品名" align="center" prop="stockdrugname" show-overflow-tooltip />
      <el-table-column label="厂商" align="center" prop="drugvendor" show-overflow-tooltip />
      <el-table-column
        label="库存"
        align="center"
        prop="stocknum"
        sortable
        :sort-orders="['descending', 'ascending']"
      />
      <el-table-column label="库存" align="center" prop="num">
        <template slot-scope="scope">
          <el-tag
            :value="scope.row.num"
            v-text="scope.row.num <= 0 ? '库存不足' : '库存充足'"
            :type="scope.row.num <= 0 ? 'danger' : 'success'"
          >
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="存放地点" align="center" prop="drugplace" />
      <el-table-column label="预警值" align="center" prop="drugwarning" />
      <el-table-column label="用法用量" align="center" prop="drugused" show-overflow-tooltip />
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
            v-hasPermi="['drug:stock:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drug:stock:remove']"
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

    <!-- 添加或修改库存对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="药品编号" prop="stockdrugno">
          <el-select
            v-model="form.stockdrugno"
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
        <el-form-item label="药品名" prop="stockdrugname">
          <el-input
            v-model="form.stockdrugname"
            readonly
            placeholder="药品名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="库存" prop="stocknum">
          <el-input v-model.number="form.stocknum" placeholder="请输入库存" />
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
import {
  listStock,
  listStock1,
  getStock,
  delStock,
  addStock,
  updateStock,
} from "@/api/drug/stock";
import { getname } from "@/api/drug/info";
export default {
  name: "Stock",
  data() {
    var checkStockNum = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("库存不能为空"));
      }
      setTimeout(() => {
        if (value < 0) {
          callback(new Error("不能为负"));
        } else {
          callback();
        }
      }, 500);
    };
    return {
      ListNo: [],
      // 遮罩层
      loading: true,
      // 默认排序
      defaultSort: { prop: "stocknum", order: "ascending" },
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
      // 库存表格数据
      stockList: [],
      stockList1:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stockdrugno: null,
        stockdrugname: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stockdrugno: [
          { required: true, message: "药品编号不能为空", trigger: "blur" },
        ],
        stockdrugname: [
          { required: true, message: "药品名不能为空", trigger: "blur" },
        ],
        stocknum: [
          { validator: checkStockNum, trigger: "blur" },
          {
            type: "number",
            required: true,
            message: "请输入数字",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getListNoPage();
    this.Getname();
  },
  mounted(){
  setTimeout(() => {
      this.stockwarning();
    }, 1000);
  },
  methods: {
    //进行库存不足警告
    stockwarning() {
      for (let i = 0; i < this.stockList1.length; i++) {
        if (this.stockList1[i].num <= 0) {
          // console.log(this.stockList[i]);
          setTimeout(() => {
            this.$notify({
              title: "库存不足警告",
              message:
                this.stockList1[i].stockdrugname +
                " 库存数量为 " +
                this.stockList1[i].stocknum +
                " ,请及时补充",
              type: "warning",
              offset: 100,
              duration: 0,
            });
          }, 500);
        }
      }
    },
    //不分页
    getListNoPage(){
        listStock1(this.queryParams).then((response)=>{
            this.stockList1 = response.rows;
            // console.log(this.stockList1);
          })
    },
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /** 查询库存列表 */
    getList() {
      this.loading = true;
      listStock(this.queryParams).then((response) => {
        this.stockList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
          // jsondata["vendor"] = this.getnamelist[i].drugvendor;
          this.ListNo.push(jsondata);
          jsondata = {};
        }
        // console.log(this.ListNo);
      });
    },
    //当联动下拉数据 编号联动名称和厂商
    changeSelect() {
      debugger;
      this.form.stockdrugname = "";
      for (var i = 0; i < this.ListNo.length; i++) {
        if (this.form.stockdrugno === this.ListNo[i].name) {
          this.form.stockdrugname = this.ListNo[i].value;
          // this.form.drugoutvendor = this.ListNo[i].vendor
        }
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        stockid: null,
        stockdrugno: null,
        stockdrugname: null,
        stocknum: null,
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
      this.ids = selection.map((item) => item.stockid);
      this.nos = selection.map((item) => item.stockdrugno);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加库存";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const stockid = row.stockid || this.ids;
      getStock(stockid).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改库存";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.stockid != null) {
            updateStock(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
              this.open = false;
              // location.reload(true);
            });
          } else {
            addStock(this.form).then((response) => {
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
      const stockids = row.stockid || this.ids;
      const stocknos = row.stockdrugno || this.nos;
      this.$modal
        .confirm('是否确认删除库存编号为"' + stocknos + '"的数据项？')
        .then(function () {
          return delStock(stockids);
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
        "drug/stock/export",
        {
          ...this.queryParams,
        },
        `stock_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
