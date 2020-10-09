//
//  VFGStoriesCardView.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//
#if canImport(UIKit)
import UIKit

public protocol IGStoriesCollectionViewActionsDelegate: class {
    func collectionView(_ collectionView: UICollectionView, didSelect userId: String?)
}

public struct IGStoriesViewModel {
    var image: String?
    var name: String?
    var isSeen: Bool?
    var userId: String?
    public init(
        image: String?,
        name: String?,
        isSeen: Bool?,
        userId: String?
    ) {
        self.image = image
        self.name = name
        self.isSeen = isSeen
        self.userId = userId

    }
}

public class IGStoriesCardView: UIView {

    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet var contentView: UIView!
    let nibName = "IGStoriesCardView"
    let storiesCellNibName = "IGStoriesCollectionViewCell"
    let addStoryCellNibName = "IGAddStoryCollectionViewCell"
    let storiesCellId = "storiesCellId"
    let addStoryCellId = "addStoryCellId"
    weak var delegate: IGStoriesCollectionViewActionsDelegate?
    var didOpenUserStory: ((Int64?) -> Void)?

    public var storiesViewModels: [IGStoriesViewModel] = [] {
        didSet {
            storiesCollectionView?.performBatchUpdates({ [weak self] in
                let indexSet = IndexSet(integer: 0)
                self?.storiesCollectionView?.reloadSections(indexSet)
            })
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        setupStoriesCollectionView()
    }

    func setupStoriesCollectionView () {
        storiesCollectionView?.delegate = self
        storiesCollectionView?.dataSource = self
        let storiesCell = UINib(nibName: storiesCellNibName, bundle: Bundle.main)
        let addStoryCell = UINib(nibName: addStoryCellNibName, bundle: Bundle.main)

        storiesCollectionView?.register(
            storiesCell,
            forCellWithReuseIdentifier: storiesCellId)

        storiesCollectionView?.register(
            addStoryCell,
            forCellWithReuseIdentifier: addStoryCellId)

    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    func xibSetup() {
        guard let view = loadViewFromNib(nibName: nibName) else {
            return
        }
        xibSetup(contentView: view)
    }
}


extension IGStoriesCardView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storiesViewModels.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row != 0 {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: storiesCellId,
                for: indexPath) as? IGStoriesCollectionViewCell else { return UICollectionViewCell() }
            cell.viewModel = storiesViewModels[indexPath.row]

            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: addStoryCellId,
                    for: indexPath) as? IGAddStoryCollectionViewCell else { return UICollectionViewCell() }
            cell.viewModel = storiesViewModels[indexPath.row]
            return cell
        }

    }
}

extension IGStoriesCardView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(collectionView, didSelect: storiesViewModels[indexPath.row].userId)
    }
}
#endif
