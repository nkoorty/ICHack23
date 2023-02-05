import UIKit
import SwiftUI

class DataViewController: UIViewController, UIScrollViewDelegate {
    
    
    lazy var dataLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 24, text: "Data Overview", bold: true)
        return text
    }()
    
    lazy var seizureLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 16, text:
                """
                Overview of how likely the occurence of a seizure has been based on your motions
                and vitals.
                """
                    , bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var heartLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 16, text:
                """
                Overview of your pulse rate over the last minute.
                """
                    , bold: true)
        text.numberOfLines = 0
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
        view.addSubview(seizureLabel)
        view.addSubview(swiftuiView1)
        view.addSubview(heartLabel)
        

        
        dataLabel.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        swiftuiView.anchor(top: dataLabel.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 200)
        
        seizureLabel.anchor(top: swiftuiView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 65)
        
        swiftuiView1.anchor(top: seizureLabel.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 200)
        
        heartLabel.anchor(top: swiftuiView1.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 32, right: view.rightAnchor, paddingRight: 32, width: 0, height: 65)
    }
            
}
