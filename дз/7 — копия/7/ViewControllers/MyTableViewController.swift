//
//  MyTableViewController.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit

final class MyTableViewController: UITableViewController {

  
    
    var friend1 = [Class(userName: "Егор Фадеев",userPhoto:UIImage(named: "g63") ?? UIImage(), userSurname: "Фадеев",userNameN: "Егор"),
                   Class(userName: "Андрей Иванов",userPhoto:UIImage(named: "bugatti") ?? UIImage(), userSurname: "Иванов",userNameN: "Андрей"),
                   
                   Class(userName: "Дмитрий Попов",userPhoto:UIImage(named: "bugatti") ?? UIImage(), userSurname: "Попов",userNameN: "Дмитрий"),
                   
                   Class(userName: "Максим Соловьев",userPhoto:UIImage(named: "g63") ?? UIImage(), userSurname: "Соловьев",userNameN: "Максим"),
                   Class(userName: "Кирилл Литвинов",userPhoto:UIImage(named: "g63") ?? UIImage(), userSurname: "Литвинов",userNameN: "Кирилл"),
                   
    
    ]
    
    lazy var friend = friend1.sorted{$0.userNameN < $1.userNameN}
   lazy var friend3 = friend.sorted{$0.userSurname < $1.userSurname}
    
    var friend2 = [String]();
    var friendSectionTitles = [String]()
    var friendDictionary = [String: [String]]();
    

    //MARK: -Lifecycle

    private var urlComponents: URLComponents =
    {
        
        let token = SomeSingletone.instance.token
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.vk.com"
        comp.path = "/method/friends.get"
        comp.queryItems = [
          
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name:"fields", value: "country"),
URLQueryItem(name: "v", value: "5.131")
      
]
        
   
        let session = URLSession.shared


        var request = URLRequest(url: comp.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request)
        {
            data,response,error in
            print(data,response,error)

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json)
        }
        task.resume()
        return comp


    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Friends", bundle: nil), forCellReuseIdentifier: "friends")

        
        for friend in friend3 {
            friend2.append(friend.userSurname)
        }





        
        for i in 0..<friend3.count
        {
            let friendKey = String(friend3[i].userSurname.prefix(1))
            if var friendValues = friendDictionary[friendKey] {
                friendValues.append(friend3[i].userName)
                                        friendDictionary[friendKey] = friendValues
                                    } else {
                                        friendDictionary[friendKey] = [friend[i].userName]
                                    }
        }
        
        friendSectionTitles =  [String](friendDictionary.keys)
        friendSectionTitles = friendSectionTitles.sorted(by: {$0 < $1})
    }
 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        friendSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String?
    {
        return friendSectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        
     
        let friendKey = friendSectionTitles[section]
     if let friendValues = friendDictionary[friendKey]
        {
         
     
        return friendValues.count
     }
    return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "friends", for: indexPath) as? Friends
        
        else {return UITableViewCell()}
        let friendKey = friendSectionTitles[indexPath.section]
        let currencyFriend = friend3[indexPath.row + indexPath.section]
        if let friendValues = friendDictionary[friendKey]{
     
            cell.friandName?.text = friendValues[indexPath.row]
            
            
            }
        cell.configure(photo: currencyFriend.userPhoto, name: currencyFriend.userName)
  


        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer{tableView.deselectRow(at: indexPath, animated: true)}
        performSegue(withIdentifier: "goPhotoFriend", sender: nil)
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

