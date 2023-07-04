//
//  TableView.swift
//  MyWayOrNoWay
//
//  Created by Akshay Nandane on 05/07/23.
//

import SwiftUI

struct TableView: View {
    @StateObject var viewModel = ViewModel()
    @State private var isErrorShown = false
    
    var body: some View {
        NavigationView(content: {
            VStack {
                if viewModel.responseData.isEmpty {
                    VStack(content: {
                        Button(action: {
                            isErrorShown = true
                        }, label: {
                            Text("Click to Refresh")
                        })
                    })
                } else {
                    List(viewModel.responseData, id: \.id) { user in
                        VStack(alignment: .leading, content: {
                            HStack(content: {
                                Text(String(user.id!))
                                    .font(.footnote)
                                
                                Text(user.title!)
                                    .font(.callout)
                            })
                            Spacer()
                            Text(user.body!)
                                .font(.caption)
                            Divider()
                        })
                    }
                }
            }
            .navigationBarTitle("Users Data")
            .onAppear(perform: {
                print("")
                viewModel.fetchData(url: "", completion: { success in
                    if success {
                        print("VC - Success")
                        isErrorShown = true
                    } else {
                        print("VC - Failure")
                        isErrorShown = false
                    }
                })
            }
            )
        })
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
