//
//  Hanoi.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/6.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Hanoi {
    
    func moveDisk(disks:Int,original:String,destination:String,buffer:String) {
        if disks == 1 {
            print("路径--\(original)→\(destination)")
            return
        }
        
        moveDisk(disks: disks - 1, original: original, destination: buffer, buffer: destination)
        moveDisk(disks: 1, original: original, destination: destination, buffer: buffer)
        moveDisk(disks: disks - 1, original: buffer, destination: destination, buffer: original)
        
    }
    
    
    func moveTopTo(original:Tower,destination:Tower) {
        if original.disks.count == 0 {
            return
        }
        let top:Int = original.disks.last!
        original.disks.removeLast()
        destination.add(n: top)
        print("\(original.name)塔移动到→\(destination.name)")
    }
    
    func moveDisks(disks:Int,original:Tower,destination:Tower,buffer:Tower) {
        if disks == 1 {
            moveTopTo(original: original, destination: destination)
            return
        }
        
        moveDisks(disks: disks - 1, original: original, destination: buffer, buffer: destination)
        moveDisks(disks: 1, original: original, destination: destination, buffer: buffer)
        moveDisks(disks: disks - 1, original: buffer, destination: destination, buffer: original)
        
    }
    
    func move(diskCount:Int) {
        
        var towers:[Tower] = []
        towers.append(Tower(towerName: "A"))
        towers.append(Tower(towerName: "B"))
        towers.append(Tower(towerName: "C"))
        
        let tower:Tower = towers[0]
        for i in (0..<diskCount).reversed() {
            tower.add(n: i)
        }
        
        moveDisks(disks: diskCount, original: towers[0], destination: towers[2], buffer: towers[1])
        
        
        print("FlyElephant--------------")
    }
    
    func move2(diskCount:Int) {
        
        var towers:[Tower] = []
        towers.append(Tower(towerName: "A"))
        towers.append(Tower(towerName: "B"))
        towers.append(Tower(towerName: "C"))
        
        for i in (0..<diskCount).reversed() {
            towers[0].add(n: i)
        }
        
        towers[0].moveDisks(n: diskCount, destination: towers[2], buffer: towers[1])
    }
    
}

class Tower {
    
    var name:String = ""
    var disks:[Int] = []
    
    init(towerName:String) {
        name = towerName
    }
    
    func add(n:Int) {
        if disks.count > 0 {
            let top:Int = disks.last!
            if n >= top {
                return
            }
            disks.append(n)
        } else {
            disks.append(n)
        }
    }
    
    func moveTopTo(tower:Tower) {
        if disks.count == 0 {
            return
        }
        let top:Int = disks.last!
        disks.removeLast()
        tower.add(n: top)
        print("\(self.name)塔移动到→\(tower.name)")
    }
    
    func moveDisks(n:Int,destination:Tower,buffer:Tower) {
        
        if n > 0 {
            moveDisks(n: n - 1, destination: buffer, buffer: destination) // n-1 个盘子移动到缓冲区
            
            moveTopTo(tower: destination)
            
            buffer.moveDisks(n: n - 1, destination: destination, buffer: self) // n-1 个盘子从缓冲区移动到目标区域
        }
    }
    
}
