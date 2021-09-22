//
//  ViewController.swift
//  second
//
//  Created by Melih Bugra Esmek on 10.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: urlString) else { return }
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
       
        
        guard let users = userList else { return }
        self.users = users
        tableView.dataSource = self
    }


}
// for TableView
extension ViewController : UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        let user: User
        if isFiltering {
            user = filteredUsers[indexPath.row]
        }else{
            user = users[indexPath.row]
        }
        
        cell?.textLabel?.text = users[indexPath.row].name
        cell?.detailTextLabel?.text=users[indexPath.row].company.name
        return cell!
        
    }
    
    
    
}

// for Searchbar

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter({ (user: User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
            
        })
        isFiltering = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
