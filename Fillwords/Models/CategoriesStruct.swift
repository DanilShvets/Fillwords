//
//  CategoriesStruct.swift
//  Fillwords
//
//  Created by Данил Швец on 07.05.2023.
//

import UIKit

struct CategoriesStruct {
    let image: UIImage
    let titleText: String
    
    private var index: Int
    
    init(index: Int){
        self.index = index
        switch index {
        case 0:
            image = UIImage(named: "brain")!
            titleText = "КЛАССИКА"
        case 1:
            image = UIImage(named: "literature")!
            titleText = "ЛИТЕРАТУРА"
        case 2:
            image = UIImage(named: "starwars")!
            titleText = "ЗВЕЗДНЫЕ ВОЙНЫ"
        case 3:
            image = UIImage(named: "memes")!
            titleText = "МЕМЫ"
        default:
            image = UIImage()
            titleText = ""
        }
    }
}
