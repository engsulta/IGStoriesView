//
//  ViewController.swift
//  ExampleApp
//
//  Created by Ahmed Sultan on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyCardView: IGStoriesCardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Timeline"
        navigationController?.navigationBar.prefersLargeTitles = true

        let allStories:[IGStoriesViewModel] = [
            IGStoriesViewModel(image: "profile", name: "Your Story", isSeen: false,userId: "1"),
            IGStoriesViewModel(image: "profile2", name: "ahmed hamza",isSeen: false,userId: "2"),
            IGStoriesViewModel(image: "profile3", name: "ahmed hamza",isSeen: false,userId: "3"),
            IGStoriesViewModel(image: "profile1", name: "ahmed seen", isSeen: false,userId: "4"),
            IGStoriesViewModel(image: "profile1", name: "ahmed hamza",isSeen: false,userId: "5"),
            IGStoriesViewModel(image: "profile1", name: "ahmed hamza",isSeen: true ,userId: "6")
        ]

        storyCardView.storiesViewModels = allStories
        storyCardView.delegate = self
    }
}

extension ViewController: IGStoriesCollectionViewActionsDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelect userId: String?) {
        // present your story here
    }
}
