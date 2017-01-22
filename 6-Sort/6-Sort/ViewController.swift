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
        
        bubbleSort()
        selectSort()
        insertSort()
        shellSort()
        mergeSort()
        qucikSort()
        
        //var heapData:[Int] = [1, 3, 4, 5, 2, 6, 9, 7, 8, 0]
        var minHeapData:[Int] = [16,7,3,20,17,8]
        let heapSort:HeapSort = HeapSort()
        
        heapSort.heapSort(arr: &minHeapData)
        
        print("FlyElephant--小根堆结果---\(minHeapData)")
        
        var maxHeapData:[Int] = [16,7,3,20,17,8]
        heapSort.heapMaxSort(arr: &maxHeapData)
        print("FlyElephant--大根堆结果---\(maxHeapData)")
        
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


    // 冒泡排序
    func bubbleSort() {
        var bubbleArr:[Int] = [1,3,7,2,4,1,0]
        let bubbleSort:BubbleSort = BubbleSort()
        bubbleSort.bubbleSort(arr: &bubbleArr)
        print("FlyElephant-冒泡排序之后的数组---\(bubbleArr)")
        
        bubbleArr = [1,3,7,2,4,1,0]
        bubbleSort.bubbleSort1(arr: &bubbleArr)
        print("FlyElephant-冒泡排序之后的数组---\(bubbleArr)")
        
        bubbleArr = [1,3,7,2,4,1,0]
        bubbleSort.bubbleSort2(arr: &bubbleArr)
        print("FlyElephant-冒泡排序之后的数组---\(bubbleArr)")
    }
    
    // 选择排序
    func selectSort() {
        var arr:[Int] = [10,2,5,7,3,1,0]
        let selectSort:SelectSort = SelectSort()
        selectSort.sort(arr: &arr)
        print("选择排序---\(arr)")
    }
    
    // 插入排序
    func insertSort() {
        var arr:[Int] = [9,7,6,5,1,2,0]
        let inserSort:InsertionSort = InsertionSort()
        inserSort.sort(arr: &arr)
        print("FlyElephant-插入排序---\(arr)")
    }
    
    // 希尔排序
    func shellSort() {
        var arr:[Int] = [10,8,1,5,3,4,9,0,7,11]
        let shellSort:ShellSort = ShellSort()
        shellSort.sort(arr: &arr)
        print("FlyElephant-希尔排序---\(arr)")
    }
    
    // 归并排序
    func mergeSort() {
        let mergeSort:MergeSort = MergeSort()
        var mergeSortData:[Int] = [1,10,2,4,3,9,9,5,6,8,7]
        mergeSort.mergeSort(arr: &mergeSortData, low: 0, high:mergeSortData.count-1 )
        print("FlyElephant-归并排序---\(mergeSortData)")
    }
    
    // 快速排序
    func qucikSort() {
        let quickSort:QuickSort = QuickSort()
        var arr:[Int] = [1,2,4,3,9,9,5,6,8,7]
        quickSort.quickSort(arr: &arr, low: 0, high: arr.count - 1)
        print("FlyElephant--快速排序---\(arr)")
    }

}

