<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="70px"
    >
      <el-form-item label="药品编号" prop="drugoutno">
        <el-input
          v-model="queryParams.drugoutno"
          placeholder="请输入药品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="drugoutname">
        <el-input
          v-model="queryParams.drugoutname"
          placeholder="请输入药品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出库时间" prop="drugouttime">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.drugouttime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择出库时间"
          @change="handleQuery"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="批次" prop="drugoutbatch">
        <el-input
          v-model="queryParams.drugoutbatch"
          placeholder="请输入批次"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出库数量" prop="drugoutnum">
        <el-input
          v-model="queryParams.drugoutnum"
          placeholder="请输入出库数量"
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
          v-hasPermi="['drug:out:add']"
          >出库</el-button
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
          v-hasPermi="['drug:out:edit']"
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
          v-hasPermi="['drug:out:remove']"
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
          v-hasPermi="['drug:out:export']"
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
      :data="outList"
      @selection-change="handleSelectionChange"
      :default-sort="defaultSort"
      @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" type="index" />
      <el-table-column label="药品编号" align="center" prop="drugoutno" />
      <el-table-column label="药品名称" align="center" prop="drugoutname" show-overflow-tooltip />
      <el-table-column
        label="出库时间"
        align="center"
        prop="drugouttime"
        width="180"
        sortable
        :sort-orders="['descending', 'ascending']"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.drugouttime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="批次" align="center" prop="drugoutbatch" />
      <el-table-column label="现有库存" align="center" prop="stocknum">
        <template slot-scope="scope">
          <el-tag :type="'primary'">
            {{ scope.row.stocknum }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="出库数量" align="center" prop="drugoutnum" />
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
            v-hasPermi="['drug:out:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drug:out:remove']"
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

    <!-- 添加或修改出库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="药品编号" prop="drugoutno">
          <el-select
            v-model="form.drugoutno"
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
        <el-form-item label="药品名称" prop="drugoutname">
          <el-input
            v-model="form.drugoutname"
            readonly
            placeholder="药品名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="批次" prop="drugoutbatch">
          <el-select v-model="form.drugoutbatch" placeholder="请选择药品批次">
            <el-option
              v-for="(dict, index) in vendorList"
              :key="index"
              :label="dict"
              :value="dict"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="出库数量" prop="drugoutnum">
          <el-input
            :readonly="readonly"
            v-model.number="form.drugoutnum"
            placeholder="请输入出库数量"
          />
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
  listOut,
  getOut,
  delOut,
  addOut,
  updateOut,
  getBatch,
} from "@/api/drug/out";
import { getname } from "@/api/drug/info";
export default {
  name: "Out",
  data() {
    let outNum = (rule, value, callback) => {
      setTimeout(() => {
        if (value <= 0) {
          callback(new Error("无法出库/无意义出库！"));
        } else if (value > this.NowStockNum) {
          callback(new Error("超出现有库存,无法出库！"));
        } else {
          callback();
        }
      }, 500);
    };
    return {
      batch: [],
      //厂商下拉选择
      vendorList: [],
      //现有库存数 -> 数据校验时    默认给 0 时有问题  随便给个字符串作为初始值
      NowStockNum: "aaa",
      //下拉数据
      ListNo: [],
      readonly: false,
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
      // 默认排序
      defaultSort: { prop: "drugouttime", order: "descending" },
      // 出库表格数据
      outList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      getListArr: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        drugoutname: null,
        drugoutno: null,
        drugouttime: null,
        drugoutbatch: null,
        drugoutnum: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        drugoutno: [
          { required: true, message: "药品编号不能为空", trigger: "blur" },
        ],
        //出库数量不能大于库存数量且大于0
        drugoutnum: [
          { required: true, message: "出库数量不能为空", trigger: "blur" },
          { type: "number", message: "请输入数字", trigger: "blur" },
          { validator: outNum, trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.Getname();
    this.getbatch();
  },
  methods: {
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /** 查询出库列表 */
    getList() {
      this.loading = true;
      listOut(this.queryParams).then((response) => {
        this.outList = response.rows;
        this.total = response.total;
        this.loading = false;
        // console.log(this.outList);
        // var getListjSON = {};
        // for (var i = 0; i < this.outList.length; i++) {
          // getListjSON["name"] = this.outList[i].drugoutno;
          // getListjSON["value"] = this.outList[i].stocknum;
          // getListjSON["batch"] = this.outList[i].drugoutbatch;
          // this.getListArr.push(getListjSON);
          // getListjSON = {};
        // }
        // console.log(this.getListArr);
      });
    },
    //下拉选择
    Getname() {
      // this.loading = true;
      getname(this.queryParams).then((response) => {
        this.getnamelist = response.data;
        var jsondata = {};
        for (var i = 0; i < this.getnamelist.length; i++) {
          jsondata["name"] = this.getnamelist[i].drugno;
          jsondata["value"] = this.getnamelist[i].drugname;
          this.ListNo.push(jsondata);
          jsondata = {};
        }
        console.log(this.ListNo);
      });
    },
    //当联动下拉数据 编号联动名称 二级联动批次  数据校验等
    changeSelect() {
      // this.form.drugoutname = "";
      this.form.drugoutbatch="";
      this.vendorList = [];
      for (var i = 0; i < this.ListNo.length; i++) {
        if (this.form.drugoutno === this.ListNo[i].name) {
          // 编号联动名称
          this.form.drugoutname = this.ListNo[i].value;
          // 二级联动  选定药品编号以后，会把这个编号下的批次放入vendorList中，
          //为了下拉选择不会选到不属于自己药品编号的批次
          for (var j = 0; j < this.batch.length; j++) {
            if (this.ListNo[i].name == this.batch[j].name) {
              // 默认批次置空
               this.form.drugoutbatch = "";
              // 现有库存数 ——> 数据校验用
              this.NowStockNum = this.batch[j].num;
              this.vendorList.push(this.batch[j].value);
            }
          }
        }
      }
      // console.log(this.NowStockNum);
      // console.log(this.vendorList);
    },

    /**
     * @Author  Liuyb
     * @时间 2022-04-24 09:01:25
     * @功能 获取药品入库的所有批次 为二级数据联动的数据源
     * @param
     */
    getbatch() {
      getBatch().then((response) => {
        this.batchlist = response.data;
        // console.log(this.batchlist);
        var batchdata = {};
        for (var i = 0; i < this.batchlist.length; i++) {
          batchdata["name"] = this.batchlist[i].druginno;
          batchdata["value"] = this.batchlist[i].druginbatch;
          batchdata["num"] = this.batchlist[i].druginnum;
          this.batch.push(batchdata);
          batchdata = {};
        }
        // console.log(this.batch);
      });
    },
    // 取消按钮
    cancel() {
      // this.NowStockNum = 0;
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        drugoutid: null,
        drugoutname: null,
        drugoutno: null,
        // drugouttime: null,
        drugoutbatch: null,
        drugoutnum: null,
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
      this.ids = selection.map((item) => item.drugoutid);
      this.nos = selection.map((item) => item.drugoutno);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.readonly = false;
      this.open = true;
      this.title = "添加出库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const drugoutid = row.drugoutid || this.ids;
      getOut(drugoutid).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改出库";
      });
      this.readonly = true;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.drugoutid != null) {
            updateOut(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
              this.open = false;
              // location.reload(true);
            });
          } else {
            addOut(this.form).then((response) => {
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
      const drugoutids = row.drugoutid || this.ids;
      const drugoutnos = row.drugoutno || this.nos;
      this.$modal
        .confirm('是否确认删除出库编号为"' + drugoutnos + '"的数据项？')
        .then(function () {
          return delOut(drugoutids);
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
        "drug/out/export",
        {
          ...this.queryParams,
        },
        `out_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
