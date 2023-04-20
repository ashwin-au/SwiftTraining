//
//  FormViewModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import Foundation

class FormViewModel: ObservableObject {
    @Published var studentListener: Student
    @Published var studentList = [Student]()
    @Published var currentIndex = Int()
    @Published var pushToDetail = false
    init() {
        studentListener = Student(name: "", address: "", course: .computerScience, sex: .others)
    }

    func initList() {
        studentListener = Student(name: "", address: "", course: .computerScience, sex: .others)
    }
    
    func save() {
        studentList.append(studentListener)
    }
}
