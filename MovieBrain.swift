import Foundation


class MovieBrain {
    private var movies = [Movie]()
    
    func setMovies(with array: [String]) {
        for item in array {
            movies.append(Movie(title: item))
        }
    }
    
    func getMovieTitle(at index: Int) -> String {
        return movies[index].title
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
}

class Movie {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
