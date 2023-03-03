//
//  20546.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/03.
//

import Foundation

let money = Int(readLine()!)!
let trade = readLine()!.split(separator: " ").map({ Int($0)! })

//(현금, 주식수)
var bnp = (money: money, trade: 0)
var timing = (money: money, trade: 0)

var trend = true //1: 주가 상승 , 0: 주가 하락
var trendCount = 0

//1일 초기화
bnp.trade += bnp.money / trade[0]
bnp.money = bnp.money % trade[0]

for (i,t) in trade[1...13].enumerated(){
    
    //bnp
    if(bnp.money >= t){
        bnp.trade += bnp.money / t
        bnp.money = bnp.money % t
    }
    
    //timing
    if(trade[i+1] > trade[i]){
        trendCount = !trend ? 1 : trendCount + 1
        trend = true
    }else if(trade[i+1] < trade[i]){
        trendCount = trend ? 1 : trendCount + 1
        trend = false
    }else{
        trendCount = 0
    }
    
    if(trendCount >= 3){
        if(trend){
            timing.money += timing.trade * t
            timing.trade = 0
        }else{
            if(timing.money >= t){
                timing.trade = timing.money / t
                timing.money = timing.money % t
            }
        }
    }
}


let bnpLast = bnp.money + trade.last! * bnp.trade
let timingLast = timing.money + trade.last! * timing.trade


if(bnpLast == timingLast){
    print("SAMESAME")
}else if(bnpLast > timingLast){
    print("BNP")
}else{
    print("TIMING")
}
