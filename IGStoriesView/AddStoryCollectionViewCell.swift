//
//  AddStoryCollectionViewCell.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//

import UIKit

class AddStoryCollectionViewCell: StoriesCollectionViewCell {

    @IBOutlet weak var plusView: IGRoundedView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        let image = UIImage(named: "red")
        plusView.image = image
        plusView.imageView.tintColor = .orange
    }

}
