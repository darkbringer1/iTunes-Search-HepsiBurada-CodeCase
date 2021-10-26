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
    let results: [SearchResult]
    
    init(resultCount: Int?, results: [SearchResult]) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - SearchResult
class SearchResult: Codable {
    
    let artworkUrl100: String?
    let collectionPrice: Double?
    let collectionName: String?
    let releaseDate: String?
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
         releaseDate: String?,
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
