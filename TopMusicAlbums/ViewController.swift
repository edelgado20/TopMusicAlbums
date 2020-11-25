//
//  ViewController.swift
//  TopMusicAlbums
//
//  Created by Edgar Delgado on 8/13/20.
//  Copyright © 2020 Edgar Delgado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea = UILayoutGuide()
    var sampleData = ["Dodgers", "Angels", "Rangers", "Yankees"]
    let musicURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10 /explicit.json"
    var topMusicAlbums: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        setupTableView()
        fetchData { [weak self] musicFeed in
            self?.topMusicAlbums = musicFeed.feed.results

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    public func fetchData(completionHandler: @escaping (MusicFeed) -> Void) {
        guard let url = URL(string: musicURL) else { return }
        
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

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topMusicAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = topMusicAlbums[indexPath.row].name
        return cell
    }
    
}
