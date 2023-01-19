//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 19.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            self.performSegue(withIdentifier: "splashToCharacterSegue", sender: nil)
        }
    }
}

