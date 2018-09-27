//
//  MoviesViewController.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 23/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit

class ComicsViewController: UIViewController, PresenterDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [Comics]()
    @IBOutlet weak var loading: UIActivityIndicatorView!
    func fetchData(movie: [Comics]) {
      self.movies = movie
        collectionView.reloadData()
        loading.stopAnimating()
    }
    func requestData(){
       presenter?.getItems()
    }
    
    var presenter: ComicsPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
       self.presenter = ComicsPresenter(delegate: self)
        requestData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        let movie = movies[(indexPath?.row)!]
        vc.movie = movie
        
    }

}
extension ComicsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.lblTitle.text = movies[indexPath.row].title
        
       
        
        let isoDate = movies[indexPath.row].dates![0].date
        
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:isoDate!)!
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let string = formatter.string(from: date)
        cell.lblDate.text = string
    
        if let image = movies[indexPath.row].thumbnail?.image as? UIImage{
            cell.imgComic.image = image
        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  30
        let collectionViewSize = collectionView.frame.size.width - padding
        print(collectionView.frame.size.width)
        return CGSize(width: collectionViewSize/2, height:542/2)
    }

    
    
    
}
