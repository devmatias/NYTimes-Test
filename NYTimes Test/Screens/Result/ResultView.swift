


import UIKit

public class ResultView: UIView {
    
    var firstLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.text = "Title"
        view.numberOfLines = 3
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var secondLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "Description"
        view.numberOfLines = 100
        view.textAlignment = .justified
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descriptionImage: UIImageView = {
        let stringImage = "screen 3"
        let image = UIImage(named: stringImage)
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResultView: CodeView {
    func buildViewHierarchy() {
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(descriptionImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            firstLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            descriptionImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            descriptionImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            descriptionImage.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 30)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    
}
