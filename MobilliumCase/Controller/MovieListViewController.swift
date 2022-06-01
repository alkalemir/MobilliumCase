//
//  MovieListViewController.swift
//  MobilliumCase
//
//  Created by Emir Alkal on 1.06.2022.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let movieBrain = MovieBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        movieBrain.setMovies(with: ["A Space Odyssey", "The Godfather", "Citizen Kane", "Singin' in the Rain", "Pulp Fiction", "Toy Story", "Taxi Driver", "Shutter Island", "The Dark Knight", "Steve Jobs"])
        
    }
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieBrain.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell.rawValue)!
        cell.textLabel?.textColor = .darkGray
        cell.textLabel?.text = movieBrain.getMovieTitle(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTitle = movieBrain.getMovieTitle(at: indexPath.row)
        
        presentAlert(title: "Info", message: selectedTitle)
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
