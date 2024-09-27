//
//  ProblemForSelect.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/26.
//

import SwiftUI

struct SelectionForProblem: View {
    var wordsIndex: Int
    var word_set: Vocabulary
    @Binding var currentPage: Int
    
    @State var color = Color(.white)
    var body: some View {
        HStack {
            Spacer()
            Button {
                if wordsIndex == 0 {
                    color = .green
                } else {
                    color = .red
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    currentPage += 1
                }
                print("aaaaaaaaaaaaaaaaaaadsdsds")
            } label: {
                HStack {
                    Spacer()
                    Text(word_set.word)
                        .padding()
                        .frame(minWidth: 0)
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 2)
        )
    }
}

//#Preview {
//    SelectionForProblem(wordsIndex: 1, word_set: Vocabulary(word: "sample", meaning: "サンプル"))
//}
