//
//  NetworkingClient.swift
//  TopMusicAlbums
//
//  Created by Edgar Delgado on 12/2/20.
//  Copyright © 2020 Edgar Delgado. All rights reserved.
//

import Foundation

class NetworkingClient {
    
    let musicURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"
    
    func fetchTopMusicAlbums(completionHandler: @escaping (MusicFeed) -> Void) {
        guard let url = URL(string: musicURL) else {
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error with fetching music albums: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data, let musicFeed = try? JSONDecoder().decode(MusicFeed.self, from: data) {
                completionHandler(musicFeed)
            } else {
                print("Error in decoding the JSON file")
            }
        }
        task.resume()
    }
}
