//
//  ViewController.swift
//  Alamofire-Practice
//
//  Created by reiji kobayashi on 2019/06/21.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "Alamofire にゃーん"
        // Label の設定
        outputLabel.lineBreakMode = .byWordWrapping
        button.setTitle("say にゃーん", for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func buttonPushedEvent(_ sender: Any) {
        SendPostRequestToLineNotify("にゃ〜ん")
    }
    func SendPostRequestToLineNotify(_ message: String) {
        outputLabel.text = message
        let env = ProcessInfo.processInfo.environment
        guard let LINENOTIFY_TOKEN = env["LINENOTIFY_TOKEN"] else {
            fatalError("LINENOTIFY_TOKENの値がnilです")
        }
        let url = "https://notify-api.line.me/api/notify"
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer "+LINENOTIFY_TOKEN
        ]
        let parameters:[String: Any] = [
            "message": message
        ]
        AF.request(url,method: .post, parameters: parameters,encoding: URLEncoding.default,headers: headers).responseString {
            response in
            switch response.result {
            case .success(let value):
                self.outputLabel.text = value
            case .failure(let error):
                self.outputLabel.text = error.localizedDescription
            }
            
        // https://qiita.com/asakahara/items/2b01738419a03314d845
        // Alamofire 5 (Swift 5) でResultの仕様が変わっててG59
        }
    }
}
