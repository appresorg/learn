//
//  ContentView.swift
//  screenModeControl
//
//  Created by GYUYOUNG KANG on 2022/11/04.
//

import SwiftUI

enum ScreenMode : Int {
	case Light = 1
	case Dark = 2
	case Auto = 3
}

struct ContentView: View {
	@State var screenMode: Int = ScreenMode.Auto.rawValue
	
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
			Text("Hello, world!")
			HStack {
				Button("Light") {
					screenMode = ScreenMode.Light.rawValue
				}
				Button("Dark") {
					screenMode = ScreenMode.Dark.rawValue
				}
				Button("Auto") {
					screenMode = ScreenMode.Auto.rawValue
				}
			}
		}
		.padding()
		.onAppear() {
			print(">>> onAppear")
			loadScreenMode()
			updateScreenMode()
		}
		.onChange(of: screenMode, perform: {newValue in
			print(">>> onChange to \(newValue)")
			updateScreenMode()
			saveScreenMode()
		})
	}
	func updateScreenMode() {
		switch(screenMode) {
			case ScreenMode.Light.rawValue:
				print(">>> Set to Light")
				NSApp.appearance = NSAppearance(named: .aqua)
				break
			case ScreenMode.Dark.rawValue:
				print(">>> Set to Dark")
				NSApp.appearance = NSAppearance(named: .darkAqua)
				break
			default:
				print(">>> Set to Auto")
				NSApp.appearance = nil
				break;
		}
	}
	func saveScreenMode() {
		UserDefaults.standard.set(screenMode, forKey: "screenMode")
		UserDefaults.standard.synchronize()
	}
	func loadScreenMode() {
		if (UserDefaults.standard.object(forKey: "screenMode") != nil) {
			screenMode = UserDefaults.standard.integer(forKey: "screenMode")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
