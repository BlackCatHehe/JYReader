//
//  JYReaderNormalHorTextCell.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class JYReaderNormalHorTextCell: UICollectionViewCell {
    var chapterText: String? {
        didSet {
            textLabel.title = chapterText
        }
    }
    
    private var textLabel: JYReaderNormalTextView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JYReaderNormalHorTextCell {
    private func setupUI() {
        
        let textLb = JYReaderNormalTextView()
        contentView.addSubview(textLb)
        textLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLb.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLb.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLb.topAnchor.constraint(equalTo: topAnchor),
            textLb.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        self.textLabel = textLb
    }
}
