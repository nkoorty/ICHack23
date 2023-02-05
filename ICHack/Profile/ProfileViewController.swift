import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    
    lazy var dataLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 24, text: "Your Profile", bold: true)
        return text
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = .white
    }
    
    func setUpView(){
        
        let vc = UIHostingController(rootView: ContentView())
        let swiftuiView = vc.view!
        swiftuiView.backgroundColor = .white
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        
        let vc1 = UIHostingController(rootView: ContentView1())
        let swiftuiView1 = vc1.view!
        swiftuiView1.backgroundColor = .white
        swiftuiView1.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc1)
        
        view.addSubview(dataLabel)
        view.addSubview(swiftuiView)
        view.addSubview(swiftuiView1)
        
        dataLabel.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        swiftuiView.anchor(top: dataLabel.bottomAnchor, paddingTop: 100, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 100, right: view.rightAnchor, paddingRight: 100, width: 100, height: 200)
        
        swiftuiView1.anchor(top: swiftuiView.bottomAnchor, paddingTop: 100, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 100, right: view.rightAnchor, paddingRight: 100, width: 100, height: 200)
    }
}
   
