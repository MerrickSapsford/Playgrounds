//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport

class BlurSliderViewController: UIViewController {
    
    weak var visualEffectView: UIVisualEffectView?
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpComponents()
        
        // create animator that will add effect to visual effect view
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: { 
            self.visualEffectView?.effect = UIBlurEffect(style: .light)
        })
    }
    
    func setUpComponents() {
        
        // set up image view and blur view
        
        let width = 375.0
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: Double(self.view.bounds.size.height)))
        imageView.backgroundColor = UIColor.red()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = UIImage(named: "mediacity.JPG")
        self.view.addSubview(imageView)
        
        let visualEffectView = UIVisualEffectView()
        visualEffectView.frame = imageView.bounds
        self.view.addSubview(visualEffectView)
        self.visualEffectView = visualEffectView
        
        let slider = UISlider(frame: CGRect(x: 8.0, y: 0.0, width: width - 16.0, height: 40.0))
        self.view.addSubview(slider)
        slider.addTarget(viewController, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    func sliderValueChanged(slider: UISlider) {
        animator?.fractionComplete = CGFloat(slider.value)
    }
}

let viewController = BlurSliderViewController()
viewController.view.backgroundColor = UIColor.white()
PlaygroundPage.current.liveView = viewController
