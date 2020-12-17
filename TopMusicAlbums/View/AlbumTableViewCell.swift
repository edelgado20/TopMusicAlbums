//
//  AlbumTableViewCell.swift
//  TopMusicAlbums
//
//  Created by Edgar Delgado on 12/2/20.
//  Copyright © 2020 Edgar Delgado. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // Create a UIImage and two text labels
    let thumbnailImage = UIImageView()
    let albumName = UILabel()
    let artistName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabels()
        setupStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code only when loaded from xib or storyboard
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLabels() {
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        artistName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(thumbnailImage)
        contentView.addSubview(albumName)
        contentView.addSubview(artistName)
        
        thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        let widthConstraint = thumbnailImage.widthAnchor.constraint(equalToConstant: 80)
        widthConstraint.priority = UILayoutPriority(750)
        widthConstraint.isActive = true
        let heightConstraint = thumbnailImage.heightAnchor.constraint(equalToConstant: 80)
        heightConstraint.priority = UILayoutPriority(750)
        heightConstraint.isActive = true
    }
    
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [albumName, artistName])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: thumbnailImage.rightAnchor, constant: 8).isActive = true
    }
}
