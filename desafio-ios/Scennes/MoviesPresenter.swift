//
//  MoviesPresenter.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 23/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit
protocol PresenterDelegate{
    func fetchData(movie: [Comics])
    func requestData()
}
class MoviesPresenter {
    var delegate: PresenterDelegate?
    var model = MoviesModel()
    var items : [Comics]?
    init(delegate: PresenterDelegate){
        self.delegate = delegate
    }
    
    func getItems(){
        model.getMovies { (result) in
            switch result{
            case .success(let movies):
                self.items = movies as! [Comics]
                for i in 0...self.items!.count-1{
                    self.model.downloadImage(from: URL(string: "\(self.items![i].thumbnail?.path as! String).\(self.items![i].thumbnail?.ext as! String)")!, callback: { (result) in
                        switch result{
                        case .success(let image):
                                var img = image as! UIImage
                                self.items![i].thumbnail?.image = img
                                if i == (self.items?.count)!-1{
                                    self.delegate?.fetchData(movie: self.items!)
                            }
                        case .failure(_):
                            break
                        }
                    })
                    
                }
               
                
            case .failure(_):
                break
                
            }
            
        }
        
    }
    

}
