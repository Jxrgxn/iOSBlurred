//
//  MainViewController.swift
//  iOSBlurred
//
//  Created by BASEL FARAG on 4/3/18.
//  Copyright © 2018 velentium. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ModalViewControllerDelegate {

    @IBAction func openModalView(_ sender: Any) {
        self.definesPresentationContext = true
        
        self.providesPresentationContextTransitionStyle = true
        
        self.overlayBlurredBackGroundView()
    
    }
    
    func overlayBlurredBackGroundView() {
        
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        
        view.addSubview(blurredBackgroundView)
        
    }
    
    func removeBlurredBackgroundView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "ShowModalView" {
                if let viewController = segue.destination as? ModalViewController {
                    viewController.delegateModal = self
                    viewController.modalPresentationStyle = .overFullScreen
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
