//
//  ViewController.swift
//  13_03_2023_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 27/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createQueues2()
        creationOfQueues()
    }
    
    func creationOfQueues(){
      let queue1 = DispatchQueue(label: "bitcode.queue1")
        queue1.sync{
            for i in 1...3{
                print("queue1 -- i\(i)")
            }
        }
        queue1.sync {
            for j in 1...3{
                print("queue1 -- j\(j)")
            }
        }
        queue1.sync {
            for k in 1...3{
                print("queue1 -- k\(k)")
            }
        }
    }
    
    
    func createQueues2(){
        DispatchQueue.main.async {
            for i in 1...3{
                print("Main thread in async mode -- \(i)")
            }
        }

        let queue2 = DispatchQueue(label: "butcode.in.queue2",qos: DispatchQoS.unspecified,attributes:.concurrent)
        
        queue2.async {
            let task1 = Task (priority :.high){
                for i in 1...3{
                    print("task -- \(i)")
                }
            }
            
            for i in 1...3{
                print("backgroundQueue -- i\(i)")
            }
        }
        
        queue2.async {
            for j in 1...4{
                print("backgroundQueue -- j\(j)")
            }
        }
        
        for i in 10...13{
            print("backgroundQueue -- i\(i)")
        }
    }
}
