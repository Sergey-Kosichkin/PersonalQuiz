//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var animalsChosen: [AnimalType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showResult(of: animalsChosen,
                   result: resultLabel,
                   description: descriptionLabel)
    }
    
    private func showResult(of array: [AnimalType],
                            result: UILabel,
                            description: UILabel) {
        
        let mappedAnimals = array.map { ($0, 1) }
        let counts = Dictionary(mappedAnimals, uniquingKeysWith: +)
        let sortedAnimals = counts.sorted( by: { $0.1 > $1.1 })
        
        result.text = "Вы - " + String(sortedAnimals.first?.key.rawValue ?? " ")
        description.text = sortedAnimals.first?.key.definition
    }
}
