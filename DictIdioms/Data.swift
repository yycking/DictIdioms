//
//  Data.swift
//  DictIdioms
//
//  Created by Wayne Yeh on 2017/9/13.
//  Copyright © 2017年 Wayne Yeh. All rights reserved.
//

import Foundation

class DataJson: Codable {
    class Idiom: Codable {
        let 成語: String!
        let 注音: String!
        let 漢語拼音: String!
        let 釋義: String?
        let 典源: String?
        let 典故說明: String?
        let 書證: String?
        let 用法說明: String?
        let 近義: String?
        let 反義: String?
        let 辨識: String?
        let 參考語詞: String?
    }
    
    let 工作表: [Idiom]!
}
