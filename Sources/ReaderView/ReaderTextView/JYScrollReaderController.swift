//
//  JYScrollReaderController.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class JYScrollReaderController: UIViewController, JYReaderViewSource {
    var chapterData: [JYReaderChapterData] = [] {
        didSet {
            readerTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private lazy var readerTableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.sectionFooterHeight = 0
        tb.sectionHeaderHeight = 0
        tb.contentInsetAdjustmentBehavior = .never
        if #available(iOS 15.0, *) {
            tb.sectionHeaderTopPadding = 0
        }
        tb.showsVerticalScrollIndicator = false
        return tb
    }()
}
extension JYScrollReaderController {
    private func setupUI() {
        view.addSubview(readerTableView)
        readerTableView.delegate = self
        readerTableView.dataSource = self
        readerTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            readerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            readerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            readerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        readerTableView.register(JYReaderNormalVerTextCell.self, forCellReuseIdentifier: "JYReaderNormalVerTextCell")
    }
}

extension JYScrollReaderController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        chapterData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JYReaderNormalVerTextCell", for: indexPath) as! JYReaderNormalVerTextCell
        cell.chapterText = chapterData[indexPath.section].chapterText
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
