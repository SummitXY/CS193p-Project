//
//  Card.swift
//  Concentration2
//
//  Created by apple on 2019/2/17.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//




import Foundation

struct Card:Hashable,Equatable {
    var hashValue:Int{
        return identifier
    }
    
    static func ==(lhs:Card,rhs:Card)->Bool{
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp=false
    var isMatched=false
    private var identifier:Int
    
    private static var identifierFactory=0
    
    private static func getUniqueIdentifier()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    
    init(){
        identifier=Card.getUniqueIdentifier()
    }
}
