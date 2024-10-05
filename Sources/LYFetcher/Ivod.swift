//
//  Bill.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/4.
//

import Foundation

/// 讀取指定Ivod網頁的URL，解析出Ivod的m3u8的URL
/// - Parameter url: 要讀取的Ivod網頁
/// - Returns: 在Ivod網頁中讀取到的m3u8的URL
public func ParseIvodURL(url: URL) -> URL {
    // 讀取URL的HTML
    let html = try! String(contentsOf: url)
    // 以正則表達式「readyPlayer\("([^"]*).m3u8」過濾html內容
    let target = try! Regex(#"readyPlayer\("([^"]*).m3u8"#)
    if let results = html.firstMatch(of: target) {
        return URL(string: results.0.replacingOccurrences(of: #"readyPlayer(""#, with: ""))!
    } else {
        fatalError("此URL中無法找到m3u8影片連結！")
    }
}
