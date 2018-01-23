//
//  ComeCollectionViewCell.swift
//  EaglePegatronClassHD
//
//  Created by Amily on 17/9/1.
//  Copyright © 2017年 913. All rights reserved.
//

import UIKit

class ComeCollectionViewCell: UICollectionViewCell {
    
    var image:UIImageView!
    var nameLabel:UILabel!
    var pricerLabel:UILabel!
    var learnCountLabel:UILabel!
    var removeButton:UIButton!
    
    
   override init(frame:CGRect)
    {
        super.init(frame: frame)
        self.initUI()
        
    }
    func initUI()
    {
        self.backgroundColor = C10
        self.clipsToBounds = true
        self.layer.cornerRadius = YEYWith(s: 4)
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: YEYWith(s: 218), height: YEYHeight(s: 116)))
       // image.backgroundColor = UIColor.orange
        image.clipsToBounds = true
        self.addSubview(image)
        
        nameLabel = UILabel(frame: CGRect(x: YEYWith(s: 10), y: image.frame.maxY+YEYHeight(s: 16), width: YEYWith(s: 198), height: YEYHeight(s: F14)))
        nameLabel.textColor = C4
        nameLabel.textAlignment = .left
        nameLabel.font = SystemFont(m: F14)
        self.addSubview(nameLabel)
        
        pricerLabel = UILabel(frame: CGRect(x: YEYWith(s: 10), y: nameLabel.frame.maxY+YEYHeight(s: 10), width: YEYWith(s: 60), height: HeightF(f: F14)))
        pricerLabel.textAlignment = .left
        pricerLabel.textColor = C1
        pricerLabel.font = SystemFont(m: F14)
        self.addSubview(pricerLabel)
        
        learnCountLabel = UILabel(frame: CGRect(x: YEYWith(s: 218)-YEYWith(s: 110), y: pricerLabel.frame.origin.y, width: YEYWith(s: 100), height: HeightF(f: F12)))
        learnCountLabel.textColor = C7
        learnCountLabel.textAlignment = .right
        learnCountLabel.font = SystemFont(m: F12)
        self.addSubview(learnCountLabel)
        
        removeButton = UIButton(type: .custom)
        removeButton.frame = CGRect(x: YEYWith(s: 178), y: -YEYHeight(s: 10), width: YEYWith(s: 50), height: YEYHeight(s: 50))
        removeButton.setImage(UIImage(named:"list_ic_unselected"), for: .normal)
        removeButton.isSelected = false
        removeButton.setImage(UIImage(named:"list_ic_selected"), for: .selected)
        removeButton.isHidden = true
        //removeButton.backgroundColor = UIColor.red
        removeButton.isUserInteractionEnabled = true
        self.addSubview(removeButton)
   
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var views = super.hitTest(point, with: event)
        if  views == nil {
            if self.frame.contains(removeButton.frame) {
              views = removeButton
            }
        }
        return views
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
