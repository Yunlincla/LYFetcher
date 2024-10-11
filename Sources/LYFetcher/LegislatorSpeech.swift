//
//  LegislatorSpeech.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/4.
//

import Foundation

// 資料集：委員發言片段相關影片資訊
// API文件詳情請參考：https://data.ly.gov.tw/getds.action?id=148

/// 委員發言資料
public struct LegislatorSpeech: Codable {
    public var term: String
    public var sessionPeriod: String
    public var meetingDate: String
    public var meetingTime: String
    public var meetingTypeName: String
    public var meetingName: String
    public var meetingContent: String
    public var legislatorName: String
    public var areaName: String
    public var speechStartTime: String
    public var speechEndTime: String
    public var speechRecordUrl: String
    public var videoLength: String
    public var videoUrl: String
    public var selectTerm: String
}

/// 抓取近三十天的委員發言資料
public func FetchNewestSpeech() -> [LegislatorSpeech] {
    // 將三十日前、今日套進URL
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID148Action.action?term=&sessionPeriod=&meetingDateS=\(rocDateFormatter.string(from: thirtyDaysAgo))&meetingDateE=\(rocDateFormatter.string(from: Date()))&meetingTime=&legislatorName=&fileType=json")!
    // 抓取資料
    return try! FetchData(LegislatorSpeech.self, from: targetURL).dataList
}
