===
Alamofireを入れた後
===

# 関数を作ろう
メッセージ内容を引数として、リクエストを送る役割を持つ関数を作ろう
ViewController.swiftのviewDidLoad()とかと同じ階層に関数を作ります。

```swift
func SendPostRequestToLineNotify(_ message: String) {

}
```
まずは、送るに当たって、.envファイルの値を読み出す必要はあります。
```
let env = ProcessInfo.processInfo.environment
```
でenvファイルの全内容を取得できます。
今回はその中のLINENOTIFY_TOKENという部分がほしいので、
env["LINENOTIFY_TOKEN"]で値を取得します。

ここで、.envファイルにLINENOTIFY_TOKENという部分が記載されていなかった場合、env["LINENOTIFY_TOKEN"]はnilになります。

今回のアプリではenv["LINENOTIFY_TOKEN"]はnilになった時点でおかしいので、env["LINENOTIFY_TOKEN"]がnilだった場合はエラーを起こして終了させましょう。

```
guard let LINENOTIFY_TOKEN = env["LINENOTIFY_TOKEN"] else {
    fatalError("LINENOTIFY_TOKENの値がnilです")
}
```

これはLINENOTIFY_TOKENという変数を定義してenv["LINENOTIFY_TOKEN"]の代入を試みて、ダメだったらelse句が走るという構文です。

これによりLINENOTIFY_TOKENは必ずnilではないことが保証されます。

次におまじない的な変数を定義しましょう。

```
let url = "https://notify-api.line.me/api/notify"
let headers: HTTPHeaders = [
    "Content-Type": "application/x-www-form-urlencoded",
    "Authorization": "Bearer "+LINENOTIFY_TOKEN
]
let parameters:[String: Any] = [
    "message": message
]
```
変数名を見れなわかる通りですが、url,header,parameterを定義しています。　ここの定義の仕方などは
[LINENotifyのリファレンス](https://notify-bot.line.me/doc/ja/)
を見ればおkです。

最後に、今まで定義してきた変数を使用してリクエストを送ります。
Alamofireは今回ではリクエストの結果をStringで受けたいので
```
AF.request(url,method, parameters,encoding,headers).responseString(closure)
```
という形で使用します。
もちろんリクエスト結果をJSONで受けたい時もあります。
その場合は
```
AF.request(url,method, parameters,encoding,headers).responseJSON(closure)
```
となります。
ここで、最後の関数の引数がクロージャなので、
```
AF.request(url,method, parameters,encoding,headers).responseJSON closure
```
この様に省略できます。
(トレーリングクロージャー)と言います


ここでクロージャですが、これはリクエストのレスポンスを使った処理を入れます。
クロージャの引数名としては、responseを使用してください(そこにリクエストのレスポンスが入ります。)

今回はこの様なクロージャを引数にしましょう。
僕の環境では、outputLabelはUILabelです。
```
{
           response in
           switch response.result {
           case .success(let value):
               self.outputLabel.text = value
           case .failure(let error):
               self.outputLabel.text = error.localizedDescription
           }
     }
```
ざっと内容を説明すると、responseの結果が成功ならば、値(レスポンス結果)をラベルの値に代入
失敗ならエラー内容をラベルの値に代入といった所です。

で、
```
AF.request(url,method: .post, parameters: parameters,encoding: URLEncoding.default,headers: headers).responseString {
    response in
    switch response.result {
    case .success(let value):
        self.outputLabel.text = value
    case .failure(let error):
        self.outputLabel.text = error.localizedDescription
    }
}
```
結果この様に書くと、リクエストを送り、結果に対してラベルの値を変えるという処理が書けます。
関数が完成したでしょうか

そしたら、buttonがpushされたら「にゃーん」と送る様にしましょう。
ボタンを押されたら呼ばれるイベントを以下の様に変更します。
```
@IBAction func buttonPushedEvent(_ sender: Any) {
    SendPostRequestToLineNotify("にゃ〜ん")
}
```

これでアプリを実行し、無事呼ばれたら完了です。
お疲れ様でした。
