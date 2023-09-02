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
        var selectedTypes: [Animal: Int] = [:]
        
//        answers.forEach { animal in
//            if let counOfType = selectedTypes[animal] {
//                selectedTypes.updateValue(counOfType + 1, forKey: animal)
//            } else {
//                selectedTypes[animal] = 1
//            }
//        }
        
        answers.forEach { animal in
            selectedTypes[animal, default: 0] += 1
        }
        
        let mostFrequentType = selectedTypes.max { $0.1 < $1.1 }?.key
        
        дуе
        
        updateUI(with: mostFrequentType ?? .dog)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        definationLabel.text = animal.definition
        
    }
}
