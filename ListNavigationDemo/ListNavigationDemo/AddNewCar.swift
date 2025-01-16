//
//  AddNewCar.swift
//  ListNavigationDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

struct AddNewCar: View {
    var carStore: CarStore
    @Binding var path: NavigationPath
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var isHybrid: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }
                .padding()
            }
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: description,
                         isHybrid: isHybrid,
                         imageName: "tesla_medel_3")
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

//
//#Preview {
//    AddNewCar()
//}
