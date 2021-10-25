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
                    return "https://itunes.apple.com/search"
            }
        }
    }
    
    enum Paths: CustomStringConvertible {
        case movie
        case music
        case ebook
        case software
        case term(String)
        
        var description: String {
            switch self {
                case .movie:
                    return "movie"
                case .ebook:
                    return "ebook"
                case .music:
                    return "music"
                case .software:
                    return "software"
                case .term(let term):
                    return "term=\(term)"
            }
        }
    }
    
}
