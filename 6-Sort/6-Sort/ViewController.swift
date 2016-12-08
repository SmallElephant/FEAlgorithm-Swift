//
//  ViewController.swift
//  6-Sort
//
//  Created by keso on 2016/11/27.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let data:[Int] = [1,2,3,2,4,8,9,10,19,0]
        let result = quickSort(data: data)
        print("方案1:-\(result)")
        
        var arr:[Int] = [10,3,17,8,5,2,1,9,5,4]
        quickSort(data: &arr, low: 0, high: arr.count-1)
        print("方案2:-\(arr)")
        
        let roateArr:[Int] = [3,4,5,1,2]
        let roateResult:Int? = self.minOfRoateArr(arr: roateArr)
        if let minResult = roateResult {
            print("旋转数组中的最小值:\(minResult)")
        }
        
        let roateArr1:[Int] = [1,1,1,0,1]
        let roateResult1:Int? = self.minOfRoateArr(arr: roateArr1)
        if let minResult = roateResult1 {
            print("旋转数组中的最小值:\(minResult)")
        }
        
     
        if self.judgeNumber(number: 8) {
             print("8是2的整数次幂")
        }
        
        if self.judgeNumber(number: 10) {
            print("10是2的整数次幂")
        } else {
            print("10不是2的整数次幂")
        }
        
        let fibResult:Int = self.fibonacci(n: 12)
        print("斐波那契数列第五项:\(fibResult)")
        
        let count:Int = self.countPositionNumber(number: 0xFFFFFFFF)
        print("FlyElephant-数字中1的个数:\(count)")
        
        let count1:Int = self.countPositionNumber1(number: 0xFFFFFFFF)
       print("FlyElephant---数字中1的个数:\(count1)")

        //0xFFFFFFFF
        let count2:Int = self.countPositionNumber2(number: 0xFFFFFFFF)
        print("FlyElephant---数字中1的个数:\(count2)")
        
        let count3:Int = self.countPositionNumber2(number: 0xFFFFFFFF)
        print("FlyElephant---数字中1的个数:\(count3)")
        
        let sortArr:[Int] = [1,2,3,4,5]
        let tempArr = self.shuffleArray(arr: sortArr)
        print("随机数组:\(tempArr)")
        // 计算需要改变m的二进制表示中的多少位才能得到n.15的二进制1111，1的二进制1 ，需要改变3位
        let first:Int = 15
        let next:Int = 1
        let changeNum:Int = self.exchangeToSame(firstNum: first, secondNum: next)
        print("FlyElephant-改变\(changeNum)位")
        
        let power:Power = Power()
        print("计算结果:\(power.power(base: 0, exponent: 0))")
        print("计算结果:\(power.power(base: 2, exponent: 3))")
        print("计算结果:\(power.power(base: 1.2, exponent: 2))")
        
        
        //let digitCount:Int = 2
//        self.printMaxDigits(digitCount: 3)
        
        let maxDigit = MaxDigit()
        maxDigit.normalPrintMaxDigits(digitCount: 2)
//        maxDigit.printMaxDigits(digitCount: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func exchangeToSame(firstNum:Int,secondNum:Int) -> Int {
        var result:Int = firstNum ^ secondNum
        var count:Int = 0
        while result != 0 {
            count += 1
            result = result & (result-1)
        }
        return count
    }
    
    // 随机交换
    func shuffleArray(arr:[Int]) -> [Int] {
        var data:[Int] = arr
        for i in 1..<arr.count {
            let index:Int = Int(arc4random()) % i
            if index != i {
                swap(&data[i], &data[index])
            }
        }
        return data
    }
    
    func judgeNumber(number:Int) -> Bool {
        if (number & (number-1)) == 0 {
            return true
        } else {
            return false
        }
    }
    
    func countPositionNumber(number:Int) -> Int {
        var num:Int = number
        var count = 0
        while num != 0 {
            if num%2 == 1 {
                count += 1
            }
            num = num/2
        }
        return count
    }
    
    func countPositionNumber1(number:Int) -> Int {
        var num:Int = number
        var count = 0
        while num != 0 {
            if (num & 1) == 1 {
                count += 1
            }
            num = num >> 1
        }
        return count
    }
    
    func countPositionNumber2(number:Int) -> Int {
        let num:Int = number
        var flag = 1
        var count = 0
        while flag > 0 {
            if (num & flag) > 0 {
                count += 1
            }
            flag = flag << 1
        }
        return count
    }
    // 将一个整数减1然后和原来的整数做位与运算，相当于原有的二进制数最右边的1变为0
    func countPositionNumber3(number:Int) -> Int {
        var num:Int = number
        var count:Int = 0
        while num > 0 {
            count += 1
            num = num & (num-1)
        }
        return count
    }

    
    func fibonacci(n:Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        if n == 1 {
            return 1
        }
        
        var firstNum:Int = 0
        var secondNum:Int = 1
        var result:Int = 0
        for _ in 2...n {
            result = secondNum + firstNum
            firstNum = secondNum
            secondNum = result
        }
        return result
    }
    
    
    func minOfRoateArr(arr:[Int]?) -> Int? {
        guard let data = arr, data.count > 0 else {
            return nil
        }
        
        var indexStart:Int = 0
        var indexEnd:Int = data.count-1
        var indexMid = indexStart
        while data[indexStart] >= data[indexEnd] {
            if (indexEnd-indexStart) == 1 {
                indexMid = indexEnd
                break
            }
            indexMid = (indexStart+indexEnd)/2
            
            if data[indexStart] == data[indexMid] && data[indexStart] == data[indexEnd] {
                return self.minOfArr(arr: arr!, start: indexMid, end: indexEnd)
            }
            
            if data[indexMid] >= data[indexStart] {
                indexStart = indexMid
            } else if data[indexMid] <= data[indexEnd] {
                indexEnd = indexMid
            }
        }
        return data[indexMid]
    }
    
    func minOfArr(arr:[Int],start:Int,end:Int) -> Int {
        var min:Int = arr[start]
        for index in start...end {
            if  arr[index] < min {
                min = arr[index]
            }
        }
        return min
    }
    
    func quickSort(data:[Int])->[Int]{
        if data.count<=1 {
            return data
        }
        
        var left:[Int] = []
        var right:[Int] = []
        let pivot:Int = data[data.count-1]
        for index in 0..<data.count-1 {
            if data[index] < pivot {
                left.append(data[index])
            }else{
                right.append(data[index])
            }
        }
        
        var result = quickSort(data: left)
        result.append(pivot)
        let rightResult = quickSort(data: right)
        result.append(contentsOf: rightResult)
        return result
    }
    
    func partition( data:inout [Int],low:Int,high:Int) -> Int {
        
        let root = data[high]
        var index = low
        for i in low...high {
            if data[i] < root {
                if i != index {
                    swap(&data[i], &data[index])
                }
                index = index+1
            }
        }
        
        if high != index {
            swap(&data[high], &data[index])
        }
        return index
    }
    
    func quickSort(data:inout [Int],low:Int,high:Int) -> Void {
        if low > high {
            return
        }
        let sortIndex = partition(data: &data, low: low, high: high)
        quickSort(data: &data, low: low, high: sortIndex-1)
        quickSort(data: &data, low: sortIndex+1, high: high)
    }


}

