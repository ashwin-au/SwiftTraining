//
//  FormModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import SwiftUI

struct Student: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var course: Course
    var sex: Sex
}

enum Sex: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case others = "Others"
}

enum Course: String, CaseIterable {
    case computerScience = "Computer Science Engineering"
    case electricalEngineering = "Electrical and Electronics Engineering"
    case electronicsEngineering = "Electronics Engineering"
    case mechanicalEngineering = "Mechanical Engineering"
}
