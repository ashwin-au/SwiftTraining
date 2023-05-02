//
//  ExpandableView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 02/05/23.
//

import SwiftUI

struct ExpandableView: View {
    @State var isExpandable = false
    var body: some View {
        VStack {
            CardView(foregroundColor: .white, backgroundColor: .gray.opacity(0.5), padding: 16, stroke: .clear) {
                VStack {
                    HeaderView(isExpandable: $isExpandable)
                    if isExpandable {
                        DetailView()
                    }
                    
                }
            }.cornerRadius(8)
            Spacer()
        }.padding(.horizontal, 20)
    }
}

struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView()
    }
}

struct HeaderView: View {
    @Binding var isExpandable: Bool
    var angle: Double {
        return isExpandable ? 180 : 0
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle")
            Spacer()
            Text("Dummy name")
            Spacer()

            Button(action: {
                withAnimation(.spring()) {
                    self.isExpandable.toggle()
                }

            }, label: {
                Image(systemName: "chevron.up")
                    .rotationEffect(.degrees(angle))
            })

        }.padding(8)
    }
}

struct DetailView: View {
    @State var name = ""
    @State var address = ""
    @State var sex: Sex = .others
    @State var course: Course = .computerScience
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $name)
                TextField("Address", text: $address)

                Picker(selection: $sex, label: HStack {
                    Image(systemName: "person.fill")
                    Text("Gender")
                }) {
                    ForEach(Sex.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }

                Picker("Course", selection: $course) {
                    ForEach(Course.allCases, id: \.self) {
                        Text($0.rawValue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.pickerStyle(.navigationLink)
            }
        }
    }
}
