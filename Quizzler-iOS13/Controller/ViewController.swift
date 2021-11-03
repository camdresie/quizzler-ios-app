import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var response3: UIButton!
    @IBOutlet weak var response1: UIButton!
    @IBOutlet weak var response2: UIButton!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let correct = quizBrain.checkAnswer(userAnswer)
        
        if correct {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        response1.setTitle(quizBrain.getRes1Text(), for: .normal)
        response2.setTitle(quizBrain.getRes2Text(), for: .normal)
        response3.setTitle(quizBrain.getRes3Text(), for: .normal)
        progress.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
        response1.backgroundColor = UIColor.clear
        response2.backgroundColor = UIColor.clear
        response3.backgroundColor = UIColor.clear
    }
    
}

