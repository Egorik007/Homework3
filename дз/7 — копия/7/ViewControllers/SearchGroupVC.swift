//
//  MyTableViewController2.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit


class MyTableViewController2:UITableViewController, UISearchBarDelegate {

    

    let networkServiceGroup = NetworkServiceGroup()
    private var name = [NameGroup]() {
        didSet {
            display(groups: name)
        }
    }
    
    func display(groups: [NameGroup])
    {
        filterGroup = groups
    }

    @IBOutlet weak var tableView1: UITableView!
    
    
    @IBOutlet var searchBar: UISearchBar!
 
    


    
     var filterGroup = [NameGroup]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    //MARK: -Lifecycle

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Groups", bundle: nil), forCellReuseIdentifier: "groups")
        tableView1.dataSource = self
        tableView1.delegate = self
      
        searchBar.delegate = self
    let _ = networkServiceGroup.group {  [weak self] result in
            switch result {
            case .success(let name):
                self?.name = name
            case .failure(let error):
                print (error)
            }
        }
            
        }
    
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filterGroup = searchText.isEmpty ? name : name.filter { (item: NameGroup) -> Bool in

            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
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
        guard let url = URL(string: currencyGroup.photo) else { return UITableViewCell()}
        cell.groupName?.text = filterGroup[indexPath.row].name
        cell.configure(photo:url, name: currencyGroup.name)
  
      
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


