//
//  ImagesTableViewCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import UIKit

protocol ImagesTableViewCellDelegate: class {
    func imagesTableViewCell(_ cell: UITableViewCell, didSelectImageAt index: Int)
}

class ImagesTableViewCell: UITableViewCell {

    static let reuseId: String = String(describing: self)
    
    private let maxImagesCount: Int = 5
    private var imagesData: [Data] = []
    
    weak var delegate: ImagesTableViewCellDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ImagesCollectionLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: [Data]) {
        imagesData = data
        collectionView.reloadData()
    }

    private func setupUI() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func register() {
        collectionView.register(ImagesCollectionViewCell.self,
                                forCellWithReuseIdentifier: ImagesCollectionViewCell.reuseId)
    }
}

extension ImagesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.reuseId, for: indexPath) as? ImagesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = imagesData[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension ImagesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.imagesTableViewCell(self, didSelectImageAt: indexPath.item)
    }
}

class ImagesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = String(describing: self)
    
    private lazy var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(with data: Data) {
        let image = UIImage(data: data)
        imageView.image = image
    }
}

enum MosaicSegmentStyle {
    case oneThirdTwoThirds
    case oneThird
}

class ImagesCollectionLayout: UICollectionViewLayout {

    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    /// - Tag: PrepareMosaicLayout
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }

        // Reset cached information.
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        // For every item in the collection view:
        //  - Prepare the attributes.
        //  - Store attributes in the cachedAttributes array.
        //  - Combine contentBounds with attributes.frame.
        let count = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var segment: MosaicSegmentStyle = .oneThird
        var lastFrame: CGRect = .zero
        
        let cvWidth = collectionView.bounds.size.width
        
//        let side = UIScreen.main.bounds.width / 3 * 1.25
        let side: CGFloat = 110
        
        while currentIndex < count {
            var segmentFrame = CGRect(x: 0, y: lastFrame.maxY + 1.0, width: cvWidth, height: side)
            
            var segmentRects = [CGRect]()
            switch segment {
            case .oneThirdTwoThirds:
                segmentFrame.size.height = 226
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (2.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minYEdge)
                segmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
            
            case .oneThird:
                for index in (0..<3) {
                    let sliceWidth = (segmentFrame.width / 3)
                    let rect = CGRect(x: sliceWidth * CGFloat(index),
                                      y: segmentFrame.origin.y,
                                      width: sliceWidth,
                                      height: segmentFrame.height)
                    segmentRects.append(rect)
                }
            }
            
            // Create and cache layout attributes for calculated frames.
            for rect in segmentRects {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentIndex += 1
                lastFrame = rect
            }

            // Determine the next segment style.
            switch count - currentIndex {
            default:
                switch segment {
                case .oneThird:
                    segment = .oneThirdTwoThirds
                case .oneThirdTwoThirds:
                    segment = .oneThird
                }
            }
        }
    }

    /// - Tag: CollectionViewContentSize
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    /// - Tag: LayoutAttributesForElements
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    // Perform a binary search on the cached attributes array.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }
}

extension CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = self.size.width
        case .minYEdge, .maxYEdge:
            dimension = self.size.height
        }
        
        let distance = (dimension * fraction).rounded(.up)
        var slices = self.divided(atDistance: distance, from: fromEdge)
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            slices.remainder.origin.x += 1
            slices.remainder.size.width -= 1
        case .minYEdge, .maxYEdge:
            slices.remainder.origin.y += 1
            slices.remainder.size.height -= 1
        }
        
        return (first: slices.slice, second: slices.remainder)
    }
}
