//
//  ContentView.swift
//  viewDidLoad
//
//  Created by GYUYOUNG KANG on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
		.onViewDidLoad {
			print(">>> viewDidLoad")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
