//
//  PopupView.swift
//  SaleRetail
//
//  Created by D.Ace on 20/11/24.
//

import SwiftUI

struct PopupView<Content: View>: View {
    let content: Content
    let action: (Action) -> Void
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content, action: @escaping (Action) -> Void = { _ in }) {
        self.content = content()
        self.action = action
        self._isPresented = isPresented
    }

    var body: some View {
        maskView
            .overlay {
                content
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(16)
            }
            .background(BlurView())
    }
    
    var maskView: some View {
        Color.black
            .opacity(0.5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .transition(.opacity)
            .contentShape(Rectangle())
            .onTapGesture {
                isPresented = false
            }
    }
    
    enum Action {
        case onDismiss
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
