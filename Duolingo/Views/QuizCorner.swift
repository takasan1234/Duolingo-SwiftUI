import SwiftUI

struct QuizCorner: View {
    var section_num: Int = 1
    var unit_num: Int = 1
    var component_num: Int = 1
    @State private var hasAppeared = false  // 初めて表示されたかどうかを管理

    @State private var currentProblemIndex: Int = 0
    @State private var currentProblem: Problem? = nil
    @State private var problems: [Problem?] = []
    @State private var words = ["bird", "red", "hello"]
    @State private var colorSet = [Color(.white), Color(.white), Color(.white)]
    @State private var wordsIndex = 0
    @State private var currentPage: Int = 1
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        VStack{
            Text("\(currentPage)")
            ProblemView(currentPage: $currentPage, currentProblem: currentProblem)
                .onAppear {
                    if !hasAppeared {
                        networkManager.fetchProblemsData(sectionNum: section_num, unitNum: unit_num, componentNum: component_num)
                        problems = networkManager.problems
                    }
                    print("quizCorner")
                }
                .onReceive(networkManager.$problems, perform: { problems in
                    if !problems.isEmpty {
                        currentProblem = problems[currentPage]
                    }
                })
                .onChange(of: currentPage) { oldValue, newValue in
                    if !problems.isEmpty {
                        currentProblem = problems[newValue]
                        print(currentProblem)
                        print("current")
                    }
                    print("onchange")
                }
        }
    }
}


#Preview {
    QuizCorner()
}
