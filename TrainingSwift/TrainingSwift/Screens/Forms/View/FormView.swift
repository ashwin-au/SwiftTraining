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
                    TextField("Name", text: $viewModel.studentListener.name)
                    TextField("Address", text: $viewModel.studentListener.address)
                    
                     
                    Picker(selection: $viewModel.studentListener.sex, label: HStack {
                        Image(systemName: "person.fill")
                        Text("Gender")
                    }) {
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
                PrimaryButton(title: "Show Detail", type: .link, isInfinity: false) {
                    viewModel.pushToDetail = true
                }

            }
            .navigationTitle("Student Form")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(isPresented: $viewModel.pushToDetail, destination:  {
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
