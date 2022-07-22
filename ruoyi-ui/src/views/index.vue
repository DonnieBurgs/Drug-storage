<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col
        style="
          background: #fff;
          padding: 16px 16px 0;
          margin-left: 50px;
          margin-bottom: 32px;
        "
        :xs="25"
        :sm="25"
        :lg="7"
      >
        <div id="lefttop" style="width: 100%; height: 370px; float: left"></div>
      </el-col>
      <el-col
        style="
          background: #fff;
          padding: 16px 16px 0;
          margin-left: 32px;
          margin-bottom: 32px;
        "
        :xs="25"
        :sm="25"
        :lg="8"
      >
        <div
          id="middletop"
          style="width: 100%; height: 370px; float: left"
        ></div>
      </el-col>
      <el-col
        style="
          background: #fff;
          padding: 16px 16px 0;
          margin-left: 32px;
          margin-bottom: 32px;
        "
        :xs="25"
        :sm="25"
        :lg="7"
      >
        <div
          id="righttop"
          style="width: 100%; height: 370px; float: left"
        ></div>
      </el-col>
    </el-row>
    <el-row :gutter="32">
      <el-col
        style="background: #fff; padding: 16px 16px 0; margin-left: 50px"
        :xs="27"
        :sm="23"
        :lg="11"
      >
        <div
          id="leftbottom"
          style="width: 100%; height: 350px; float: left"
        ></div>
      </el-col>
      <el-col
        style="background: #fff; padding: 16px 16px 0; margin-left: 60px"
        :xs="27"
        :sm="23"
        :lg="11"
      >
        <div
          id="rightbottom"
          style="width: 100%; height: 350px; float: left"
        ></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { listStock } from "@/api/drug/stock";
import { ChartData, getDrugMonth } from "@/api/drug/drugin";
import { getdatalist, getdatamonth } from "@/api/drug/out";
import { UntreadChartData} from "@/api/drug/untread";

