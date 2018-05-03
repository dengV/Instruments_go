 

import Foundation

class BullsEyeGame {
  var round = 0
  let startValue = 50
  var targetValue = 50
  var scoreRound = 0
  var scoreTotal = 0
  
    
    
  init(){
    startNewGame()
  }
  
    
    
  func startNewGame() {
    round = 0
    scoreTotal = 0
    startNewRound()
  }
  
    
    
    
  func startNewRound() {
    round = round + 1
    scoreRound = 0
    targetValue = 1 + (Int(arc4random()) % 100)
  }
  
    
    
    
  func check(guess: Int) -> Int {

    let difference = guess - targetValue
    
    //  改错， 这里取个 绝对值
    scoreRound = 100 - abs(difference)
    
    scoreTotal = scoreTotal + scoreRound
    
    return difference
  }
}
