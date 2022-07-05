//
//  JYPanReaderController.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class JYPanReaderController: UIViewController, JYReaderViewSource {

    var chapterData: [JYReaderChapterData] = [] {
        didSet {
            chapterData = chapterData.map{
                if $0.chapterPageTexts.count > 1 {
                    return $0
                } else {
                    $0.chapterPageTexts = $0.chapterText.split(rect: .init(origin: .zero, size: itemSize))
                    return $0
                }
            }
            
            readerPageCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private var itemSize: CGSize {
        CGSize(width: self.view.bounds.width, height: view.bounds.height - 50)
    }
    private lazy var readerPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.showsVerticalScrollIndicator = false
        collV.isPagingEnabled = true
        collV.contentInsetAdjustmentBehavior = .never
        return collV
    }()
}

extension JYPanReaderController {
    private func setupUI() {
        view.addSubview(readerPageCollectionView)
        readerPageCollectionView.delegate = self
        readerPageCollectionView.dataSource = self
        readerPageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readerPageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            readerPageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            readerPageCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            readerPageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        readerPageCollectionView.register(JYReaderNormalHorTextCell.self, forCellWithReuseIdentifier: "JYReaderNormalHorTextCell")
    }
}

extension JYPanReaderController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return chapterData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapterData[section].chapterPageTexts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JYReaderNormalHorTextCell", for: indexPath) as! JYReaderNormalHorTextCell
        cell.chapterText = chapterData[indexPath.section].chapterPageTexts[indexPath.row]
        return cell
    }
}
extension JYPanReaderController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}
