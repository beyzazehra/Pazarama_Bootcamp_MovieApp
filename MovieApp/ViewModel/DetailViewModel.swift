import Foundation

class DetailViewModel {
    
    private let movieService : MovieService
    weak var output : DetailViewModelProtocol?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func fetchMovie(id: String) {
        movieService.fetchMovieByID(id: id){[weak self] result in
            switch result {
            case .success(let movie):

                self?.output?.updateView(movie:movie)
            case.failure(_):
                self?.output?.updateView(movie:nil)
            }
        }
    }
}
