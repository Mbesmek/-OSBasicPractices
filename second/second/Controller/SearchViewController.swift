//
//  SearchViewController.swift
//  second
//
//  Created by Melih Bugra Esmek on 10.09.2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    let searchController = UISearchController(searchResultsController: nil)
    var users = [User]()
    var filteredUsers = [User]()
    
    var isSerachBarEmpty : Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering : Bool {
        return searchController.isActive && !isSerachBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: urlString) else { return }
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
       
        
        guard let users = userList else { return }
        self.users = users
        tableView.dataSource = self
        title = "Search"
        configureSearchController()
    }
    
    private func configureSearchController(){
        searchController.searchBar.placeholder = "Search User"
//        searchController.searchResultsUpdater =self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func filterContextForSearchText(searchText : String) {
        filteredUsers = users.filter({ (user: User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}
// for TableView
extension SearchViewController : UITableViewDataSource{
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


extension SearchViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchText(searchText: searchBar.text!)
    }
    
    
}
