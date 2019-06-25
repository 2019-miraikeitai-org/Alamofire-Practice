
Alamofire-Practice
===


勉強会用の練習リポジトリ
HTTPリクエストを簡単に送れるAlamofireライブラリの入れ方や使い方をハンズオンで学ぶ


## Description
LINENotifyを使って、POSTとかの書き方を学びつつ色々な文法について学ぶことを目的としたリポジトリ

### ブランチ説明

- [2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice at 1-feature-button-label-working](https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice/tree/1-feature-button-label-working)
  - [iPhone ボタンをXcodeで設定する (Swift)](https://i-app-tec.com/ios/button.html) のマネをしたもの
- [2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice at 3-Alamofire-Practice](https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice/tree/3-Alamofire-Practice)
  - Alamofireを使ってPOSTリクエストを送り、LINENotifyでメッセージを送る
- [2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice at 4-AnyTextSendToLineNotify](https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice/tree/4-AnyTextSendToLineNotify)
  - UITextViewを使用してLINENotifyにTextViewに入力された文字列を送信

### 学べそうなこと
- 環境変数の退避 (.envでの管理)
- 文法 (クロージャとかResultとかその辺)
- cocoapodsの使い方とか
- git 諸々 .gitignoreとか

## Requirement
XCode 10.2.1 
Swift	5.0.1

## Contribution
よしなに

## Licence

[MIT](https://github.com/reud/MIT_LICENSE)

## Author

[reud](https://github.com/reud)

## 雑感
気がついたらmasterブランチがないんじゃが・・・

## 勉強会内容
上記のブランチにそって、UITextViewを使用してLINENotifyにTextViewに入力された文字列を送信するところまでみんなでやった。
復習できる様に課題も出しました。

## demo
![ap_2_iOS_Alamofire-Practice/RPReplay_Final1561371210.gif at readme · 2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice](https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice/blob/readme/demo/RPReplay_Final1561371210.gif)
### 課題内容 (iOS班Slackに投稿されたものをコピー)
1. 今日作ったアプリをGitHubにあげよう
- 自分のアカウントにリポジトリを作って、ファイルを共有しよう。
- リポジトリを作る前に必ず.gitignoreファイルを .envファイルと同階層に作って、 .envとpodsフォルダをステージングしない様に(addしてもGit管理されない様に)してください。
- とりあえずmasterブランチでオーケーです
- 2に入る前にbranchを切りましょう(ブランチ名はなんでもいいです)

(ブランチを新規作成してそこに移動してそちらで作業しようというニュアンスです)
2. 自分でサーバーにリクエストを投げてみよう

- 簡単なサーバーを用意したのでそこにリクエストを投げてください
- URLは外に漏らさないで欲しいため、.envファイルに書き込んで、そこから読み取る形を取ってください
- 必要なパラメータがあるので必ず設定してください、正しいパラメータではない場合、NGと帰ってきます。
- 正しいパラメーターの場合、"Result":"SUCCESS"となり、他にもデータが帰ってきます。
- JSON方式で送信を受けつけています。エンコーディング方式をURLEncodingからJSONEncodingに変更してください。
- 一応ヘッダーのContent-Typeはapplication/jsonにしといてください。
- 詳しい必要データはこのスレッドに投稿します。
- 正解条件は "Result":"SUCCESS" になっていることです
- 正解後、pushしてmasterにプルリクエストを出してください。　プルリクエストを出したらここにURLを貼ってくれれば合っているか僕が確認しに行きます






