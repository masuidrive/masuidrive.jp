# masuidrive.jp - エージェント向けメモ

このリポジトリは https://masuidrive.jp の静的サイト。**ビルドステップは存在しない**。
`docs/` 以下のファイルがそのまま GitHub Pages で配信される。

## 大原則

- 編集対象は `docs/` 以下の HTML / CSS / 画像そのもの。中間ソースやテンプレートは無い。
- ビルドコマンドを追加しない。新しいページが必要なら素の HTML を `docs/` に置く。
- `main` への push で GitHub Pages が `docs/` をそのまま配信する。CI もビルドも無い。
- `docs/.nojekyll` は Jekyll 処理を止めるためのもの。消さないこと。

## ファイル配置

| パス | 内容 |
| --- | --- |
| `docs/index.html` | トップページ (プロジェクト一覧 + 自己紹介) |
| `docs/resume.html` | レジュメ |
| `docs/styles/index.css` | トップページ専用 CSS |
| `docs/styles/resume.css` | レジュメ専用 CSS |
| `docs/images/` | 両ページの画像 |
| `docs/favicons/`, `favicon.ico`, `manifest.json`, `browserconfig.xml` | favicon 一式 |
| `docs/CNAME` | 独自ドメイン設定。消さないこと |
| `docs/bots.html`, `docs/m.html` | 単体の小さなページ |
| `docs/esp-game1/` | 独立したサブページの例 |

新しいコンテンツは `docs/<名前>/index.html` のようにディレクトリを掘って追加してよい。
既存ページの構成に合わせる必要はない。

## CSS についての注意

`styles/*.css` は元々 Bootstrap 4 + Sass から生成し、uncss で「そのページで実際に使われている
セレクタだけ」に削ったもの。そのため:

- `.container` `.row` `.col-12` `.col-sm-6` `.col-md-4` など **既存 HTML に出てくるクラスしか
  定義されていない**。`.col-md-6` のような未使用の Bootstrap クラスを新たに書いても効かない。
- レイアウトを変えるときは、既存クラスを使い回すか、CSS に素のルールを追記する。
- Bootstrap を再導入したい場合は CDN の `<link>` を該当ページに足すのが手っ取り早い。

## 確認方法

```
$ python3 -m http.server 8000 --directory docs
```

HTML を書き換えたらこれでブラウザ確認する。リンク切れと OGP 画像の URL
(`https://masuidrive.jp/images/...`) は絶対パスなので、パスを変えたら合わせて直す。

## レジュメを更新するとき

`docs/resume.html` を直接編集する。本文は `<div id="content">` の中。
更新したら末尾の `<div id="generated-at">` の日付も直す。
