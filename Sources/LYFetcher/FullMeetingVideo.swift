//
//  FullMeetingVideo.swift
//  LYFetcher
//
//  Created by Yunlincla on 2024/10/11.
//

import Foundation

// 資料集：會議完整影片相關資訊
// API文件詳情請參考：https://data.ly.gov.tw/getds.action?id=143

/// 會議完整資訊資料抓取基底結構
public struct FullMeetingVideo: Codable, Hashable, Identifiable, Sendable, VideoInfo {
    public var term: String = ""
    public var sessionPeriod: String = ""
    public var meetingDate: String = ""
    public var meetingTime: String = ""
    public var meetingTypeName: String = ""
    public var meetingName: String = ""
    public var meetingContent: String = ""
    public var videoUrl: String = ""
    public var selectTerm: String = ""

    /// Identifiable protocol Conformance
    public var id: String { videoUrl }

    /// Initializer
    public init(term: String = "", sessionPeriod: String = "", meetingDate: String = "", meetingTime: String = "", meetingTypeName: String = "", meetingName: String = "", meetingContent: String = "", videoUrl: String = "", selectTerm: String = "") {
        self.term = term
        self.sessionPeriod = sessionPeriod
        self.meetingDate = meetingDate
        self.meetingTime = meetingTime
        self.meetingTypeName = meetingTypeName
        self.meetingName = meetingName
        self.meetingContent = meetingContent
        self.videoUrl = videoUrl
        self.selectTerm = selectTerm
    }
}

public func FetchNewestMeeting() async throws -> [FullMeetingVideo] {
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID143Action.action?term=&sessionPeriod=&meetingDateS=\(rocDateFormatter.string(from: thirtyDaysAgo))&meetingDateE=\(rocDateFormatter.string(from: Date()))&fileType=json")!
    return try await FetchData(FullMeetingVideo.self, from: targetURL).dataList
}
