//
//  StoriesCarViewTests.swift
//  IGStoriesViewTests
//
//  Created by Ahmed Sultan on 10/6/20.
//

import XCTest
@testable import IGStoriesView

class StoriesCardViewTests: XCTestCase {
    var cardView: IGStoriesCardView!

    override func setUp() {
        super.setUp()
        let allStories:[IGStoriesViewModel] = [
            IGStoriesViewModel(image: "ahmed", name: "Your Story", isSeen: false,userId: "1"),
            IGStoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "2"),
            IGStoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "3"),
            IGStoriesViewModel(image: "ahmed", name: "ahmed seen", isSeen: false,userId: "4"),
            IGStoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: false,userId: "5"),
            IGStoriesViewModel(image: "ahmed", name: "ahmed hamza",isSeen: true ,userId: "6")
        ]
        cardView = IGStoriesCardView(frame: .zero)
        cardView.storiesViewModels = allStories
    }
    func testCardView() {
        cardView.setupStoriesCollectionView()
    }

}
