<template>
  <div ref="three" class="login">
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
    >
      <h3 class="title">医院药品出入库管理系统</h3>
      <el-form-item prop="username">
        <el-input
          v-model="loginForm.username"
          type="text"
          auto-complete="off"
          placeholder="账号"
        >
          <svg-icon
            slot="prefix"
            icon-class="user"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="loginForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon
            slot="prefix"
            icon-class="password"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <!-- <el-form-item prop="code" v-if="captchaOnOff">
        <el-input
          v-model="loginForm.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="login-code">
          <img :src="codeUrl" @click="getCode" class="login-code-img"/>
        </div>
      </el-form-item> -->
      <el-checkbox
        v-model="loginForm.rememberMe"
        style="margin: 0px 0px 25px 0px"
        >记住密码</el-checkbox
      >
      <el-form-item style="width: 100%">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width: 100%"
          @click.native.prevent="handleLogin"
        >
          <span v-if="!loading">登 录</span>
          <span v-else>登 录 中...</span>
        </el-button>
        <div style="float: right" v-if="register">
          <router-link class="link-type" :to="'/register'"
            >立即注册</router-link
          >
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-login-footer">
      <span>2022 © Liuyb 医院药品出入库管理系统</span>
    </div>
  </div>
</template>

<script>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";
import TWEEN from "three-tween";

const bufArrays = [];
let current = 0;

export default {
  name: "Login",
  data() {
    return {
      codeUrl: "",
      loginForm: {
        username: "",
        password: "",
        rememberMe: false,
        code: "",
        uuid: "",
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
      },
      loading: false,
      // 验证码开关
      captchaOnOff: true,
      // 注册开关
      register: false,
      redirect: undefined,
    };
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true,
    },
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  mounted() {
    this._initBase();
  },
  methods: {
    // three.js 登录粒子动画
    _initBase() {
      this.scene = new THREE.Scene();
      this.scene.background = this.backgroundTexture();
      this.camera = new THREE.PerspectiveCamera(
        45,
        window.innerWidth / window.innerHeight,
        0.2,
        80
      );
      this.camera.position.set(0, 0, 4);
      this.renderer = new THREE.WebGLRenderer({ antialias: true });
      this.renderer.setPixelRatio(window.devicePixelRatio);
      this.renderer.setSize(window.innerWidth, window.innerHeight);
      const manager = new THREE.LoadingManager();
      manager.onStart = (url, itemsLoaded, itemsTotal) => {};
      manager.onLoad = () => {
        this.transition();
      };
      manager.onError = (url) => {
        console.log(url);
      };
      const gltfLoader = new GLTFLoader(manager);
      gltfLoader.load("/box.glb", (gltf) => {
        gltf.scene.traverse((child) => {
          if (child.isMesh) {
            child.geometry.translate(0, 0.5, 0);
            const { array } = child.geometry.attributes.position;
            bufArrays.push(array);
          }
        });
      });
      gltfLoader.load("/box1.glb", (gltf) => {
        gltf.scene.traverse((child) => {
          if (child.isMesh) {
            child.geometry.scale(0.5, 0.5, 0.5);
            const { array } = child.geometry.attributes.position;
            bufArrays.push(array);
          }
        });
      });
      gltfLoader.load("/sphere.glb", (gltf) => {
        gltf.scene.traverse((child) => {
          if (child.isMesh) {
            child.geometry.translate(1, 0, 0);
            const { array } = child.geometry.attributes.position;
            bufArrays.push(array);
          }
        });
      });
      this.geometry = new THREE.BufferGeometry();
      this.geometry.tween = [];
      const vertices = [];
      for (let i = 0; i < 26016; i++) {
        const position = THREE.MathUtils.randFloat(-4, 4);
        this.geometry.tween.push(
          new TWEEN.Tween({ position }).easing(TWEEN.Easing.Exponential.In)
        );
        vertices.push(position);
      }
      this.geometry.setAttribute(
        "position",
        new THREE.BufferAttribute(new Float32Array(vertices), 3)
      );
      this.points = new THREE.Points(
        this.geometry,
        new THREE.PointsMaterial({
          size: 0.062,
          map: new THREE.TextureLoader().load("/white-dot.png"),
          alphaTest: 0.1,
          opacity: 0.5,
          transparent: true,
          depthTest: true,
        })
      );
      this.scene.add(this.points);
      this.controls = new OrbitControls(this.camera, this.renderer.domElement);
      this.controls.update();
      this.$refs.three.appendChild(this.renderer.domElement);
      window.addEventListener("resize", this.onWindowResize, false);
      this.render();
    },
    transition() {
      const self = this;
      for (let i = 0, j = 0; i < 26016; i++, j++) {
        const item = this.geometry.tween[i];
        if (j >= bufArrays[current].length) {
          j = 0;
        }
        item
          .to(
            { position: bufArrays[current][j] },
            THREE.MathUtils.randFloat(1000, 4000)
          )
          .onUpdate(function () {
            self.geometry.attributes.position.array[i] = this.position;
            self.geometry.attributes.position.needsUpdate = true;
          })
          .start();
      }
      setTimeout(() => {
        this.transition();
      }, 5000);
      current = (current + 1) % 3;
    },
    render() {
      this.points.rotation.x += 0.0003;
      this.points.rotation.y += 0.001;
      this.points.rotation.z += 0.002;
      TWEEN.update();
      this.renderer.render(this.scene, this.camera);
      requestAnimationFrame(this.render);
    },
    onWindowResize() {
      this.renderer.setSize(window.innerWidth, window.innerHeight);
      this.camera.aspect = window.innerWidth / window.innerHeight;
      this.camera.updateProjectionMatrix();
    },
    backgroundTexture() {
      const canvas = document.createElement("canvas");
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
      const ctx = canvas.getContext("2d");
      const gradient = ctx.createLinearGradient(0, 0, window.innerWidth, 0);
      gradient.addColorStop(0, "#8DD65C"); //'#4e22b7'
      gradient.addColorStop(1, "#4EC6E4"); //'#3292ff'
      ctx.fillStyle = gradient;
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      const canvasTexture = new THREE.CanvasTexture(canvas);
      return canvasTexture;
    },
    //----------------------------------------------------------------------------------------------
    getCode() {
      getCodeImg().then((res) => {
        this.captchaOnOff =
          res.captchaOnOff === undefined ? true : res.captchaOnOff;
        if (this.captchaOnOff) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get("rememberMe");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password:
          password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe),
      };
    },
    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), {
              expires: 30,
            });
            Cookies.set("rememberMe", this.loginForm.rememberMe, {
              expires: 30,
            });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove("rememberMe");
          }
          this.$store
            .dispatch("Login", this.loginForm)
            .then(() => {
              this.$router.push({ path: this.redirect || "/" }).catch(() => {});
            })
            .catch(() => {
              this.loading = false;
              if (this.captchaOnOff) {
                this.getCode();
              }
            });
        }
      });
    },
  },
};
</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  // display: flex;
  // justify-content: center;
  // align-items: center;
  height: 100%;
  // background-image: url("../assets/images/login.jpeg");
  // background-size: cover;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.login-form {
  border-radius: 6px;
  background: #fffefe88;
  width: 400px;
  position: absolute;
  left: 70%;
  top: 30%;
  padding: 25px 25px 5px 25px;
  z-index: 1000;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.login-code-img {
  height: 38px;
}
</style>
