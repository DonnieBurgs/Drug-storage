<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="70px"
    >
      <el-form-item label="药品编号" prop="drugno">
        <el-input
          v-model="queryParams.drugno"
          placeholder="请输入药品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名" prop="drugname">
        <el-input
          v-model="queryParams.drugname"
          placeholder="请输入药品名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="存放地点" prop="drugplace">
        <el-input
          v-model="queryParams.drugplace"
          placeholder="请输入存放地点"
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
          v-hasPermi="['drug:info:add']"
          >药品</el-button
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
          v-hasPermi="['drug:info:edit']"
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
          v-hasPermi="['drug:info:remove']"
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
          v-hasPermi="['drug:info:export']"
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
      :data="infoList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" type="index" />
      <el-table-column label="药品编号" align="center" prop="drugno" />
      <el-table-column label="药品名" align="center" prop="drugname" />
      <el-table-column label="保质期/月" align="center" prop="drugexpirydata" />
      <el-table-column label="厂商" align="center" prop="drugvendor"  show-overflow-tooltip/>
      <el-table-column label="规格" align="center" prop="drugspec" show-overflow-tooltip />
      <el-table-column label="存放地点" align="center">
        <template slot-scope="scope">
          <el-tag :type="'primary'">
            {{ scope.row.drugplace }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="用法用量" align="center" prop="drugused" show-overflow-tooltip />
      <el-table-column label="库存预警" align="center" prop="drugwarning" />
      <el-table-column label="备注" align="center" prop="drugremark" show-overflow-tooltip />
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
            v-hasPermi="['drug:info:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['drug:info:remove']"
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

    <!-- 添加或修改药品信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="药品编号" prop="drugno">
          <el-input v-model="form.drugno" placeholder="请输入药品编号" />
        </el-form-item>
        <el-form-item label="药品名" prop="drugname">
          <el-input v-model="form.drugname" placeholder="请输入药品名" />
        </el-form-item>
        <el-form-item label="保质期/月" prop="drugexpirydata">
          <el-input
            v-model="form.drugexpirydata"
            placeholder="请输入保质期/月"
          />
        </el-form-item>
        <el-form-item label="厂商" prop="drugvendor">
          <el-input v-model="form.drugvendor" placeholder="请输入厂商" />
        </el-form-item>
        <el-form-item label="规格" prop="drugspec">
          <el-input v-model="form.drugspec" placeholder="请输入规格" />
        </el-form-item>
        <el-form-item label="存放地点" prop="drugplace">
          <el-input v-model="form.drugplace" placeholder="请输入存放地点" />
        </el-form-item>
        <el-form-item label="用法用量" prop="drugused">
          <el-input v-model="form.drugused" placeholder="请输入用法用量" />
        </el-form-item>
        <el-form-item label="库存预警" prop="drugwarning">
          <el-input v-model.number="form.drugwarning" placeholder="请输入库存预警" />
        </el-form-item>
        <el-form-item label="备注" prop="drugremark">
          <el-input
            v-model="form.drugremark"
            type="textarea"
            placeholder="请输入内容"
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
  listInfo,
  getInfo,
  delInfo,
  addInfo,
  updateInfo,
} from "@/api/drug/info";


export default {
  name: "Info",
  data() {
     var inNum = (rule, value, callback) => {
      setTimeout(() => {
        if(value <= 0 ) {
          callback(new Error('预警值无意义/不合理！'));
        } else {
          callback();
        }
      }, 500);
    }
    return {
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
      // 药品信息管理表格数据
      infoList: [],
      // 弹出层标题
      title: "",

      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        drugno: null,
        drugname: null,
        drugplace: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        drugno: [
          { required: true, message: "药品编号不能为空", trigger: "blur" },
        ],
        drugname: [
          { required: true, message: "药品名不能为空", trigger: "blur" },
        ],
        drugexpirydata: [
          { required: true, message: "保质期/月不能为空", trigger: "blur" },
        ],
        drugvendor: [
          { required: true, message: "厂商不能为空", trigger: "change" },
        ],
        drugspec: [
          { required: true, message: "规格不能为空", trigger: "blur" },
        ],
        drugplace: [
          { required: true, message: "存放地点不能为空", trigger: "blur" },
        ],
        drugwarning: [
          { required: true, message: "库存预警不能为空", trigger: "blur" },
          { type: 'number', message: "请输入数字", trigger: 'blur'},
          { validator: inNum, trigger: 'blur'}
        ],
      },
    };
  },
  created() {
    this.getList();
 
  },
  methods: {
    /** 查询药品信息管理列表 */
    getList() {
      this.loading = true;
      listInfo(this.queryParams).then((response) => {
        this.infoList = response.rows;
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
        drugid: null,
        drugno: null,
        drugname: null,
        drugexpirydata: null,
        drugvendor: null,
        drugspec: null,
        drugplace: null,
        drugused: null,
        drugwarning: null,
        drugremark: null,
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
      this.ids = selection.map((item) => item.drugid);
      this.nos = selection.map((item) => item.drugno);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加药品信息管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const drugid = row.drugid || this.ids;
      getInfo(drugid).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改药品信息管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.drugid != null) {
            updateInfo(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
              this.open = false;
             
            });
          } else {
            addInfo(this.form).then((response) => {
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
      const drugids = row.drugid || this.ids;
      const drugnos = row.drugno || this.nos ;
      this.$modal
        .confirm('是否确认删除药品信息管理编号为"' + drugnos + '"的数据项？')
        .then(function () {
          return delInfo(drugids);
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
        "drug/info/export",
        {
          ...this.queryParams,
        },
        `info_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
