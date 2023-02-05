import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // remove top line
        tabBar.tintColor = .icGreen
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .icGreen.withAlphaComponent(0.5)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
}

// Tab Bar Specific Code
override func viewDidAppear(_ animated: Bool) {
    
    let home = HomeViewController()
    let homeimage = UIImage(systemName: "house")
    let homeselected = UIImage(systemName: "house.fill")
    home.tabBarItem =  UITabBarItem(title: "Home", image: homeimage, selectedImage: homeselected)
   
    // need to move this to custom button
    let data = DataViewController()
    let ticketImage = UIImage(systemName: "chart.line.uptrend.xyaxis")
    let ticketselected = UIImage(systemName: "chart.line.uptrend.xyaxis")
    data.tabBarItem = UITabBarItem(title: "Live Data", image: ticketImage, selectedImage: ticketselected)

    let profile = ProfileViewController()
    let accountimage = UIImage(systemName: "person.crop.circle")
    let accountselected = UIImage(systemName: "person.crop.circle.fill")
    profile.tabBarItem = UITabBarItem(title: "Profile", image: accountimage, selectedImage: accountselected)

    let tabbarList = [home, data, profile]
    
    viewControllers = tabbarList.map {
        UINavigationController(rootViewController: $0)
    }
 
    }
 }
