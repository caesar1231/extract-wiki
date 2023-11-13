## 本プロジェクト
指定したwikiの記事データをぶっこ抜く

### 事前準備
1. data, wikiディレクトリを作成
2. [日本語wikiのダンプデータ](https://dumps.wikimedia.org/jawiki/latest/)から下記ファイルをダウンロードする。
めちゃくちゃ時間がかかるので気を付けること。
- jawiki-latest-pages-articles-multistream-index.txt.bz2
  - 日本語wikiのインデックス
- jawiki-latest-pages-articles-multistream.xml.bz2 
  - 日本語wikiの記事全部
3. ダウンロードしたファイル２つをdata以下に配置
4. pythonを入れておく

### 実行方法

1. シェルスクリプト実行

```
sh ./grep_blocks.sh {検索したい単語}
```
2. タイトルが含まれる記事をリストするので、その番号を入力する。
3. wiki以下に記事のxmlファイルが出力される
