//
//  Album.swift
//  Albums
//
//  Created by Isaac Lyons on 10/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Album: Decodable {
    enum AlbumKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum CoverArtDescriptionKeys: String, CodingKey {
            case url
        }
    }
    
    let artist: String
    let coverArt: [URL]
    let genres: [String]
    let id: UUID
    let name: String
    let songs: [Song]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        
        artist = try container.decode(String.self, forKey: .artist)
        genres = try container.decode([String].self, forKey: .genres)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        songs = try container.decode([Song].self, forKey: .songs)
        
        var coverArtURLsContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var coverArtURLs: [URL] = []
        
        while !coverArtURLsContainer.isAtEnd {
            let coverArtContainer = try coverArtURLsContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtDescriptionKeys.self)
            
            let coverArtURL = try coverArtContainer.decode(URL.self, forKey: .url)
            coverArtURLs.append(coverArtURL)
        }
        coverArt = coverArtURLs
    }
}