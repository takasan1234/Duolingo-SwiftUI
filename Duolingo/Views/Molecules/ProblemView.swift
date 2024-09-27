//
//  ProblemView.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/26.
//

import SwiftUI

struct ProblemView: View {
    @Binding var currentPage: Int
    var currentProblem: Problem?
    var body: some View {
        VStack{
            if let problem = currentProblem {
                Spacer()
                Text(currentProblem?.word_sets[0].meaning ?? "問題はありません。リリースをお待ちください。")
                    .font(.title)
                Spacer()
                VStack {
                    let wordSets = problem.word_sets
                    ForEach(wordSets.indices, id: \.self) { index in
                        SelectionForProblem(wordsIndex: index, word_set: wordSets[index], currentPage: $currentPage)
                    }
                }
                .padding()
            }
            
        }
    }
}

//#Preview {
//    @State var number = 1
//    ProblemView(currentPage: $number)
//}
