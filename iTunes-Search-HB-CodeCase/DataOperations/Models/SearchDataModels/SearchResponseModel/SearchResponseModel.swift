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
    let trackId: Int
    let artworkUrl100: String?
    let collectionPrice: Double?
    let collectionName: String?
    let releaseDate: String?
    let shortDescription: String?
    let longDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case trackId
        case artworkUrl100
        case collectionPrice
        case collectionName
        case releaseDate
        case shortDescription
        case longDescription
    }

    init(trackId: Int,
         artworkUrl100: String?,
         collectionPrice: Double?,
         collectionName: String?,
         releaseDate: String?,
         shortDescription: String?,
         longDescription: String?) {
        self.trackId = trackId
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
   
}
