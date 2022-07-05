//
//  ViewController.swift
//  JYReader
//
//  Created by zjy on 07/05/2022.
//  Copyright (c) 2022 zjy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let readerManager = JYReaderManager()
        readerManager.chapterData = ChapterData.chapterDatas
        
        let readerMainVc = readerManager.generateReaderView()
        self.navigationController?.setViewControllers([readerMainVc], animated: false)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

