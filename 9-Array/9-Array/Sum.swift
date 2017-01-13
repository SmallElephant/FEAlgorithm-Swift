//
//  Sum.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Sum {
    
    //求1+2+…+n,要求不能使用乘除法、for、while、if、else...
    //题目：求1+2+…+n， 要求不能使用乘除法、for、while、if、else、switch、case等关键字以及条件判断语句（A?B:C).
    func sumNumber(n:Int)->Int {
        
        guard n > 0 else {
            return 0
        }
        return  n + sumNumber(n: n-1)
    }
    
     // var sum:Int = 0;
      //n > 0 && (sum = n + sumNumber(n - 1))
      //return sum
    
      //var sum:Int = 0;
      //n == 0 || (sum = n + sumNumber(n - 1))
      //return sum
    
}
