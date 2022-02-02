import SwiftUI

struct Delete: ViewModifier {
    let action: () -> Void
    
    @State private var offset: CGSize = .zero
    @State private var initialOffset: CGSize = .zero
    @State private var contentWidth: CGFloat = 0.0
    @State private var willDeleteIfReleased = false
    @State private var isVisible: Bool = false
   
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .font(.title2.bold())
                            .layoutPriority(-1)
                            .offset(x: 20)
                    }.frame(width: -offset.width)
                        .offset(x: geometry.size.width)
                        .onAppear {
                            contentWidth = geometry.size.width
                        }
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    delete()
                                }
                        )
                        .opacity(isVisible ? 1 : 0)
                }
            )
            .offset(x: offset.width, y: 0)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        isVisible = true
                        if gesture.translation.width + initialOffset.width <= 0 {
                            self.offset.width = gesture.translation.width + initialOffset.width
                        }
                        if self.offset.width < -deletionDistance, !willDeleteIfReleased {
                            hapticFeedback()
                            willDeleteIfReleased.toggle()
                        } else if offset.width > -deletionDistance, willDeleteIfReleased {
                            hapticFeedback()
                            willDeleteIfReleased.toggle()
                        }
                    }
                    .onEnded { _ in
                        if offset.width < -deletionDistance {
                            isVisible = false
                            delete()
                        } else if offset.width < -halfDeletionDistance {
                            isVisible = true
                            offset.width = -tappableDeletionWidth
                            initialOffset.width = -tappableDeletionWidth
                        } else {
                            isVisible = false
                            offset = .zero
                            initialOffset = .zero
                        }
                    }
            )
            .animation(.interactiveSpring())
    }
    
    private func delete() {
        offset.width = -contentWidth
        action()
        offset.width = 0
    }
    
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    let deletionDistance = CGFloat(200)
    let halfDeletionDistance = CGFloat(50)
    let tappableDeletionWidth = CGFloat(100)
}

extension View {
    func onDelete(perform action: @escaping () -> Void) -> some View {
        modifier(Delete(action: action))
    }
}
