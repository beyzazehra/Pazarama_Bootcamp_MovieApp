import UIKit

class MovieCell: UITableViewCell {
    
    
    let movieImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    
    let releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        contentView.backgroundColor = .black
        movieTitle.textColor = .white
        releaseDate.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(movieImg)
        contentView.addSubview(movieTitle)
        contentView.addSubview(releaseDate)
        
        
        movieImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        movieImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        movieImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        movieImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        movieTitle.leadingAnchor.constraint(equalTo: movieImg.trailingAnchor, constant: 8).isActive = true
        movieTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        
        releaseDate.leadingAnchor.constraint(equalTo: movieImg.trailingAnchor, constant: 8).isActive = true
        releaseDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 8).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    
}
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
}
