//
//  StoriesCollectionViewCell.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundedView: IGRoundedView!
    @IBOutlet weak var storyOwnerName: UILabel!


    var viewModel: IGStoriesViewModel? {
        didSet {
            storyOwnerName.text = viewModel?.name
            roundedView.imageView.image = UIImage(named: viewModel?.image ?? "")
            roundedView.gradeintStartColor = (viewModel?.isSeen ?? false) ? UIColor.gray: UIColor.purple
            roundedView.gradeintEndColor = (viewModel?.isSeen ?? false) ? UIColor.gray: UIColor.orange
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
