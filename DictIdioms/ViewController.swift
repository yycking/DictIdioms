//
//  ViewController.swift
//  DictIdioms
//
//  Created by Wayne Yeh on 2017/9/8.
//  Copyright © 2017年 Wayne Yeh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let url = Bundle.main.url(forResource: "data", withExtension: "txt") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let dict = try JSONDecoder().decode(DataJson.self, from: data)
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dict = self.dict {
            return dict.工作表.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dict?.工作表[indexPath.row].成語
        return cell
    }
}

