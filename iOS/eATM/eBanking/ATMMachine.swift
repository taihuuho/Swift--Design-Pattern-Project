//
//  ATMMachine.swift
//  eBanking
//
//  Created by Tai Huu Ho on 7/15/15.
//  Copyright (c) 2015 Tai Huu Ho. All rights reserved.
//

import UIKit

class ATMMachine: NSObject {
    
    var atmID : String = "ATM@MUM"
    
    var servicingState : ATMState?
    var runOutOfMoney : ATMState?
    var outOfService : ATMState?
    
    var state : ATMState?

    
    private var _amount : Double = 100000000
    
    var amount : Double{
        get{
            return _amount
        }
    }
    
    private override init() {
        super.init()
        servicingState = ServicingState(machine: self)
        runOutOfMoney = RunOutOfMoneyState(machine: self)
        outOfService = OutOfServiceState(machine: self)
        
        state = ServicingState(machine: self)
    }
    
    //MARK: Singleton
    private class var instance : ATMMachine{
        struct Singleton {
            static let instance = ATMMachine()
        }
        return Singleton.instance
    }
    
    class func sharedInstance() -> ATMMachine{
        return instance
    }
    
    
    func canReturnMoney(amount : Double) -> Bool{
        if _amount >= amount{
            return true
        }else{
            return false
        }
    }
    
    func returnMoney(amount : Double) -> Void{
        if canReturnMoney(amount){
            _amount -= amount
        }
    }
    
    
    func withdrawAmount(amount: Double) -> NSError?{
        return state?.withdraw(amount: amount, account: UserAccountSingleton.getInstance().currentAccount! )
    }
}
