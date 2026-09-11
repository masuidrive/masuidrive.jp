# masuidrive.jp

https://masuidrive.jp のソース。**ビルドシステムは無し**で、`public/` 以下がそのまま公開される静的サイト。

## 構成

```
public/            ← ここが丸ごと https://masuidrive.jp/ になる
  index.html       トップページ
  resume.html      レジュメ
  bots.html        github-bots の説明
  m.html           / へのリダイレクト
  esp-game1/       ESP32 ゲームのマニュアルと WebBLE ROM ライター
  styles/          index.css / resume.css
  images/          各ページの画像
  favicons/        favicon 一式
  CNAME manifest.json browserconfig.xml favicon.ico photos.zip dev.sh
```

`public/` 直下は自由にディレクトリを追加してよい。`public/foo/index.html` を置けば
`https://masuidrive.jp/foo/` で配信される。

## 編集とデプロイ

HTML / CSS を直接編集して `master` に push するだけ。
GitHub Actions (`.github/workflows/deploy.yml`) が `public/` を GitHub Pages に
アップロードする。テンプレートエンジンもトランスパイルも無いので、ローカルで
ビルドする必要はない。

## ローカルプレビュー

```
$ python3 -m http.server 8000 --directory public
```

http://localhost:8000/ で確認できる。

## faviconの更新

- https://ao-system.net/favicongenerator/
- https://realfavicongenerator.net/

## 履歴

2026-09 以前は `builder/` 以下の Docker + Ruby(ERB/Redcarpet) + Sass/uncss による
ビルドシステムでページを生成していた。現在の `public/index.html` と
`public/resume.html` はその最終出力を整形したもので、旧ソース (`builder/top/index.erb`,
`builder/resume/resume.md` など) は git 履歴に残っている。
