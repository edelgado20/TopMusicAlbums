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
    var topMusicAlbums: [Result] = []
    let networkingClient = NetworkingClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        setupTableView()
        
        networkingClient.fetchTopMusicAlbums {[weak self] musicFeed in
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
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topMusicAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumTableViewCell
        
        // cell.textLabel?.text = topMusicAlbums[indexPath.row].name
        let viewModel = ResultViewModel(album: topMusicAlbums[indexPath.row])
        
        if let url = URL(string: viewModel.albumThumbnailURL) {
            if let data = try? Data(contentsOf: url) {
                cell.thumbnailImage.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
}
