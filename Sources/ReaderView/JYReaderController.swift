//
//  JYReaderController.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

public class JYReaderController: UIViewController {

    let readerManager: JYReaderManager
    
    init(readerManager: JYReaderManager) {
        self.readerManager = readerManager
        super.init(nibName: nil, bundle: nil)
        self.readerManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    
}

extension JYReaderController {
    private func setupUI() {
        setupReaderViewScrollType(type: .scroll)
        
        let buttonItem = UIButton()
        buttonItem.addTarget(self, action: #selector(handleChangeAction), for: .touchUpInside)
        buttonItem.setTitle("[]", for: .normal)
        buttonItem.setTitleColor(.white, for: .normal)
        buttonItem.backgroundColor = .red
        buttonItem.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(buttonItem)
        buttonItem.frame = .init(x: 20, y: 150, width: 100, height: 40)
    }
    @objc private func handleChangeAction() {
        readerManager.scrollType = readerManager.scrollType == .scroll ? .pan : .scroll
    }
    private func setupReaderViewScrollType(type: JYReaderScrollType) {
        self.childViewControllers.last?.view.removeFromSuperview()
        self.childViewControllers.last?.removeFromParentViewController()
        switch type {
        case .scroll:
            let scrollVC = JYScrollReaderController()
            scrollVC.chapterData = readerManager.chapterData
            addChildViewController(scrollVC)
            view.insertSubview(scrollVC.view, at: 0)
            scrollVC.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollVC.view.topAnchor.constraint(equalTo: view.topAnchor),
                scrollVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            readerManager.readerController = scrollVC
        case .pan:
            let scrollVC = JYPanReaderController()
            scrollVC.chapterData = readerManager.chapterData
            addChildViewController(scrollVC)
            view.insertSubview(scrollVC.view, at: 0)
            scrollVC.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollVC.view.topAnchor.constraint(equalTo: view.topAnchor),
                scrollVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            readerManager.readerController = scrollVC
            break
        }
    }
}

extension JYReaderController: JYReaderManagerDetectAction {
    func turnReaderScrollType(type: JYReaderScrollType) {
        setupReaderViewScrollType(type: type)
    }
}
