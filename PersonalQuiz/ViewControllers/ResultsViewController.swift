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
        showResult()
    }
    
}
extension ResultsViewController {
    private func showResult() {
        let mappedAnimals = animalsChosen.map { ($0, 1) }
        let counts = Dictionary(mappedAnimals, uniquingKeysWith: +)
        let sortedAnimals = counts.sorted( by: { $0.1 > $1.1 })
        
        guard let mostFrequentAnimal = sortedAnimals.first?.key else { return }
        updateUI(with: mostFrequentAnimal)
    }
   
    private func updateUI(with animal: AnimalType) {
        resultLabel.text = "Вы - " + String(animal.rawValue)
        descriptionLabel.text = animal.definition
    }
}
