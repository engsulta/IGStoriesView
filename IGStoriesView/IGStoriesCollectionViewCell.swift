//
//  StoriesCollectionViewCell.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//
#if canImport(UIKit)
import UIKit

public class IGStoriesCollectionViewCell: UICollectionViewCell {
    
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

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
}
#endif
