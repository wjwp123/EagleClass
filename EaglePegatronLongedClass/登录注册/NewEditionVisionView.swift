//
//  NewEditionVisionView.swift
//  EaglePegatronClassHD
//
//  Created by 913 on 2017/9/29.
//  Copyright © 2017年 913. All rights reserved.
//

import UIKit

class NewEditionVisionView: UIView {
    var centerView:UIView!
    var updateBtn:UIButton!
    var leftBtn:UIButton!
    var rightBtn:UIButton!
    var verStr:String?
    var contStr:String?
    var mustStr:String?
    var changeEditionViewBlock: ((_ path:Int ) -> Void)?
    var frames = CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height)
    init(dataDic: Dictionary<String, Any>) {
        super.init(frame: frames)
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.contStr = dataDic["content"] as? String
        self.verStr = dataDic["versionId"] as? String
        self.mustStr = dataDic["must"] as? String
        self.setUpUI()
    }
    func setUpUI()
    {
        centerView = UIView(frame: CGRect(x: Main_Screen_Width/2-YEYWith(s: 175), y: Main_Screen_Height/2-YEYHeight(s: 180), width: YEYWith(s: 350), height: YEYHeight(s: 360)))
        centerView.backgroundColor = UIColor.white
        centerView.isHidden = true
        centerView.layer.cornerRadius = YEYWith(s: 5)
        //centerView.clipsToBounds = true
        self.addSubview(centerView)
        let topImageView = UIImageView(frame: CGRect(x: 0, y: -YEYHeight(s: 29), width: YEYWith(s: 350), height: YEYHeight(s: 189)))
        topImageView.image = UIImage(named:"upgrade_img")
        topImageView.layer.masksToBounds = true
        centerView.addSubview(topImageView)
        let banbeiLB = UILabel(frame: CGRect(x: YEYWith(s: 280), y: YEYHeight(s: 135), width: YEYWith(s: 50), height: YEYHeight(s: 20)))
        banbeiLB.textColor = C11;
        banbeiLB.backgroundColor = UIColor.clear
        banbeiLB.font = SystemFont(m: 13)
        banbeiLB.textAlignment = .right
        banbeiLB.text = String(format: "V%@", self.verStr!)
        centerView.addSubview(banbeiLB)
        
        let subStr = self.contStr?.replacingOccurrences(of: "|", with: "\n")
        let subtitleLabel = UILabel(frame: CGRect(x: YEYWith(s: 15), y: YEYHeight(s: 165), width:YEYWith(s: 320), height: YEYHeight(s: 130)))
        subtitleLabel.textColor = C5;
        subtitleLabel.font = SystemFont(m: 14)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .left
        subtitleLabel.attributedText = getAttributeStringWithString(subStr!, lineSpace: YEYHeight(s: 8))
        centerView.addSubview(subtitleLabel)
        
        updateBtn = UIButton(type: UIButtonType.custom)
        updateBtn.frame =  CGRect(x: YEYWith(s: 65), y: YEYHeight(s: 300), width: YEYWith(s: 220), height: YEYHeight(s: 40));
        updateBtn.setTitle("立即更新", for: .normal)
        updateBtn.setTitleColor(C11, for: .normal)
        updateBtn.backgroundColor=C1
        updateBtn.tag = 1000
        updateBtn.isHidden = true
        updateBtn.titleLabel?.font=SystemFont(m: 14)
        updateBtn.layer.cornerRadius=YEYWith(s: 20)
        updateBtn.addTarget(self, action:#selector(clickToUpdate), for: UIControlEvents.touchUpInside)
        centerView.addSubview(updateBtn)
        
        leftBtn = UIButton(type: UIButtonType.custom)
        leftBtn.frame =  CGRect(x: YEYWith(s: 25), y: YEYHeight(s: 300), width: YEYWith(s: 140), height: YEYHeight(s: 40));
        leftBtn.setTitle("下次再说", for: .normal)
        leftBtn.setTitleColor(UIColorFromHex(rgbValue: 0x40495b), for: .normal)
        leftBtn.backgroundColor = UIColorFromHex(rgbValue: 0xececef)
        leftBtn.titleLabel?.font=SystemFont(m: 14)
        leftBtn.layer.cornerRadius=YEYWith(s: 20)
        leftBtn.tag = 1001
        leftBtn.addTarget(self, action:#selector(clickToUpdate), for: UIControlEvents.touchUpInside)
        centerView.addSubview(leftBtn)
        
        rightBtn = UIButton(type: UIButtonType.custom)
        rightBtn.frame =  CGRect(x: leftBtn.frame.maxX+YEYWith(s: 20), y: YEYHeight(s: 300), width: YEYWith(s: 140), height: YEYHeight(s: 40));
        rightBtn.setTitle("立即更新", for: .normal)
        rightBtn.setTitleColor(C11, for: .normal)
        rightBtn.backgroundColor=C1
        rightBtn.titleLabel?.font=SystemFont(m: 14)
        rightBtn.layer.cornerRadius=YEYWith(s: 20)
        rightBtn.tag = 1002
        rightBtn.addTarget(self, action:#selector(clickToUpdate(sender:)), for: UIControlEvents.touchUpInside)
        centerView.addSubview(rightBtn)
        if self.mustStr == "false" {
            updateBtn.isHidden = true
            leftBtn.isHidden = false
            rightBtn.isHidden = false
        }else{
            updateBtn.isHidden = false
            leftBtn.isHidden = true
            rightBtn.isHidden = true
        }
    }
    
    func clickToUpdate(sender:UIButton)
    {
        if sender.tag == 1000 {
         self.changeEditionViewBlock?(1)
        }else if sender.tag == 1002 {
          self.changeEditionViewBlock?(1)
        }else{
         self.removeFromSuperview()
        }
    }
    func EditionShow()
    {
        UIApplication.shared.keyWindow?.addSubview(self)
        centerView.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        centerView.isHidden = false
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(rawValue: 0), animations: {
            self.centerView.bounds = CGRect(x: 0, y: 0, width: YEYWith(s: 350), height: YEYHeight(s: 360))
        }) { (bool) in
            
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