export default {
  name: "Index",
  data() {
    return {
      //左上图
      XData: [],
      YData: [],
      Warning: [], //库存预警值
      //本月入库记录
      rightdata: [],
      //本月出库记录
      rightdata2: [],
      //左下
      line1: [],
      Dataline1: [],
      line2: [],
      Dataline2: [],
      //右下
      DataRight:[],
      DataRight1:[],

    };
  },
  mounted() {
    setTimeout(() => {
      this.$nextTick(() => {
        this.myEchart1();
        this.myEchart2();
        this.myEchart3();
        this.myEchart4();
        this.myEchart5();
      });
    }, 500);
    setTimeout(() => {
      this.stockwarning();
    }, 1000);
  },
  created() {
    this.getList();
    this.getChartData();
    this.getChartData2();
    this.getChartline1();
    this.getChartData5(); 
  },
  methods: {
    /**
     * @Author  Liuyb
     * @时间 2022-04-16 18:53:10
     * @功能 进行库存不足警告
     * @param  
    */
    stockwarning() {
      for (let i = 0; i < this.stockList.length; i++) {
        if (this.stockList[i].num <= 0) {
          setTimeout(() => {
            this.$notify({
              title: "库存不足警告",
              message:
                this.stockList[i].stockdrugname +
                " 库存数量为 " +
                this.stockList[i].stocknum +
                " ,请及时补充",
              type: "warning",
              offset: 100,
              duration: 0,
            });
          }, 500);
        }
      }
    },
    /**
     * @Author  Liuyb
     * @时间 2022-02-25 15:47:17
     * @功能 查询药品库存信息 stock
     * @param
     */
    getList() {
      this.loading = true;
      listStock(this.queryParams).then((response) => {
        this.stockList = response.rows;
        for (var i = 0; i < this.stockList.length; i++) {
          this.XData.push(this.stockList[i].stockdrugname);
          this.YData.push(this.stockList[i].stocknum);
          this.Warning.push(this.stockList[i].drugwarning);
        }
      });
    },
    /**
     * @Author  Liuyb
     * @时间 2022-02-25 15:46:10
     * @功能 本月药品入库的数据 drug_in
     *
     */
    getChartData() {
      this.loading = true;
      ChartData().then((response) => {
        this.chartdata = response;
        var jsondata = {};
        //数据格式处理为json格式，并放入数组
        for (var i = 0; i < this.chartdata.data.length; i++) {
          jsondata["name"] = this.chartdata.data[i].druginname;
          jsondata["value"] = this.chartdata.data[i].druginnum;
          this.rightdata.push(jsondata);
          jsondata = {};
        }
      });
    },
    /**
     * @Author  Liuyb
     * @时间 2022-02-28 15:45:22
     * @功能 本月药品出库的数据 drug_out
     */
    getChartData2() {
      this.loading = true;
      getdatalist().then((response) => {
        this.chartdata2 = response.data;
        var jsondata2 = {};
        for (var i = 0; i < this.chartdata2.length; i++) {
          jsondata2["name"] = this.chartdata2[i].drugoutname;
          jsondata2["value"] = this.chartdata2[i].drugoutnum;
          this.rightdata2.push(jsondata2);
          jsondata2 = {};
        }
        console.log(this.rightdata2);
      });
    },
    /**
     * @Author  Liuyb
     * @时间 2022-03-01 16:33:47
     * @功能 处理按月出库数据
     * @param
     */
    getChartline1() {
      this.loading = true;
      getdatamonth().then((response) => {
        this.linedata = response.data;
        for (var i = 0; i < this.linedata.length; i++) {
          //将时间格式改为 yy-mm
          var data = this.linedata[i].drugouttime.toString();
          var data1 = data.substr(0, 7);
          this.line1.push(data1);
          this.Dataline1.push(this.linedata[i].drugoutnum);
        }
      });
      getDrugMonth().then((response) => {
        this.listdata = response.data;
        for (var i = 0; i < this.listdata.length; i++) {
          var date1 = this.listdata[i].drugintime.toString();
          var date2 = date1.substr(0, 7);
          this.line2.push(date2);
          this.Dataline2.push(this.listdata[i].druginnum);
        }
      });
    },

    /**
     * @Author  Liuyb
     * @时间 2022-03-02 17:00:52
     * @功能 散点图数据及处理
    */
   getChartData5() {
     this.loading = true;
     UntreadChartData().then((response) => {
       this.DataRight = response.data;
       var jsondata5 ={};
       for(var i=0;i<this.DataRight.length;i++) {
        //  jsondata5['name'] = this.DataRight[i].untreadname;
        // debugger
        var name = this.DataRight[i].untreaddrugname
        jsondata5['name'] =i+1 +'名称:' + name;
         jsondata5['value'] = this.DataRight[i].untreadnum;
         this.DataRight1.push(jsondata5)
         jsondata5 = {};
       }
       console.log(this.DataRight1);
     })

   },

    /**
     * @Author  Liuyb
     * @时间 2022-02-24 15:43:21
     * @功能 柱状图
     * @展示库存
     */
    myEchart1() {
      var myChart = this.$echarts.init(document.getElementById("lefttop"));
      //配置图表
      var option = {
        title: {
          text: "现有库存记录",
        },
        tooltip: {},
        legend: {
          data: ["库存", "预警值"],
        },
        xAxis: {
          data: this.XData,
        },
        yAxis: {},
        series: [
          {
            name: "库存",
            type: "bar",
            barWidth: "25",
            data: this.YData,
            itemStyle: {
              barBorderRadius: [15, 15, 0, 0],
              color: new this.$echarts.graphic.LinearGradient(0, 1, 0, 0, [
                {
                  offset: 0,
                  color: "rgba(65,159,255,0.3)",
                },
                {
                  offset: 1,
                  color: "rgba(65,159,255,1)",
                },
              ]),
            },
          },
          {
            name: "预警值",
            type: "line",
            color: "#a90000",
            data: this.Warning,
          },
        ],
      };
      myChart.setOption(option);
    },
    /**
     * @Author  Liuyb
     * @时间 2022-02-25 14:32:42
     * @功能 南丁格尔图
     * @展示本月药品入库
     *
     */
    myEchart2() {
      var myChart = this.$echarts.init(document.getElementById("middletop"));
      var option = {
        title: {
          text: "本月入库药品记录",
          subtext: "药品入库统计",
          left: "center",
        },
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)",
        },
        series: [
          {
            name: "本月入库量/盒",
            type: "pie",
            radius: [20, 130],
            center: ["50%", "50%"],
            roseType: "area",
            color: [
              "#5470c6",
              "#91cc75",
              "#fac858",
              "#ee6666",
              "#73c0de",
              "#3ba272",
              "#fc8452",
              "#9a60b4",
              "#ea7ccc",
            ],
            itemStyle: {
              borderRadius: 5,
            },
            data: this.rightdata,
          },
        ],
      };
      myChart.setOption(option);
    },
    /**
     * @Author  Liuyb
     * @时间 2022-02-25 15:45:05
     * @功能 南丁格尔图
     * @展示本月药品出库
     */
    myEchart3() {
      var myChart = this.$echarts.init(document.getElementById("righttop"));
      let formatNumber = function (num) {
        let reg = /(?=(\B)(\d{3})+$)/g;
        return num.toString().replace(reg, ",");
      };
      let total = this.rightdata2.reduce((a, b) => {
        return a + b.value * 1;
      }, 0);

      var option = {
        backgroundColor: "#fff",
        color: [
          "#c065e7",
          "#765deb",
          "#3862d8",
          "#6a89E2",
          "#219CF9",
          "#6efbbf",
          "#40c057",
          "#ffd351",
          "#ff8e43",
          "#f56b6d",
        ],
        tooltip: {
          trigger: "item",  
          formatter: "{a} <br/>{b} : {c} ({d}%)",
          fontSize: '12',
        },
        title: [
          {
            text: "{name|" + "总量" + "}\n{val|" + formatNumber(total) + "}",
            top: "center",
            left: "center",
            textStyle: {
              rich: {
                name: {
                  fontSize: 14,
                  fontWeight: "normal",
                  color: "#000",
                  padding: [10, 0],
                },
                val: {
                  fontSize: 32,
                  fontWeight: "bolder",
                  color: "#000",
                },
              },
            },
          },
          {
            text: "本月出库药品记录",
            subtext: "药品出库统计",
            left: "center",
            show: true,
          },
        ],
        series: [
          {
            name: "本月出库量/盒",
            type: "pie",
            roseType: "radius",
            radius: ["25%", "65%"],
            center: ["50%", "50%"],
            data: this.rightdata2,
            hoverAnimation: false,
            itemStyle: {
              normal: {
                borderColor: "#fff",
                borderWidth: 2,
              },
            },
            labelLine: {
              normal: {
                length: 10,
                length2: 20,
              },
            },
            label: {
              normal: {
                formatter: (params) => {
                  return (
                    "{icon|●}{name|" +
                    params.name +
                    "}\n{value|" +
                    formatNumber(params.value) +
                    "}"
                  );
                },
                fontSize: 12,
                rich: {
                  value: {
                    fontSize: 14,
                    fontWeight: "bolder",
                    padding: [10, 0, 0, 20],
                    color: "inherit",
                  },
                },
              },
            },
          },
        ],
      };
      myChart.setOption(option);
    },

    /**
     * @Author  Liuyb
     * @时间 2022-03-01 16:12:48
     * @功能 按月统计出库数据
     * @param
     */
    myEchart4() {
      var myChart = this.$echarts.init(document.getElementById("leftbottom"));

      var option = {
        // backgroundColor: "#EEEFED",
        title: {
          text: "按月统计出入库药品记录",
          // subtext: "药品出入库统计",
          show: true,
        },
        grid: [
          {
            show: false,
            left: "5%",
            top: "10%",
            bottom: "8%",
            containLabel: true,
            width: "37%",
          },
          {
            show: false,
            left: "51%",
            top: "10%",
            bottom: "8%",
            width: "0%",
          },
          {
            show: false,
            right: "2%",
            top: "10%",
            bottom: "8%",
            containLabel: true,
            width: "37%",
          },
        ],
        xAxis: [
          {
            type: "value",
            inverse: true,
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: "top",
            axisLabel: {
              show: true,
              color: "#000",
            },
            splitLine: {
              show: true,
              lineStyle: {
                color: "#000",
              },
            },
          },
          {
            gridIndex: 1,
            show: false,
          },
          {
            gridIndex: 2,
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: "top",
            axisLabel: {
              show: true,
              color: "#000",
            },
            splitLine: {
              show: true,
              lineStyle: {
                color: "#000",
              },
            },
          },
        ],
        yAxis: [
          {
            type: "category",
            inverse: true,
            position: "right",
            axisLine: {
              show: true,
              lineStyle: {
                color: "#000",
              },
            },

            axisTick: {
              show: false,
            },
            axisLabel: {
              show: false,
            },
          },
          {
            gridIndex: 1,
            type: "category",
            inverse: true,
            position: "left",
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            axisLabel: {
              show: true,
              padding: [30, 0, 0, 0],
              textStyle: {
                color: "#000",
                fontSize: 14,
              },
              align: "center",
            },
            data: this.line1,
          },
          {
            gridIndex: 2,
            type: "category",
            inverse: true,
            position: "left",
            axisLine: {
              show: true,
              lineStyle: {
                color: '#333',
              },
            },
            axisTick: {
              show: false,
            },
            axisLabel: {
              show: false,
            },
            data: this.line2,
          },
        ],
        tooltip: {
          formatter: "{a}" + ":" + "{c}",
        },
        legend: {
          data: ["出库", "入库"],
        },
        series: [
          {
            name: "出库",
            type: "bar",
            barWidth: '35%',
            stack: "1",
            itemStyle: {
              normal: {
                color: {
                  type: "linear",
                  x: 0,
                  y: 0,
                  x2: 1,
                  y2: 0,
                  colorStops: [
                    {
                      offset: 0,
                      color: "rgba(255, 188, 70, 1)",
                    },
                    {
                      offset: 1,
                      color: "rgba(255, 188, 70, 0.1)",
                    },
                  ],
                  global: false,
                },
              },
            },
            label: {
              normal: {
                show: true,
              },
            },
            data: this.Dataline1,
          },
          {
            name: "入库",
            type: "bar",
            stack: "2",
            barWidth: '35%',
            xAxisIndex: 2,
            yAxisIndex: 2,
            itemStyle: {
              normal: {
                color: {
                  type: "linear",
                  x: 1,
                  y: 0,
                  x2: 0,
                  y2: 0,
                  colorStops: [
                    {
                      offset: 0,
                      color: "rgba(82, 253, 235, 1)",
                    },
                    {
                      offset: 1,
                      color: "rgba(82, 253, 235, 0.1)",
                    },
                  ],
                  global: false,
                },
              },
            },
            label: {
              normal: {
                show: true,
              },
            },
            data: this.Dataline2,
          },
        ],
      };
      myChart.setOption(option);
    },
    myEchart5() {
      var myChart = this.$echarts.init(document.getElementById("rightbottom"));
      var datas = this.DataRight1;
      function compare(propertyName) {
        return function (object1, object2) {
          var value1 = object1[propertyName];
          var value2 = object2[propertyName];
          if (value2 < value1) {
            return 1;
          } else if (value2 > value1) {
            return -1;
          } else {
            return 0;
          }
        };
      }
      datas = datas.sort(compare("value")).reverse();
      var seriesData = [];
      // var maxValue = datas[0].value;
      var colors = [
        "#49CCFF",
        "#20D3AB",
        "#FDD56A",
        "#49CCFF",
        "#20D3AB",
        "#FDD56A",
        "#49CCFF",
        "#20D3AB",
        "#FDD56A",
        "#49CCFF",
        "#20D3AB",
        "#FDD56A",
      ];
      var colors2 = [
        "#49CCFF88",
        "#20D3AB88",
        "#FDD56A88",
        "#49CCFF88",
        "#20D3AB88",
        "#FDD56A88",
        "#49CCFF88",
        "#20D3AB88",
        "#FDD56A88",
        "#49CCFF88",
        "#20D3AB88",
        "#FDD56A88",
      ];
      for (var i = 0; i < datas.length; i++) {
        var ss = 80;
        if (i < 3) {
          ss = 80 - i * 10;
        } else if (3 <= i < 10) {
          ss = 80 - i * 10;
        } else {
          ss = 80 - i * 4;
        }
        var item = {
          name: datas[i].name,
          value: datas[i].value,
          symbolSize: ss,
          draggable: true,
          label: {
            show: true,
            formatter: ["{title|{b}}", "{name|{c}}"].join("\n"),
            rich: {
              title: {
                fontSize: 12,
                color: "#fff",
                textBorderColor: colors[i],
                textBorderWidth: 2,
                textAlign: "center",
                align: "center",
              },
              name: {
                fontSize: 12,
                color: "#fff",
                textBorderColor: colors[i],
                textBorderWidth: 2,
                textAlign: "center",
                align: "center",
              },
            },
          },
          itemStyle: {
            color: {
              type: "radial",
              x: 0.5,
              y: 0.5,
              r: 0.5,
              colorStops: [
                {
                  offset: 0,
                  color: colors[i],
                },
                {
                  offset: 1,
                  color: colors2[i],
                },
              ],
              global: false,
            },
            borderColor: colors[i],
            shadowBlur: 20,
            shadowColor: colors[i],
            borderWidth: 2,
          },
        };

        seriesData.push(item);
      }
     var  option = {
       title: {
         text: "近30条退回药品记录",
          // subtext: "药品出入库统计",
          show: true,
       },
        tooltip: {
          formatter: function (params) {
            // console.log(params);
            var str =
              params.marker +
              "" +
              params.data.name +
              "</br>" +
              "退回数量：" +
              params.data.value +
              "</br>";
            return str;
          },
        },
        animationDurationUpdate: function (idx) {
          // 越往后的数据延迟越大
          return idx * 1;
        },
        animationEasingUpdate: "bounceIn",
        color: ["#fff", "#fff", "#fff"],
        series: [
          {
            type: "graph",
            layout: "force",
            force: {
              repulsion: 130,
              edgeLength: 10,
            },
            roam: true,
            data: seriesData,
          },
        ],
      };
      myChart.setOption(option);
    },
  },
};
</script>

<style scoped lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;
  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>

