//
//  MasterViewController.swift
//  Algorithms
//
//  Created by Vinodh Govindaswamy on 02/12/19.
//  Copyright © 2019 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        let array = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
        let algo = Algorithms()
        var postion = 7
        var element = algo.getNthlargest(from: array, n: postion)
        assert(array.sorted()[postion] == element)
        assert(array.sorted() == algo.qsort(array))

        postion = 12
        element = algo.getNthlargest(from: array, n: postion)
        assert(array.sorted()[postion] == element)

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }


//        print("=========")
//        print("Is Unique")
//
//        let str = "yqwetu"
//        let str2 = "aweqwew"
//        let str3 = "1dg234tsf"
//        print(str.isUnique)
//        print(str2.isUnique)
//        print(str3.isUnique)
//
//
//        print("=========")
//        print("Is Permutes")
//        let str4 = "qwert"
//        print(str4.isPermutaion(of: "ewrtq"))
//
//        let str5 = "4535sdf"
//        print(str5.isPermutaion(of: "5fds435"))
//
//        let str6 = "abcd"
//        print(str6.isPermutaion(of: "abcdff"))
//
//        print("=========")
//        print("Palindrome Permutaion")
//        let str7 = "qwertrewq"
//        print(str7.palidromePermutaion)
//
//        let str8 = "aabbccd"
//        print(str8.palidromePermutaion)
//
//        let str9 = "abcd34"
//        print(str9.palidromePermutaion)
//
//        let str10 = "1dafda1f"
//        print(str10.palidromePermutaion)
//
//        print("=========")
//        print("URLIFY")
//        let str11 = "Hello World Of Swift  "
//        print(str11.urlify ?? "")
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

