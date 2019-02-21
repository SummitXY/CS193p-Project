//
//  Concentration.swift
//  Concentration2
//
//  Created by apple on 2019/2/17.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards=[Card]()
    
    private var indexOfOneAndOnlyFaceUpCard:Int? {
        get {
            return cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
            
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)):chosen index not in the card")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int) {
        assert(numberOfPairsOfCards>0,"Concentration.init(numberOfPairsOfCards:\(numberOfPairsOfCards):You must place at least one pair")
        for _ in 0..<numberOfPairsOfCards{
            let card=Card()
            cards += [card,card]
        }
        
        cards.shuffle()
    }
    
    
}

extension Collection{
    var oneAndOnly:Element?{
        return count==1 ? first:nil
    }
}
