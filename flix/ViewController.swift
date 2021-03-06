//
//  ViewController.swift
//  flix
//
//  Created by Kushal Kuchibhotla on 4/12/20.
//  Copyright © 2020 Kushal Kuchibhotla. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    
    @IBOutlet weak var TableView: UITableView!
    var movies = [[String:Any]]()
//    var movies = [[String:Any]].self
    override func viewDidLoad() {
        
        
        
        TableView.dataSource = self
        TableView.delegate = self
        
        
//        tableView.dataSource = self
//        tableView.delegate = self
        super.viewDidLoad()
        print("Hello")
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
//            movies = dataDictionary["results"] as! [[String:Any]]
//
//            tableView.reloadData()
            
            self.movies = dataDictionary["results"] as! [[String:Any]]
            self.TableView.reloadData()
//                print(dataDictionary)
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.TitleLabel.text = title
        cell.SynopsisLabel.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string:baseUrl + posterPath)!
        cell.PosterLabel.af_setImage(withURL: posterUrl)
//
        return cell
     }


}

