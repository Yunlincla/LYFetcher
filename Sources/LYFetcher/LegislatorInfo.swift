//
//  LegislatorInfo.swift
//  LYFetcher
//
//  Created by Yunlincla on 2024/10/5.
//

import Foundation

// 資料集：當屆委員資料
// API文件詳情請參考：https://data.ly.gov.tw/getds.action?id=9

/// 立法委員資料抓取基底結構
public struct Legislator: Codable, Hashable {
    // 注意：此struct只有部分欄位，完整欄位請參考API文件
    public var term: String
    public var name: String
    public var party: String
    public var partyGroup: String
    public var areaName: String
    public var committee: String
    public var leaveFlag: String

    /// Initializer 
    public init(term: String = "", name: String = "", party: String = "", partyGroup: String = "", areaName: String = "", committee: String = "", leaveFlag: String = "") {
        self.term = term
        self.name = name
        self.party = party
        self.partyGroup = partyGroup
        self.areaName = areaName
        self.committee = committee
        self.leaveFlag = leaveFlag
    }
}

/// 抓取最新的立法委員資料
public func FetchAllLegislatorInfo() async -> [Legislator] {
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID9Action.action?name=&sex=&party=&partyGroup=&areaName=&committee=&fileType=json")!
    let data = try! await FetchData(Legislator.self, from: targetURL)
    return data.dataList.filter { $0.leaveFlag == "否" }
}
