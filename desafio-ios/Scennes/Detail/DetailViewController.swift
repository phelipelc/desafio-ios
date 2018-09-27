//
//  DetailViewController.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 26/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Comics?
    var database = ComicsDatabase()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ivComic: UIImageView!
    override func viewDidLoad() {
 
        super.viewDidLoad()
        ivComic.image = movie?.thumbnail?.image as! UIImage
       tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}
extension DetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      return  1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellTitle") as! CellTitle
            cell1.cellDelegate = self
            if let comm = database.getUser(id: ((movie?.id)!)) as? Bool{
                if(comm == true ){
                    cell1.btnFavorite.setBackgroundImage(UIImage(named: "favorite_full_icon"), for: .normal)
                }
            }
            cell1.lblTitle.text = movie?.title
            return cell1
        } else if indexPath.row == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellValue") as! CellValue
            var string = "R$ \(String(format:"%.1f", (movie?.prices)!))"
            cell2.lblValue.text = string
            return cell2
        } else if indexPath.row == 2{
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cellDate") as! CellDate
            
            let isoDate = movie!.dates![0].date
            
            let dateFormatter = ISO8601DateFormatter()
            let date = dateFormatter.date(from:isoDate!)!
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let string = formatter.string(from: date)
            
            cell3.lblDate.text = string
            return cell3
        }else{
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "cellOverview") as! CellOverview
            var string = movie!.description
            if (movie?.characters?.items?.count)!>0{
            for i in 0...movie!.characters!.items!.count-1{
                string = "\(string) \((movie?.characters?.items?[i].name)!)"
                }
                
            }
            if (movie?.creators?.items?.count)!>0{
                for i in 0...movie!.creators!.items!.count-1{
                    string = "\(string) \((movie?.creators?.items?[i].name)!)"
                }
                
            }
            cell4.lblOverview.text = string
            return cell4
        }

    }
    
    
}
extension DetailViewController: UITableViewDelegate{
    
}

extension DetailViewController: DelegateAction{
    func favorited(sender: Any) {
        let btn = sender as! UIButton
        database.id = (movie?.id)!
        database.date = (movie?.dates![0].date)!
        database.image = "\(movie?.thumbnail?.path)\(movie?.thumbnail?.ext)"
        database.price = (movie?.prices![0].price)!
        database.title = (movie?.title)!
        var string = (movie?.description)!
        if (movie?.characters?.items?.count)!>0{
        for i in 0...movie!.characters!.items!.count-1{
            string = "\(string) \((movie?.characters?.items?[i].name)!)"
        }
        
    }
    if (movie?.creators?.items?.count)!>0{
        for i in 0...movie!.creators!.items!.count-1{
        string = "\(string) \((movie?.creators?.items?[i].name)!)"
    }
    
    }
        
        database.descript = string
        if let value = database.getUser(id: database.id) as? Int{
            if(value == 1){
                database.updateUser(idComic: database.id, favorite: false)
                btn.setBackgroundImage(UIImage(named: "favorite_empty_icon"), for: .normal)
            }else{
                database.updateUser(idComic: database.id, favorite: true)
                btn.setBackgroundImage(UIImage(named: "favorite_full_icon"), for: .normal)
            }
        }else{
            database.createComics(comics: database)
        }
        
    }
    
   
    
    
}
