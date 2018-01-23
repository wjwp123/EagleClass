//
//  MaterialViewController.swift
//  EaglePegatronLongedClass
//
//  Created by 913 on 2017/10/16.
//  Copyright © 2017年 913. All rights reserved.
//

import UIKit

class MaterialViewController: BaseViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftButtonImageStr = "nav_ic_search_back"
        self.baseTitleStr = "鹰硕慕课注册协议"
        self.baseLaber.frame = CGRect(x:Main_Screen_Width/3.0-30 , y: YEYHeight(s: 40), width: Main_Screen_Width/3.0+60, height: titleView.frame.size.height-YEYHeight(s: 40))
        self.view.backgroundColor = UIColor.white
        let webViews = UIWebView(frame: CGRect(x: 0, y: titleView.frame.maxY, width: Main_Screen_Width, height: Main_Screen_Height-titleView.frame.maxY))
        let urls = NSURL.init(string: "\(BaseUrl)user/terms")
        let urlRequest = NSURLRequest(url: urls! as URL)
        webViews.loadRequest(urlRequest as URLRequest)
        webViews.delegate = self
        self.view.addSubview(webViews)
        

    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        MBShow(labText: "您的网络有问题，请稍后再试")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    override func leftClick() {
        self.navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
