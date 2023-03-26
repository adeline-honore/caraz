//
//  PresentationViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class PresentationViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presentationView: PresentationView!
    private let logo = UIImage(imageLiteralResourceName: "logo")
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationView = view as? PresentationView
        presentationView.configureView(logoValue: logo,
                                       welcomeValue: Texts.welcomePresentation.rawValue,
                                       explainValue: Texts.explainPresentation.rawValue)
    }
    
    // MARK: - Cancel
    
    @IBAction func didTapCancelButton() {
        dismiss(animated: true)
    }
    
}
