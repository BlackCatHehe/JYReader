//
//  JYReaderNormalTextView.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class JYReaderNormalTextView: UIView {

    var title: String? {
        didSet {
            textLabel.text = title
        }
    }
    
    private var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JYReaderNormalTextView {
    private func setupUI() {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 14)
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lb)
        NSLayoutConstraint.activate([
            lb.leadingAnchor.constraint(equalTo: leadingAnchor),
            lb.trailingAnchor.constraint(equalTo: trailingAnchor),
            lb.topAnchor.constraint(equalTo: topAnchor),
            lb.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        self.textLabel = lb
    }
}
