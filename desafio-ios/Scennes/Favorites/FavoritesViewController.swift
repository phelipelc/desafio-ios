//
//  FavoritesViewController.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 27/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    var favorites = [ComicsDatabase]()
    var database = ComicsDatabase()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        favorites = database.getAll()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObj = favorites[sourceIndexPath.item]
        favorites.remove(at: sourceIndexPath.item)
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            database.updateComics(idComic: favorites[indexPath.item].id, favorite: false)
            favorites.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    @IBAction func editItems(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Finalizar" : "Editar"
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoritesTableViewCell
        
        let comic = favorites[indexPath.row]
        cell.prepare(with: comic)
        return cell
    }
    

    


}
