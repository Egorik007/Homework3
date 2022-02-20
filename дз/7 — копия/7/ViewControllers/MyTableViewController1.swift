//
//  MyTableViewController1.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit

final class MyTableViewController1: UITableViewController {

   
    
    var group = [GroupModel]()
    
    @IBAction func addGroup(segue: UIStoryboardSegue)
    {
        guard segue.identifier == "addGroup",
        let groupController = segue.source as? MyTableViewController2,
              let groupIndexPath = groupController.tableView.indexPathForSelectedRow,
              !self.group.contains(groupController.filterGroup[groupIndexPath.row])
        else {return}
        self.group.append(groupController.filterGroup[groupIndexPath.row])
        tableView.reloadData()
    }
    
    //MARK: -Lifecycle

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Groups", bundle: nil), forCellReuseIdentifier: "groups")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        group.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "groups", for: indexPath) as? Groups
        
        else {return UITableViewCell()}
        let currencyGroup = group[indexPath.row]
        cell.configure(photo: currencyGroup.photoGroup, name: currencyGroup.nameGroup)
        // Configure the cell...

        return cell
    }
    





    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            group.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .fade)
        }
        }
    
   
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
