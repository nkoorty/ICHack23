import UIKit

class FeaturedEventView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        //imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .icGreen, size: 14, text: "  Saturday, Oct 22", bold: true)
        return text
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 20, text: "  Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .darkGray, size: 12, text:
                    """
                      We’re hyped to have you at the first ever
                      Polygon student hackathon in London on
                      22-23 October!
                    """
                    , bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white.withAlphaComponent(0.7)
        addSubview(featuredStackView)
        imageView.topAnchor.constraint(equalTo: featuredStackView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        featuredStackView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 10, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
