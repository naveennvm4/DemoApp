//
//  WebService.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import Foundation
import UIKit

class WebService: NSObject {
    
    static let shared = WebService()
    
    func urlRequest(reqURL: String, completion: @escaping (_ result: [String: Any], _ error: String)->()){
        let requestURL: NSURL = NSURL(string: reqURL)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                do{
                    if let JSON = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        completion(JSON,"")
                    } else if let JSON = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        completion(["data":JSON],"")
                    }
                }
                catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    completion(["":""], error.localizedDescription)
                }
            } else  {
                print("Failed")
            }
        }
        task.resume()
    }
}
