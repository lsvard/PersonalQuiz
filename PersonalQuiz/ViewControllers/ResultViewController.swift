//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by lsvard on 27.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func getResult() {
        let answers = answers.map { $0.animal }
        var mostCommonType: [Animal: Int] = [:]
        
        answers.forEach { animal in
            if let countAnimals = mostCommonType[animal] {
                mostCommonType.updateValue(countAnimals + 1, forKey: animal)
            } else {
                mostCommonType[animal] = 1
            }
        }
        
        let result = mostCommonType.max { $0.1 < $1.1 }?.key
        updateUI(with: result!)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "ВЫ - \(animal.rawValue)"
        definationLabel.text = animal.definition
    }
}


    
