//
//  TableViewController.swift
//  SampleService
//
//  Created by vsplash on 5/1/17.
//  Copyright © 2017 vsplash. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var salesRepObj:SalesRep?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadData()
        
    }
    func downloadData() {
        let URLString = "http://www.androidbegin.com/tutorial/jsonparsetutorial.txt"
        let url = URL(string: URLString)
        let request = URLRequest(url: url!)
        
//        var request = URLRequest(url: url!)
//        let headers = [
//            "content-type": "application/json",
//            "name": "anjan",
//            "cache-control": "no-cache"
//        ]
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = 
        
        TableViewController.execTask(request: request) { (ok, obj) in
            
            print("I AM BACK")
            do {
                if let file = Bundle.main.url(forResource: "document", withExtension: "json") {
                    let data = try Data(contentsOf: file)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let object = json as? [String: Any] {
                        // json is a dictionary
                        print(object)
                        
                        self.salesRepObj = SalesRep.init(responseDict: obj as! NSDictionary)
                        self.tableView.reloadData()
                    } else if let object = json as? [Any] {
                        // json is an array
                        print(object)
                    } else {
                        print("JSON is invalid")
                    }
                } else {
                    print("no file")
                }
            } catch {
                print(error.localizedDescription)
            }
       
        }
    }
    private class func execTask(request: URLRequest, taskCallback: @escaping (Bool,
        AnyObject?) -> ()) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print("THIS LINE IS PRINTED")
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                print("THIS ONE IS PRINTED, TOO")
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    taskCallback(true, json as AnyObject?)
                } else {
                    taskCallback(false, json as AnyObject?)
                }
            }
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = salesRepObj {
            return salesRepObj!.groupsArray!.count
        }else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let groupObj :Group = self.salesRepObj!.groupsArray![indexPath.row]
        cell.nameLbl?.text = groupObj.listingName
        let url = URL(string: groupObj.profileImg!)
        var data:NSData? = nil
        

        if (groupObj.img != nil) {
            cell.profileImgView?.image = groupObj.img

        }else {
            
            cell.profileImgView?.image = UIImage.init(named: "profile_img")

            let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
            concurrentQueue.sync {
                if let _ = url  {
                    do {
                        data = try NSData.init(contentsOf: url!)
                        let img = UIImage(data: data! as Data)
                        groupObj.img = img
                        DispatchQueue.main.async {
                            cell.profileImgView?.image = groupObj.img
                        }
                        
                    } catch {
                        // contents could not be loaded
                    }
                } else {
                    // the URL was bad!
                }
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let groupObj :Group = self.salesRepObj!.groupsArray![indexPath.row]
        let mapViewObj:MapViewController = self.storyboard?.instantiateViewController(withIdentifier: "MapView") as! MapViewController
        mapViewObj.selectedGroup = groupObj
        self.navigationController?.pushViewController(mapViewObj, animated: true)
    }
       
}
