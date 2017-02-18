//
//  BinarySearch.swift
//  8-Search
//
//  Created by FlyElephant on 17/1/3.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class BinarySearch {
    
    func binarySearchNumber(arr:[Int],num:Int) -> Int? {
        if arr.count == 0 {
            return nil
        }
        
        var low:Int = 0
        var high:Int = arr.count - 1
        
        while low <= high {
            let mid:Int = (low + high)/2
            if arr[mid] == num {
                return mid
            } else {
                if arr[mid] > num {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }
        return nil
    }
    
    
    //数字在排序数组中出现的次数
    //题目：统计一个数字在排序数组中出现的次数。例如输入排序数组{1,2,3,3,3,3,4,5}和数字3，由于3在这个数组中出现了4次，因此输出4.
    func searchNumberOfK(arr:[Int],num:Int) -> Int? {
        if arr.count == 0 {
            return nil
        }
        
        let first:Int? = searchFirstOfK(arr: arr, num: num)
        let last:Int? = searchLastOfK(arr: arr, num: num)
        if first == nil || last == nil {
            return nil
        } else {
            let count:Int = last! - first! + 1
            return count
        }
    }
    
    func searchFirstOfK(arr:[Int],num:Int) -> Int? {
        var low:Int = 0
        var high:Int = arr.count - 1
        while low <= high {
            let mid:Int = (low + high)/2
            if arr[mid] > num {
                high = mid - 1
            } else if arr[mid] < num {
                low = mid + 1
            } else {
                if  (mid > 0 && arr[mid-1] != num) || mid == 0 {
                    return mid
                } else {
                    high = mid - 1
                }
            }
        }
        return nil
    }
    
    func searchLastOfK(arr:[Int],num:Int) -> Int? {
        var low:Int = 0
        var high:Int = arr.count - 1
        while low <= high {
            let mid:Int = (low + high)/2
            if arr[mid] > num {
                high = mid - 1
            } else if arr[mid] < num {
                low = mid + 1
            } else {
                if  (mid < arr.count - 1 && arr[mid+1] != num) || mid == arr.count - 1 {
                    return mid
                } else {
                    low = mid + 1
                }
            }
        }
        return nil
    }
    
    //在一个已经排序的Int数组中，查找某个number，如果存在这个number，返回在数组的位置，反之返回-1
    func binarySearch(arr:[Int],num:Int) -> Int {
        if arr.count == 0 {
            return -1
        }
        
        var low:Int = 0
        var high:Int = arr.count - 1
        
        while low <= high {
            let mid:Int = (low + high) / 2
            
            if num < arr[mid] {
                high = mid - 1
            } else if (num > arr[mid]) {
                low = mid + 1
            } else {
                return mid
            }
        }
        return -1
        
    }
}
