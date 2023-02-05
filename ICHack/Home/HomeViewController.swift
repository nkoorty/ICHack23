import UIKit

class HomeViewController: UIViewController {
    
    var overview: [Overview] = [
        Overview(image: "SQ1", title: "Seizure Likelihood", description: "in last 1h", date: "22 Oct"),
        Overview(image: "SQ2", title: "Heart Rate", description: "in last 1h", date: "11 Mar"),
        Overview(image: "SQ4", title: "Activity", description: "in last 24h", date: "24 Apr"),
        Overview(image: "SQ3", title: "Blood Oxygen", description: "in last 1h", date: "4 Feb"),
    ]
    
    var stats: [Stats] = [
        Stats(image: "Vitals", title: "Vitals"),
        Stats(image: "Leaf", title: "Nutrition"),
        Stats(image: "Bed", title: "Sleeping Activity"),
        Stats(image: "Lung", title: "Antibiotics"),
        Stats(image: "Vitals", title: "Vitals"),
    ]
    
    lazy var topBarView: TopBarView = {
        let topBarView = TopBarView()
        return topBarView
    }()
    
    lazy var slider: ForYouMarketPlaceSlider = {
        let slider = ForYouMarketPlaceSlider()
        return slider
    }()
    
    lazy var healthOverview: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 18, text: "Health Overview", bold: true)
        return text
    }()
    
    lazy var trendingNowChevron: UIButton = {
        let trendingNowChevron = UIButton()
        trendingNowChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .darkGray)
        trendingNowChevron.translatesAutoresizingMaskIntoConstraints = false
        return trendingNowChevron
    }()
    
    lazy var exploreCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(StatsCell.self, forCellWithReuseIdentifier: "exploreCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    lazy var detailedView: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 18, text: "Detailed Statistics", bold: true)
        return text
    }()
    
    lazy var upcomingCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(OverviewCell.self, forCellWithReuseIdentifier: "upcomingCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = .white
    }
    
    func setUpView(){
        view.addSubview(topBarView)
        view.addSubview(slider)
        view.addSubview(healthOverview)
        view.addSubview(trendingNowChevron)
        view.addSubview(exploreCollectionView)
        view.addSubview(detailedView)
        view.addSubview(upcomingCollectionView)
        
        topBarView.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        slider.anchor(top: topBarView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        healthOverview.anchor(top: slider.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        trendingNowChevron.centerYAnchor.constraint(equalTo: healthOverview.centerYAnchor).isActive = true
        trendingNowChevron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        upcomingCollectionView.anchor(top: healthOverview.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 0, width: 0, height: 200)
        
        detailedView.anchor(top: upcomingCollectionView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
    
        exploreCollectionView.anchor(top: detailedView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 300)
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "exploreCell",
                for: indexPath) as? StatsCell else { return UICollectionViewCell() }
            let data = stats[indexPath.item]
            cell.configure(data: data)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "upcomingCell",
                for: indexPath) as? OverviewCell else { return UICollectionViewCell() }
            let data = overview[indexPath.item]
            cell.configure(data: data)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == exploreCollectionView {
            let itemWidth = collectionView.bounds.width
            let itemHeight = CGFloat(44)//view.bounds.height / 15
            let itemSize = CGSize(width: itemWidth, height: itemHeight)
            return itemSize
        }
        else {
            let itemSize = CGSize(width: 130, height: 150)
            return itemSize
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCollectionView {
            return 30
        }
        else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCollectionView {
            return 20
        }
        else {
            return 20
        }
    }
    
}

struct Overview {
    var image: String
    var title: String
    var description: String
    var date: String
}

struct Stats {
    var image: String
    var title: String
}
