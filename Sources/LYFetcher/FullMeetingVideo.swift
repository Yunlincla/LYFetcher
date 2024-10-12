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
public struct FullMeetingVideo: Codable, Hashable, Identifiable, VideoInfo {
    public var term: String
    public var sessionPeriod: String
    public var meetingDate: String
    public var meetingTime: String
    public var meetingTypeName: String
    public var meetingName: String
    public var meetingContent: String
    public var videoUrl: String
    public var selectTerm: String

    /// Identifiable protocol Conformance
    public var id: String { videoUrl }
}

public func FetchNewestMeeting() async -> [FullMeetingVideo] {
    let targetURL = URL(string: "https://data.ly.gov.tw/odw/ID143Action.action?term=&sessionPeriod=&meetingDateS=\(rocDateFormatter.string(from: thirtyDaysAgo))&meetingDateE=\(rocDateFormatter.string(from: Date()))&fileType=json")!
    return try! await FetchData(FullMeetingVideo.self, from: targetURL).dataList
}
