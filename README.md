# 旅记 App · Phase 1 代码包

## 使用方法

1. 先创建 Flutter 项目（如果还没创建）：
   ```
   flutter create lvji_app --platforms=android
   cd lvji_app
   ```

2. 解压这个 zip，把里面的 `pubspec.yaml` 和 `lib/` 文件夹整个覆盖/合并到你的
   `lvji_app` 项目根目录（`lib/` 下的子文件夹直接合并进去即可，会自动补全目录结构）。

3. 安装依赖并生成数据库代码：
   ```
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. 运行：
   ```
   flutter run
   ```

目录结构已经按项目实际路径摆好了，不需要再手动改文件名或建文件夹。

详细的验收流程见 `PHASE1_START.md` 和 `PHASE1_DELIVERABLES.md`（这两个不在压缩包里，是单独发的）。
