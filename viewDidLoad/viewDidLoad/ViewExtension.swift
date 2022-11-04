//
//  ViewExtension.swift
//  viewDidLoad
//
//  Created by GYUYOUNG KANG on 2022/11/04.
//

import Foundation
import SwiftUI

extension View {
	func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
		self.modifier(ViewDidLoadModifier(action: action))
	}
}
