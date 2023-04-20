//
//  formView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import Foundation
import SwiftUI

struct FormView: View {
    @StateObject var viewModel = FormViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    CustomFormCell(title: "Name", value: $viewModel.studentListener.name)
                    CustomFormCell(title: "Addreess", value: $viewModel.studentListener.address)
                    Picker("Gender", selection: $viewModel.studentListener.sex) {
                        ForEach(Sex.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }

                    Picker("Course", selection: $viewModel.studentListener.course) {
                        ForEach(Course.allCases, id: \.self) {
                            Text($0.rawValue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.pickerStyle(.navigationLink)
                }
                PrimaryButton(title: "Save") {
                    viewModel.save()
                    viewModel.initList()
                }
                PrimaryButton(title: "Show Detail") {
                    viewModel.pushToDetail = true
                }
            }
            .navigationTitle("Student Form")
            .navigationDestination(isPresented: $viewModel.pushToDetail, destination: {
                StudentListView().environmentObject(viewModel)
            })
        }
    }
}

struct formView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

struct CustomFormCell: View {
    var title: String
    @Binding var value: String
    var body: some View {
        HStack {
            TextField(title, text: $value)
        }
    }
}
