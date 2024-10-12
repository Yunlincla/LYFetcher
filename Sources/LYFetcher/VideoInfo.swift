//
//  VideoInfo.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/11.
//

import Foundation

/// 影片資訊
public protocol VideoInfo: Hashable, Identifiable {
    var term: String { get set }
    var sessionPeriod: String { get set }
    var meetingDate: String { get set }
    var meetingTime: String { get set }
    var meetingTypeName: String { get set }
    var meetingName: String { get set }
    var meetingContent: String { get set }
    var videoUrl: String { get set }
}
