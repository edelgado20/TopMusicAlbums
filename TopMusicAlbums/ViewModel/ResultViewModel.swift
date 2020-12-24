//
//  ResultViewModel.swift
//  TopMusicAlbums
//
//  Created by Edgar Delgado on 12/3/20.
//  Copyright © 2020 Edgar Delgado. All rights reserved.
//

import UIKit

class ResultViewModel {
    
    let albumName: String
    let artistName: String
    let albumThumbnailURL: String
    let genre: String
    let releaseDate: String
    let copyrightInfo: String
    let itunesUrl: String
    
    init(album result: Result) {
        self.albumName = result.name
        self.artistName = result.artistName
        self.albumThumbnailURL = result.albumThumbnailURL
        self.genre = result.genres[0].name
        self.releaseDate = result.releaseDate
        self.copyrightInfo = result.copyright
        self.itunesUrl = result.url
    }
    
    
}
