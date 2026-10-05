# CLAUDE.md

本文件为 Claude Code（claude.ai/code）在本仓库中工作时提供指导。

## 项目概述

一款 HarmonyOS 应用（bundle 为 `com.example.myapplication`，应用名 "MyApplication"），克隆了大麦/Damai 演唱会购票界面。使用 ArkTS 编写，采用 ArkUI 声明式框架，基于 **Stage 模型**，目标版本为 **HarmonyOS 5.1.0（API 18）**。这是一个学习/演示项目：代码中含有大量中文行内注释、若干硬编码的 mock 值，以及多个遗留的模板/演示页面。

## 工具链与命令

- **构建系统**：Hvigor（由根目录及各模块的 `hvigorfile.ts` 驱动）。仓库中未提交 `hvigorw` 包装脚本 —— 构建/运行通常通过 **DevEco Studio**（Build / Run 菜单）完成。在配置了 `hvigorw` 环境变量的 DevEco Studio 终端中：
  - `hvigorw assembleHap` —— 构建 HAP
  - `hvigorw clean` —— 清理构建产物
- **包管理器**：`ohpm`（HarmonyOS 版的 npm）。依赖声明在根目录 `oh-package.json5` 中，并锁定在 `oh-package-lock.json5`。
  - `ohpm install` —— 安装/恢复依赖到 `oh_modules/`
- **测试**：测试框架为 `@ohos/hypium` + `@ohos/hamock`。
  - 本地单元测试：`entry/src/test/*.test.ets`（无需设备）
  - 仪器化测试：`entry/src/ohosTest/ets/test/*.test.ets`（在设备/模拟器上运行）
  - 测试从 DevEco Studio 执行（Run > 测试配置）；没有 npm 风格的测试脚本。
- **Lint**：DevEco Studio 的代码检查器，配置在 `code-linter.json5` 中（检查 `**/*.ets`，应用 `@typescript-eslint` + `@performance` + `@security` 规则集）。
- **格式化**：`.clang-format`（基于 LLVM，120 列）仅适用于原生 C++ 代码，不适用于 ArkTS。

## 架构

### 模块布局

单模块 `entry`（HAP，`type: "entry"`）。其清单文件为 `entry/src/main/module.json5`；应用级清单为 `AppScope/app.json5`。所有 UI/TS 代码位于 `entry/src/main/ets/` 下，ArkUI `@Entry` 页面在 `entry/src/main/resources/base/profile/main_pages.json` 中注册 —— **页面必须在此文件中注册，才能通过 `router` 进行路由**。

### 应用入口与导航流程

`EntryAbility`（`entry/src/main/ets/entryability/EntryAbility.ets`）是唯一的 UIAbility。在 `onWindowStageCreate` 中加载 `pages/SplashPage` 作为首页，并调用 `initStorage()`（见下文）。导航使用经典的 `@ohos.router`（`pushUrl`/`replaceUrl`），而非更新的 `Navigation` 组件。启动流程为 `SplashPage` → `SplashAd` → `second`（主首页）。主首页使用可复用的 `BottomTab` 组件（`components/BottomTab.ets`）进行标签切换；`Index` 是"我的"标签页。

### 网络与鉴权（三层模式）

这是核心数据流，横跨三个文件：

1. **`utils/request.ets`** —— 底层 HTTP 封装，直接基于 `@ohos.net.http` 构建（注意：声明的 `@ohos/axios` 依赖**并未使用**）。对外暴露 `httpGet`/`httpPost`，设置 `Content-Type: application/json`，并自动从通过 `@ohos.data.preferences` 持久化的 token 中挂载 `Authorization` 请求头。基础 URL 硬编码为 Apifox mock 地址：`http://10.0.2.2:4523/m1/8469387-8241802-default`。当 `result.code === 401`（或任何请求错误）时，会清除 token 并抛出"未登录，请前往登录页面"。
   - `initStorage(context)` 必须在应用启动时调用一次（在 `EntryAbility.onCreate` 中完成）。
   - `saveToken`/`clearToken` 将 token 持久化在 `user_token_info` preferences 文件中，键为 `token`。
2. **`api/api.ets`** —— 基于封装的类型化 API 函数（`getShowList`、`searchShow`、`userLogin`、`userLogout`、`buyTicket`、`getMyOrder`）。所有响应都类型化为 `BaseResponse<T> { code, msg, data, total? }`。新增接口请添加在这里。
3. **页面** —— 在 `aboutToAppear()`/事件处理器中调用 `api/*` 函数，并检查 `res.code === 200`。

登录流程示例：`Login.ets` → `userLogin()` → `saveToken()` → `router.replaceUrl("pages/second")`。

### 本地持久化

`SearchDB.ets` 封装 `@ohos.data.relationalStore`（SQLite），用于两个目的：`search_history` 表（关键词 + 时间戳）和 `goods` 表搜索。它在每个页面中用 UIAbility 上下文（`getContext(this) as common.UIAbilityContext`）实例化。`goods` 表仅被查询，但在此代码库中从未写入数据。

### 常见坑点

- **明文 HTTP** 已通过 `entry/src/main/resources/rawfile/network_config.xml`（`cleartextTrafficPermitted="true"`）全局启用 —— 这是 `http://` mock URL 所必需的。
- **`10.0.2.2`** 是 Android 模拟器的回环地址；在真机或 HarmonyOS 模拟器上需改为宿主机的局域网 IP，或让设备能够访问该 mock。
- 许多源文件是**未接入应用的遗留演示/模板代码**：`api/dd.ets`、`api/yc.ets`（未注册的 `@Entry` 演示页面）、`pages/second-1.ets`（不在 `main_pages.json` 中）。不要仅因某个 `.ets` 文件存在就假定其可被访问。
- ArkTS 是更严格的 TypeScript 子集 —— 代码始终避免使用 `any`、联合参数的 `typeof` 以及动态对象键（改用显式的 `Record` 类型和预构建的值对象），以满足 ArkTS 编译器要求。

## 代码规范化改造约定（重构时的硬性约束）

对本项目做任何代码重构时，必须遵守以下规则：

- **UI 保持不变**：完全保留现有页面布局、所有 UI 组件、颜色、排版与页面样式；不重构 UI、不改动视觉外观，只做数据/结构层面的规范化。
- **抽离硬编码数据**：把页面中写死的静态数据抽成数组常量；渲染部分改用 `ForEach` 循环遍历数组，页面外观与原来完全一致（注意：每个条目若有不同的尺寸/边距等差异化样式，需在数据模型里保留对应字段，不能丢失差异）。
- **补充接口类型**：为每类数据补充 `interface` 类型定义。
- **视图与数据分离**：数据模型（interface + 数组常量）统一放到 `entry/src/main/ets/model/` 目录，按领域分文件（如 `HomeModel.ets`、`ProfileModel.ets` 等），页面只负责引用与渲染。
- **改动范围**：只改 `.ets` 源码；不改 `module.json5` 等配置；不改页面跳转逻辑与已写好的静态组件结构。
- **编码规范**：遵循 ArkTS 编码规范，补充注释；避免 `any`、动态对象键、`typeof` 联合参数等 ArkTS 受限写法。
