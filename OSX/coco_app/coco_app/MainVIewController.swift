//
//  MainVIewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/7/26.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa

class MainVIewController: NSViewController {

    
    @IBOutlet weak var truncatingLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let wannaStr = NSMutableAttributedString(string: "赵客缦胡缨，吴钩霜雪明。银鞍照白马，飒沓如流星。十步杀一人，千里不留行。事了拂衣去，深藏身与名。闲过信陵饮，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴。三杯吐然诺，五岳倒为轻。眼花耳热后，意气素霓生。救赵挥金锤，邯郸先震惊。千秋二壮士，烜赫大梁城。纵死侠骨香，不惭世上英。")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        wannaStr.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: wannaStr.length))
        truncatingLabel.maximumNumberOfLines = 0
        truncatingLabel.attributedStringValue = wannaStr.copy() as! NSAttributedString
    }
    
    
    
    
}
