//
//  MyTableViewController.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit
import Kingfisher

final class MyTableViewController: UITableViewController {


    private let networkService = NetworkServiceFriend()
  


  

    @IBOutlet var nameCollection: UITableView!
    
   

    private var name = [NameFriend]() {
        didSet {
            sortAndDispaly(users: name)
        }
    }
    
    private var usersDictionary = [String: [NameFriend]]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var firstLetters = [String]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Friends", bundle: nil), forCellReuseIdentifier: "friends")
        networkService.friends { [weak self] result in
            switch result {
            case .success(let name):
                self?.name = name
            case .failure(let error):
                print (error)
            }
        }
   
    }
    
    private func sortAndDispaly(users: [NameFriend]) {
        var usersDictionary = [String: [NameFriend]]()
        var firstLetters = [String]()
        users
            .sorted(by: { $0.lastName < $1.lastName })
            .forEach { user in
            if
                let firstLetter = user.lastName.first?.uppercased(),
                usersDictionary.contains(where: {$0.key == firstLetter.uppercased()}) {
                usersDictionary[firstLetter.uppercased()]?.append(user)
            } else {
                guard let firstLetter = user.lastName.first?.uppercased() else { return }
                firstLetters.append(firstLetter)
                usersDictionary[firstLetter] = [user]
            }
        }
        
   
        self.firstLetters = firstLetters
        for i in 0...firstLetters.count - 1
        {
            self.usersDictionary[firstLetters[i]] = usersDictionary[firstLetters[i]]?.sorted(by: { first, letter in
                if (first.firstName < letter.firstName){return true}
                else if (first.firstName == letter.firstName)
                {
                    if (first.lastName < letter.lastName){return true}
                    else {return false}
                }
                else {return false}
            })
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        firstLetters.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        firstLetters[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let firstLetter = firstLetters[section]
        return usersDictionary[firstLetter]?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "friends", for: indexPath) as? Friends
                
        else { return UITableViewCell() }
        let firstLetter = firstLetters[indexPath.section]
       if let currentUser = usersDictionary[firstLetter]?[indexPath.row]
        {
           guard let url = URL(string: currentUser.photo ) else {return UITableViewCell()}

        cell.configure(photo: url, name: "\(String( currentUser.firstName)) \(currentUser.lastName)")
       }
        
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        firstLetters
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer{tableView.deselectRow(at: indexPath, animated: true)}
        performSegue(withIdentifier: "goPhotoFriend", sender: nil)
    }
}

