//
//  FetchData.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/5.
//

import Foundation

/// 立法院資料抓取基底結構
///
/// 在透過`FetchData(_ type:, from:)`抓取資料時，立法院所回傳的基底結構。
/// 泛型`Object`為要抓取的物件類型，請務必先按照立法院所提供之API對應的資料結構定義，並繼承`Codable`。
public struct DataBase<Object>: Codable where Object: Codable {
    var dataList: [Object]
}

/// 透過指定URL，與要抓取的物件類型，來讀取資料。
/// - Parameters:
///   - type: 按立法院所提供之介面文件，所定義的`struct`或是`class`，請務必先繼承`Codable`。
///   - targetURL: 要抓取資料的URL。
/// - Throws: 若發生錯誤則丟出`FetchDataError`。
/// - Returns: 立法院所回傳的基底結構。
public func FetchData<Object: Codable>(_ type: Object.Type, from targetURL: URL) throws -> DataBase<Object> {
    // 抓取資料
    do {
        let jsonContent = try Data(contentsOf: targetURL)
        let data = try JSONDecoder().decode(DataBase<Object>.self, from: jsonContent)
        return data
    } catch is DecodingError {
        throw FetchDataError.decodingError
    } catch {
        throw FetchDataError.urlFetchingError
    }
}

/// 在向立法院抓取資料時，可能發生的錯誤
enum FetchDataError: Error {
    case urlFetchingError
    case decodingError
}
