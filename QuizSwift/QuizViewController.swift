//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]! // outlet collection
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerView.frame.size.width = view.frame.size.width // quando eu ressetar o aplicativo quero que a view volta ser do tamanho da largura da tela
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        questionLabel.text = quizManager.question

        for i in 0..<quizManager.options.count {
            print("i", i)
            let option = quizManager.options[i]
            let button = answersButton[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "segueResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = answersButton.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    

}
