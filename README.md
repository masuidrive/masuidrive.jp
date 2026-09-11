# masuidrive.jp

https://masuidrive.jp のソース。**ビルドシステムも CI も無し**で、`docs/` 以下が
GitHub Pages からそのまま配信される静的サイト。

## 構成

```
docs/              ← ここが丸ごと https://masuidrive.jp/ になる
  index.html       トップページ
  resume.html      レジュメ
  bots.html        github-bots の説明
  m.html           / へのリダイレクト
  esp-game1/       ESP32 ゲームのマニュアルと WebBLE ROM ライター
  styles/          index.css / resume.css
  images/          各ページの画像
  favicons/        favicon 一式
  CNAME manifest.json browserconfig.xml favicon.ico photos.zip dev.sh .nojekyll
```

`docs/` 直下は自由にディレクトリを追加してよい。`docs/foo/index.html` を置けば
`https://masuidrive.jp/foo/` で配信される。

## 編集とデプロイ

HTML / CSS を直接編集して `master` に push するだけ。GitHub Pages が
`master` ブランチの `/docs` を直接配信する (Settings → Pages → Deploy from a branch)。
ビルドも GitHub Actions も経由しないので、push から反映まで数十秒。

## ローカルプレビュー

```
$ python3 -m http.server 8000 --directory docs
```

http://localhost:8000/ で確認できる。

## faviconの更新

- https://ao-system.net/favicongenerator/
- https://realfavicongenerator.net/

## 履歴

2026-09 以前は `builder/` 以下の Docker + Ruby(ERB/Redcarpet) + Sass/uncss による
ビルドシステムでページを生成し、GitHub Actions でデプロイしていた。現在の
`docs/index.html` と `docs/resume.html` はその最終出力を整形したもので、旧ソース
(`builder/top/index.erb`, `builder/resume/resume.md` など) は git 履歴に残っている。
