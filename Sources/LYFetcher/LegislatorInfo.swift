//
//  LegislatorSpeech.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/5.
//

import Foundation

// API文件詳情請參考：https://data.ly.gov.tw/getds.action?id=9

/// 立法委員資料抓取基底結構
public struct Legislator: Codable {
    // 注意：此struct只有部分欄位，完整欄位請參考API文件
    public var term: String
    public var name: String
    public var party: String
    public var partyGroup: String
    public var areaName: String
    public var committee: String
    public var leaveFlag: String
}

/// 抓取最新的立法委員資料
public func FetchAllLegislatorInfo() -> [Legislator] {
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID9Action.action?name=&sex=&party=&partyGroup=&areaName=&committee=&fileType=json")!
    let jsonContent = try! Data(contentsOf: targetURL)
    let data = try! JSONDecoder().decode(DataList<Legislator>.self, from: jsonContent)
    return data.dataList.filter { $0.leaveFlag == "否" }
}
