//
//  StoriesCarViewTests.swift
//  IGStoriesViewTests
//
//  Created by Ahmed Sultan on 10/6/20.
//

import XCTest
@testable import IGStoriesView

class StoriesCardViewTests: XCTestCase {
    var cardView: StoriesCardView!

    override func setUp() {
        super.setUp()
        let allStories:[StoriesViewModel] = [
            StoriesViewModel(image: "ahmed", name: "Your Story", isSeen: false,userId: "1"),
            StoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "2"),
            StoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "3"),
            StoriesViewModel(image: "ahmed", name: "ahmed seen", isSeen: false,userId: "4"),
            StoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "5"),
            StoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: true ,userId: "6")
        ]
        cardView = StoriesCardView(frame: .zero)
        cardView.storiesViewModels = allStories
    }
    func testCardView() {
        cardView.setupStoriesCollectionView()
    }

}
