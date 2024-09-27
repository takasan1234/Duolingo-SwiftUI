//
//  SectionData.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/22.
//

import Foundation


struct SectionData: Codable, Identifiable {
    var id: Int {
        return number
    }
    var number: Int
    var units: [Unit]
}

struct Unit: Codable {
    var number: Int
    var components: [Component]
}

struct Component: Codable {
    var number: Int
    var isActive: Bool = false
    var problems: [Problem]
}

struct Problem: Codable {
//    var id: Int {
//        return number
//    }
    var number: Int
    var word_sets: [Vocabulary]
}

struct Vocabulary: Codable, Hashable {
    var word: String
    var meaning: String
}
