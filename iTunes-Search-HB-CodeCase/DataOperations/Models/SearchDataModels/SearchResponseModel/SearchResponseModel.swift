//
//  SearchResponseModel.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation

// MARK: - Categories
class SearchResponseModel: Codable {
    
    let resultCount: Int?
    let results: [Result]?
    
    init(resultCount: Int?, results: [Result]?) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
class Result: Codable {
    
    let artworkUrl100: String?
    let collectionPrice: Double?
    let collectionName: String?
    let releaseDate: Date?
    let shortDescription: String?
    let longDescription: String?
    let wrapperType: WrapperType?
    
    enum CodingKeys: String, CodingKey {
        case artworkUrl100
        case collectionPrice
        case collectionName
        case releaseDate
        case shortDescription
        case longDescription
        case wrapperType
    }
    init(artworkUrl100: String?,
         collectionPrice: Double?,
         collectionName: String?,
         releaseDate: Date?,
         shortDescription: String?,
         longDescription: String?,
         wrapperType: WrapperType?) {
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.wrapperType = wrapperType
    }
   
}

enum WrapperType: String, Codable {
    case track = "track"
    case software = "software"
}
