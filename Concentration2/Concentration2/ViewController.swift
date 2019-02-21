//
//  ViewController.swift
//  Concentration2
//
//  Created by apple on 2019/2/17.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfPairsOfCards:Int{
        return (cardButtons.count+1)/2
    }
    private lazy var game=Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private(set) var flipCount=0{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes :[NSAttributedString.Key:Any]=[
            .strokeWidth:5.0,
            .strokeColor:UIColor.orange
        ]
        let attributedString=NSAttributedString(string: "Flips:\(flipCount)", attributes: attributes)
        flipCountLabel.attributedText=attributedString
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen button is not in cardButtons")
        }
        
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    //private var emojiChoices=["👻","🎃","🦇","🍬","🍭","🍎","👿"]
    private var emojiChoices="👻🎃🦇🍬🍭🍎👿"
    private var emoji=[Card:String]()
    
    private func emoji(for card:Card)->String{
        if emoji[card] == nil , emojiChoices.count > 0{
                let randomIndex=Int.random(in: 0..<emojiChoices.count)
                emoji[card] = String(emojiChoices.remove(at: emojiChoices.index(emojiChoices.startIndex, offsetBy: randomIndex)))
                return emoji[card] ?? "?"
            
        }
        return emoji[card] ?? "?"
        
    }
    
    
}

