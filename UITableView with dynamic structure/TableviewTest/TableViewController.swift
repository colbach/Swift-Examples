//
//  Created by Colbach, Christian on 17/06/16.
//  Copyright © 2016 Colbach, Christian. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var deep = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tiefe \(deep)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        if indexPath.row % 3 == 0{
            cell.textLabel?.text = "Directory (Reihe \(indexPath.row) mit Tiefe \(self.deep + 1))"
        } else {
            cell.textLabel?.text = "Node (Reihe \(indexPath.row) mit Tiefe \(self.deep + 1))"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row % 3 == 0{
            self.performSegueWithIdentifier("showDirectory", sender: self)
        } else {
            self.performSegueWithIdentifier("showNode", sender: self)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDirectory" {
            if let dest = segue.destinationViewController as? TableViewController {
                dest.deep = self.deep + 1
            }
        }
    }
    
}

