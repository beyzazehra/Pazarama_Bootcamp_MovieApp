class MoviesViewModel {
    
    private let movieService : MovieService
    weak var output : MoviesViewModelProtocol?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func fetchMovies(searchParam: String) {
        movieService.fetchMovies(searchParam: searchParam) {[weak self] result in
            switch result {
            case .success(let movie):

                self?.output?.updateView(movies:movie)
            case.failure(_):
                self?.output?.updateView(movies:[])
            }
        }
    }
}
