//
//  DetailsViewController.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    var data: TimeSeries5Min!

    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode =  .never
    }
    
    func UpdateUI() {
        openLabel.text = data.the1Open
        highLabel.text = data.the2High
        lowLabel.text = data.the3Low
        closeLabel.text = data.the4Close
        volumeLabel.text = data.the5Volume
    }
}
