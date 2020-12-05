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
//    let albumName = UILabel()
//    let artistName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        thumbnailImage.backgroundColor = .blue
        
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        //albumName.translatesAutoresizingMaskIntoConstraints = false
        //artistName.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thumbnailImage)
        //contentView.addSubview(albumName)
        //contentView.addSubview(artistName)
        
        let viewsDictionary = ["image": thumbnailImage]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(50)]-|", options: [], metrics: nil, views: viewsDictionary))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(60)]-|", options: [], metrics: nil, views: viewsDictionary))
        
        //print("Constraint: \(contentView.constraints)")
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

}
