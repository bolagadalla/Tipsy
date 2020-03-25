//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Bola Gadalla on 14/01/20.
//  Copyright © 2020 Bola Gadalla. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var extraTextLabel: UILabel!
    
    var result: String?
    var extraText: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultLabel.text = result
        extraTextLabel.text = extraText
    }
    
    @IBAction func RecalculateButton(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
