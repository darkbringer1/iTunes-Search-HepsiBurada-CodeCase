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
    let price: Double?
    let trackCensoredName: String?
    let trackName: String
    let trackPrice: Double?
    let formattedPrice: String?
    let trackId: Int?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let collectionName: String?
    let releaseDate: String?
    let shortDescription: String?
    let longDescription: String?
    let kind: String?
    let artistID: Int?
    let collectionID: Int?
    let trackID: Int?
    let artistName: String?
    let collectionCensoredName: String?
    let artistViewURL: String?
    let collectionViewURL: String?
    let trackViewURL: String?
    let previewURL: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case kind
        case artistID
        case collectionID
        case trackID
        case artistName
        case collectionCensoredName
        case artistViewURL
        case collectionViewURL
        case trackViewURL
        case previewURL
        case collectionExplicitness
        case trackExplicitness
        case country
        case currency
        case primaryGenreName
        case isStreamable
        case price
        case trackCensoredName
        case formattedPrice
        case trackPrice
        case trackName
        case trackId
        case artworkUrl100
        case collectionPrice
        case collectionName
        case releaseDate
        case shortDescription
        case longDescription
    }
    
    init(trackId: Int?,
         price: Double?,
         trackCensoredName: String?,
         formattedPrice: String?,
         trackPrice: Double?,
         trackName: String,
         artworkUrl100: String?,
         collectionPrice: Double?,
         collectionName: String?,
         releaseDate: String?,
         shortDescription: String?,
         longDescription: String?,
         kind: String?,
         artistID: Int?,
         collectionID: Int?,
         trackID: Int?,
         artistName: String?,
         collectionCensoredName: String?,
         artistViewURL: String?,
         collectionViewURL: String?,
         trackViewURL: String?,
         previewURL: String?,
         collectionExplicitness: String?,
         trackExplicitness: String?,
         country: String?,
         currency: String?,
         primaryGenreName: String?,
         isStreamable: Bool?,
         description: String?) {
        self.kind = kind
        self.artistID = artistID
        self.collectionID = collectionID
        self.trackID = trackID
        self.artistName = artistName
        self.collectionCensoredName = collectionCensoredName
        self.artistViewURL = artistViewURL
        self.collectionViewURL = collectionViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.isStreamable = isStreamable
        self.trackCensoredName = trackCensoredName
        self.price = price
        self.trackId = trackId
        self.formattedPrice = formattedPrice
        self.trackPrice = trackPrice
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.releaseDate = releaseDate
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.description = description
    }
   
}
