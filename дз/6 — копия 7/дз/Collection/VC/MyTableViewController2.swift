//
//  MyTableViewController2.swift
//  дз
//
//  Created by Егор on 20.12.2021.
//

import UIKit

class MyTableViewController2:UITableViewController, UISearchBarDelegate {

    

    

    @IBOutlet weak var tableView1: UITableView!
    
    
    @IBOutlet var searchBar: UISearchBar!
 
    
        var group = [GroupModel(nameGroup: "ВКонтакте", photoGroup: UIImage(named: "bugatti") ?? UIImage()),
                     GroupModel(nameGroup: "Физкек", photoGroup: UIImage(named: "g63") ?? UIImage()),
                     GroupModel(nameGroup: "Apple Russia", photoGroup: UIImage(named: "g63") ?? UIImage())
                     ]
        
    
    var filterGroup: [GroupModel] = []
    //MARK: -Lifecycle

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Groups", bundle: nil), forCellReuseIdentifier: "groups")
        tableView1.dataSource = self
        tableView1.delegate = self
        filterGroup = group
        searchBar.delegate = self
        
    }
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filterGroup = searchText.isEmpty ? group : group.filter { (item: GroupModel) -> Bool in

            return item.nameGroup.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
               }

        tableView1.reloadData()
    }
    
    
        
 
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        filterGroup.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "groups", for: indexPath) as? Groups
        
        else {return UITableViewCell()}
        let currencyGroup = filterGroup[indexPath.row]
        cell.groupName?.text = filterGroup[indexPath.row].nameGroup
        cell.configure(photo: currencyGroup.photoGroup, name: currencyGroup.nameGroup)
  
      
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer {tableView.deselectRow(at: indexPath, animated: true)}
        
        performSegue(withIdentifier: "addGroup", sender: nil)
     
    }
    


    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

