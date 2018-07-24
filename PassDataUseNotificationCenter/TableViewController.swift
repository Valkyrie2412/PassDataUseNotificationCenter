//
//  TableViewController.swift
//  PassDataUseNotificationCenter
//
//  Created by Hiếu Nguyễn on 7/20/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    var arrayCity = ["Ha Noi", "Ho Chi Minh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resgisterNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func resgisterNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handlerNotification), name: NotificationKeys.passCity, object: nil)
    }
    
    //    @objc func handlerNotification(_ notification: Notification) {
    //        if let city = notification.userInfo?["city"] as? String {
    //            print(city)
    //        }
    //
    //        if let age = notification.userInfo?["age"] as? String {
    //            print(age)
    //        }
    //    }
    @objc func handlerNotification(_ notification: Notification) {
        guard let city = notification.object as? String else { return }
        if let index = tableView.indexPathForSelectedRow {
            arrayCity[index.row] = city
            tableView.reloadRows(at: [index], with: .fade)
        } else {
            arrayCity.append(city)
//            tableView.reloadData()
            let newIndexPath = IndexPath(row: arrayCity.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayCity[indexPath.row]
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ViewController {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            detailViewController.data = arrayCity[indexPath.row]
        }
        
    }
    
}
