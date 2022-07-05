//
//  JYReaderNormalVerTextCell.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class JYReaderNormalVerTextCell: UITableViewCell {
    var chapterText: String? {
        didSet {
            textLb.title = chapterText
        }
    }
    
    private var textLb: JYReaderNormalTextView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JYReaderNormalVerTextCell {
    private func setupUI() {
        selectionStyle = .none
        
        let textLb = JYReaderNormalTextView()
        addSubview(textLb)
        textLb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLb.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLb.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLb.topAnchor.constraint(equalTo: topAnchor),
            textLb.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        self.textLb = textLb
    }
}
