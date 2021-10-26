//
//  Endpoint.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation

typealias BaseUrl = EndpointManager.BaseUrl
typealias Paths = EndpointManager.Paths

enum EndpointManager {
    
    enum BaseUrl: CustomStringConvertible {
        case base
        
        var description: String {
            switch self {
                case .base:
                    return "https://itunes.apple.com"
            }
        }
    }
    
    enum Paths: CustomStringConvertible {
        case search
        case movie
        case music
        case ebook
        case software
        case term(String)
        
        var description: String {
            switch self {
                case .search:
                    return "search"
                case .movie:
                    return "movie"
                case .ebook:
                    return "ebook"
                case .music:
                    return "musicTrack"
                case .software:
                    return "software"
                case .term(let term):
                    return "\(term)"
            }
        }
    }
}

