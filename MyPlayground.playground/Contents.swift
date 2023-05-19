import UIKit

var greeting = "Hello, playground"

func loveCalculator() {
    let loveScore = Int.random(in: 1...100)
    
    switch loveScore {
    case 81...100:
        print("You love each other like Kanye loves Kanye")
    case 41..<81:
        print("You go together like Coke and Mentos")
    case ...40:
        print("You go together like Coke and Mentos")
    default:
        print("Error loveScore is out of range")
    }
}



loveCalculator()


