import SwiftUI

struct TaskTextView: View {
    var taskText: String

    @Binding var isActive: Bool

    @State private var textSize: CGSize = .init()

    var body: some View {
        ZStack {
            ChildSizeReader(size: $textSize) {
                Text(taskText)
                    .font(Font.custom("iAWriterQuattroS-Regular", size: 18))
                    .lineLimit(nil)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isActive.toggle()
                        }
                    }
            }

            Rectangle()
                .foregroundColor(.black)
                .frame(width: isActive ? textSize.width : 0, height: 2, alignment: .center)
                .padding(.top, 3)
        }
    }
}

struct TaskTextView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { TaskTextView(taskText: getMockListCellViewData().item.task!, isActive: $0) }
    }
}
