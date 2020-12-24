//
//  DescriptionVC.swift
//  TopMusicAlbums
//
//  Created by Edgar Delgado on 12/16/20.
//  Copyright © 2020 Edgar Delgado. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {
    
    let imageView = UIImageView()
    var albumName: UILabel = {
        let label =  UILabel()
        label.numberOfLines = 0
        return label
    }()
    var artistName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    var genre: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    var releaseDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    var copyrightInfo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    var sendToItunesStoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("iTunes", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    var viewModel: ResultViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLabels()
    }
    
    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(albumName)
        view.addSubview(artistName)
        view.addSubview(genre)
        view.addSubview(releaseDate)
        view.addSubview(copyrightInfo)
        view.addSubview(sendToItunesStoreButton)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        artistName.translatesAutoresizingMaskIntoConstraints = false
        genre.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        copyrightInfo.translatesAutoresizingMaskIntoConstraints = false
        sendToItunesStoreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let result = viewModel {
            if let url = URL(string: result.albumThumbnailURL) {
                if let data = try? Data(contentsOf: url) {
                    imageView.image = UIImage(data: data)
                }
            }
            
            let stackView = UIStackView(arrangedSubviews: [albumName, artistName, genre, releaseDate, copyrightInfo])
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = 10.0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackView)
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            albumName.text = "Album Name: \(result.albumName)"
            artistName.text = "Artist Name: \(result.artistName)"
            genre.text = "Genre: \(result.genre)"
            releaseDate.text = "Release Date: \(result.releaseDate)"
            copyrightInfo.text = "Copyright Info: \(result.copyrightInfo)"
            
            sendToItunesStoreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            sendToItunesStoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
            sendToItunesStoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        }
    }
    
    @objc func buttonTapped() {
        guard let itunesUrl = viewModel?.itunesUrl else { return }
        if let url = URL(string: itunesUrl) {
            UIApplication.shared.open(url)
        }
    }
    
}
