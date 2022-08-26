//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    lazy var dataModel = {
        DataViewModel()
    }()
    
    var data = TimeSeries()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.isHidden = true
        initVM()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode =  .always
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func initVM() {
        dataModel.updateloader = { animate in
            DispatchQueue.main.async {
                if animate == true {
                    self.view.isUserInteractionEnabled = false
                    self.loader.isHidden = false
                    self.loader.startAnimating()
                } else if animate == false {
                    self.loader.stopAnimating()
                    self.loader.isHidden = true
                    self.view.isUserInteractionEnabled = true
                }
            }
        }
        
        dataModel.loadData()
        
        dataModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.dataCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        let arrayString = Array(dataModel.dataCellViewModels.keys)[indexPath.row]
        cell.value = arrayString
        let dateval = String(arrayString)
        let newdate = dateval.dateFormate()
        let date = newdate.dateToDateString()
        let time = newdate.dateToTimeString()
        cell.timeLabel.text = time
        cell.dateLabel.text = date
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! DataCell
        let data = dataModel.dataCellViewModels[cell.value]
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailsVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.data = data
        self.navigationController?.pushViewController(detailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


