//
//  ViewController.swift
//  ExampleApp
//
//  Created by Ahmed Sultan on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyCardView: StoriesCardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let allStories:[StoriesViewModel] = [
            StoriesViewModel(image: "profile", name: "Your Story", isSeen: false,userId: "1"),
            StoriesViewModel(image: "profile2", name: "ahmed hamza",isSeen: false,userId: "2"),
            StoriesViewModel(image: "profile3", name: "ahmed hamza",isSeen: false,userId: "3"),
            StoriesViewModel(image: "profile1", name: "ahmed seen", isSeen: false,userId: "4"),
            StoriesViewModel(image: "profile1", name: "ahmed hamza",isSeen: false,userId: "5"),
            StoriesViewModel(image: "profile1", name: "ahmed hamza",isSeen: true ,userId: "6")
        ]

        storyCardView.storiesViewModels = allStories
        storyCardView.delegate = self
    }
}

extension ViewController: StoriesCollectionViewActionsDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelect userId: String?) {
        // present your story here
    }
}
