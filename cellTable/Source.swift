//
//  Source.swift
//  cellTable
//
//  Created by admin on 17.02.2023.
//

import Foundation
import UIKit


struct Task {
    
    let taskName : String
    let taskDescription : String
    let taskType : String
    //let image : UIImage
}

struct imageName{
    static let person = "person"
    static let fillperson = "person.fill"
    
}


class Source{
    
    var tasks: [Task]
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    static let storage = Source(tasks: [Task]())

}




    
  
    


         
