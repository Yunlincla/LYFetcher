//
//  RocDateFormatter.swift
//  LYFetcher
//
//  Created by 張居正 on 2024/10/5.
//

import Foundation

let rocDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .republicOfChina)
    dateFormatter.dateFormat = "yyy/MM/dd"
    return dateFormatter
}()
