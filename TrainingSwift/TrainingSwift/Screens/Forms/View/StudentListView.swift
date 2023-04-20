//
//  StudentListView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject var viewModel: FormViewModel
    var body: some View {
        List(viewModel.studentList, id: \.self) {
            StudentCell(data: $0)
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
    }
}

struct StudentCell: View {
    var data: Student
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(data.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(data.sex.rawValue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            Text(data.address)
            Text(data.course.rawValue)
        }
    }
}
