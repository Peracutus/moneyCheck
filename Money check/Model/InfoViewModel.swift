//
//  InfoViewModel.swift
//  Money check
//
//  Created by Roman on 04.11.2021.
//

import Foundation
import UIKit

enum InfoViewModel: Int, CustomStringConvertible {
    
    case EmptyFace
    case Start
    case Case
    case Graph
    
    var description: String {
        switch self {
        case .EmptyFace: return "EmptyFace"
        case .Start: return "Start"
        case .Case: return "Case"
        case .Graph: return "Graph"
        }
    }
    
    var image: String {
        switch self {
        case .EmptyFace: return "empty-face"
        case .Start: return "basket"
        case .Case: return "case"
        case .Graph: return "graphic"
        }
    }
    
}
