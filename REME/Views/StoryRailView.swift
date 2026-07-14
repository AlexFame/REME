import SwiftUI

struct StoryRailView: View {
    private let stories = ["Ты", "Maya", "Alex", "Sasha", "Nika"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Array(stories.enumerated()), id: \.offset) { index, name in
                    VStack(spacing: 7) {
                        ZStack {
                            Circle()
                                .stroke(
                                    index == 0 ? Color.secondary.opacity(0.25) : Color.primary,
                                    lineWidth: 2
                                )
                                .frame(width: 62, height: 62)

                            Circle()
                                .fill(Color.secondary.opacity(0.14))
                                .frame(width: 54, height: 54)
                                .overlay {
                                    Text(String(name.prefix(1)))
                                        .font(.headline)
                                }

                            if index == 0 {
                                Image(systemName: "plus")
                                    .font(.caption.bold())
                                    .padding(5)
                                    .background(Color.primary)
                                    .foregroundStyle(Color(.systemBackground))
                                    .clipShape(Circle())
                                    .offset(x: 22, y: 22)
                            }
                        }

                        Text(name)
                            .font(.caption)
                            .lineLimit(1)
                    }
                    .frame(width: 68)
                }
            }
        }
    }
}
