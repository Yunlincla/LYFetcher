//
//  LegislatorSpeech.swift
//  LYFetcher
//
//  Created by Yunlincla on 2024/10/4.
//

import Foundation

// 資料集：委員發言片段相關影片資訊
// API文件詳情請參考：https://data.ly.gov.tw/getds.action?id=148

/// 委員發言資料
public struct LegislatorSpeech: Codable, Hashable, Identifiable, VideoInfo {
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

    /// Identifiable protocol Conformance
    public var id: String { videoUrl }

    /// Initializer
    public init(term: String = "", sessionPeriod: String = "", meetingDate: String = "", meetingTime: String = "", meetingTypeName: String = "", meetingName: String = "", meetingContent: String = "", legislatorName: String = "", areaName: String = "", speechStartTime: String = "", speechEndTime: String = "", speechRecordUrl: String = "", videoLength: String = "", videoUrl: String = "", selectTerm: String = "") {
        self.term = term
        self.sessionPeriod = sessionPeriod
        self.meetingDate = meetingDate
        self.meetingTime = meetingTime
        self.meetingTypeName = meetingTypeName
        self.meetingName = meetingName
        self.meetingContent = meetingContent
        self.legislatorName = legislatorName
        self.areaName = areaName
        self.speechStartTime = speechStartTime
        self.speechEndTime = speechEndTime
        self.speechRecordUrl = speechRecordUrl
        self.videoLength = videoLength
        self.videoUrl = videoUrl
        self.selectTerm = selectTerm
    }
}

/// 抓取近一千筆的委員發言資料
public func FetchNewestSpeech() async throws -> [LegislatorSpeech] {
    // 將三十日前、今日套進URL
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID148Action.action?term=&sessionPeriod=&meetingDateS=\(rocDateFormatter.string(from: thirtyDaysAgo))&meetingDateE=\(rocDateFormatter.string(from: Date()))&meetingTime=&legislatorName=&fileType=json")!
    // 抓取資料
    return try await FetchData(LegislatorSpeech.self, from: targetURL).dataList
}
