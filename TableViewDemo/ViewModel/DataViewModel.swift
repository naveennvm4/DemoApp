//
//  DataViewModel.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import Foundation


class DataViewModel {
    public var dataModel = TimeSeries()
    var updateloader:((Bool)->())?
    var reloadTableView: (() -> Void)?
    
    var dataCellViewModels = [String: TimeSeries5Min]() {
        didSet {
            reloadTableView?()
        }
    }

      func loadData() {
        updateloader?(true)
        WebService.shared.urlRequest(reqURL: Constants.shared.reqURL) {[self] result, error in
            guard let urlResponse = self.decode(json: result, type: TimeSeries.self) else {
                return
            }
            addData(value: urlResponse)
            print(urlResponse)
            updateloader?(false)
        }
    }
    
    func addData(value: TimeSeries) {
        self.dataModel = value
        self.dataCellViewModels = value.timeSeries5Min!
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> [String: TimeSeries5Min] {
        return dataCellViewModels
        
    }
    
    private func decode<T>(json:[String:Any], type:T.Type) -> T?  where T : Decodable{
        let decoder = JSONDecoder()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let model = try decoder.decode(type, from: jsonData)
            return model
     
        } catch {
            print(error)
        }
        return nil
    }
}


struct Constants {
    
    static let shared = Constants()
    
    let reqURL = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo"
}
