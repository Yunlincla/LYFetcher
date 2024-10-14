//
//  Ivod.swift
//  LYFetcher
//
//  Created by Yunlincla on 2024/10/4.
//

import Foundation

/// 讀取指定Ivod網頁的URL，解析出Ivod的m3u8的URL
/// - Parameter url: 要讀取的Ivod網頁
/// - Returns: 在Ivod網頁中讀取到的m3u8的URL
public func ParseIvodURL(url: URL) async throws -> URL {
    // 讀取URL的HTML
    // 連線抓資料、編碼、找不到目標
    let html: String
    do {
        let data = try await URLSession.shared.data(from: url).0
        guard let htmlString = String(data: data, encoding: .utf8) else {
            throw FetchDataError.encodingError
        }
        html = htmlString
    } catch {
        throw FetchDataError.urlFetchingError
    }
    // 以正則表達式「readyPlayer\("([^"]*).m3u8」過濾html內容
    let target = try! Regex(#"readyPlayer\("([^"]*).m3u8"#)
    if let results = html.firstMatch(of: target) {
        return URL(string: results.0.replacingOccurrences(of: #"readyPlayer(""#, with: ""))!
    } else {
        throw FetchDataError.m3u8NotFound
    }
}
