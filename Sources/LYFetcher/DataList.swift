//
//  DataList.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/5.
//

import Foundation

/// 立法院資料抓取基底結構
public struct DataList<Object>: Codable where Object: Codable {
    var dataList: [Object]
}
