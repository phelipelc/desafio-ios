//
//  MoviesModel.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 23/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class ComicsModel {

    func getMovies(callback: @escaping (Result<Any>) -> Void){
        
        let parameters = ("?ts=1537883143541&apikey=\(Constants.token)&hash=430fbf2273232f62c6bb43cea780dc62&limit=50")
        print(Constants.URL_COMICS+Constants.COMICS+parameters)
        Alamofire.request(Constants.URL_COMICS+Constants.COMICS+parameters).responseJSON { response in
       
            switch(response.result){
            case .success(_):
                if let comic =  Mapper<Datas<Results>>().map(JSONObject: response.value){
                    callback(Result.success(comic.data?.result))
                }else{
                    callback(Result.failure("Login_error_message" as! Error))
                }
            
            case .failure(_):
                callback(Result.failure("Login_error_message" as! Error))
            }
            
        }
            
            
    }
    func downloadImage(from url: URL, callback: @escaping (Result<Any>) -> Void) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                let image = UIImage(data: data)
                callback(Result.success(image))
            }
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    
   
}
