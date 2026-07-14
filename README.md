# T1402 共創拠点 3Dレイアウト

名城大学 タワー75・14F「1402 共創拠点」の家具配置3Dシミュレーター。
図面（axona AICHI 2026-05-18 初回提案）とカタログ寸法・現地写真を元に作成。

## ローカルで見る

```
python3 -m http.server 8795 --directory ~/Documents/t1402-layout
```
→ http://localhost:8795 （Claude Code なら「t1402-layout を起動して」でOK）

## 公開のしかた（無料）

このフォルダは静的サイトなので、そのままアップすれば動きます。

### 方法A: Netlify Drop（いちばん簡単）
1. https://app.netlify.com/drop を開く（無料。GitHubアカウント等でログイン）
2. `t1402-layout` フォルダごとドラッグ＆ドロップ
3. 発行されたURL（https://～.netlify.app）を共有すれば誰でも見られる

### 方法B: GitHub Pages
1. GitHubで新規リポジトリ（Public）を作り、このフォルダの中身をアップロード
2. Settings → Pages → Branch: main / root で有効化

## 共有保存のセットアップ（1回だけ・約5分）

「配置を保存」を全端末で共有するために Supabase（無料）を使う。
※ ripple の .env.local にある旧プロジェクト（yqisflqouvpkmuzqvqjq）は既に削除されている
ため、現在のプロジェクト（または新規プロジェクト）で以下を行う。

1. https://supabase.com/dashboard → プロジェクトを開く（なければ New project・無料）
2. SQL Editor → `setup.sql` の中身を貼り付けて **Run**
3. Settings → API で「Project URL」と「publishable (anon) key」をコピー
4. `index.html` 内の `const SYNC = {` の url / key に貼る（★コメントで場所を明示済み）
   - url は `https://＜ref＞.supabase.co/rest/v1/t1402_layout` の形にする
5. アップロードし直す

以後、
- ページを開くと共有レイアウトを自動で読み込む
- 「配置を保存」＝共有ストレージに上書き保存（他の端末にはリロードで反映）
- 未セットアップ/オフライン時は端末内（localStorage）に保存される

⚠️ URLを知っている人は誰でも配置を変更・保存できる設計（家具配置の検討用のため）。

## 操作

- クリックで選択 → ドラッグ移動 / Q・Eキーか⟲⟳ボタンで回転
- 六角テーブルは台形2台の組合せ。片方だけ動かして分割・連結できる
- JELLYベンチは選択→左パレットで張地カラー変更（FAT/FTW 20色）
- 「真上から」= 図面と同じ視点、「新規/既存」チェックで表示切替
