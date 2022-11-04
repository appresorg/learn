//
//  ViewDidLoadModifier.swift
//  viewDidLoad
//
//  Created by GYUYOUNG KANG on 2022/11/04.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
	@State private var viewDidLoad = false
	let action: (() -> Void)?
	
	func body(content: Content) -> some View {
		content
			.onAppear {
				if viewDidLoad == false {
					viewDidLoad = true
					action?()
				}
			}
	}
}
