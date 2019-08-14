//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var totalCorrectAnswers = 0
    var totalAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answeredLabel.text = "Perguntas respondidas: \(totalAnswers)"
        correctLabel.text = "Perguntas corretas: \(totalCorrectAnswers)"
        wrongLabel.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        let score = totalCorrectAnswers*100/totalAnswers
        scoreLabel.text = "\(score)%"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
