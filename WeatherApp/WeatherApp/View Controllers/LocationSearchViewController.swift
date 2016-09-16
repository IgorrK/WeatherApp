//
//  LocationSearchViewController.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LocationSearchViewController: UIViewController {
    private static let cellIdentifier = "locationCell"
    var shownLocations = [Any]()
    var tableDataSource = [String]()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    // MARK : UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar
            .rx_text // Observable property thanks to RxCocoa
            .throttle(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { $0.characters.count > 0 } // If the new value is really new, filter for non-empty query.
            .subscribeNext { [unowned self] (query) in // Here we subscribe to every new value, that is not empty (thanks to filter above).
                AutoCompleteAPIManager.sharedInstance.autocompleteQuery(query, success: { (data) in
                    self.shownLocations.removeAll()
                    self.tableDataSource.removeAll()
                    let results : [AnyObject] = data![Constants.AutoCompleteAPIResponseKeys.results] as! [AnyObject]
                    for locationData: [String : AnyObject] in results as! [[String : AnyObject]] {
                        let location = Location(apiResponse: locationData)
                        self.shownLocations.append(location)
                        self.tableDataSource.append(location.readableName())
                    }
                    self.tableView.reloadData()
                    }, failure: { (error) in
                        
                })
                self.tableView.reloadData() // And reload table view data.
            }
            .addDisposableTo(disposeBag) // Don't forget to add this to disposeBag to avoid retain cycle.    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: UITableViewDelegate

extension LocationSearchViewController : UITableViewDelegate {
    
}

// MARK: UITableViewDataSource

extension LocationSearchViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(LocationSearchViewController.cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = self.tableDataSource[indexPath.row]
        return cell
    }
}
