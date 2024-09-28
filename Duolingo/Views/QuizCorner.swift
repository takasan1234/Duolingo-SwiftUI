import SwiftUI

struct QuizCorner: View {
    var section_num: Int = 1
    var unit_num: Int = 1
    var component_num: Int = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var hasAppeared = false  // 初めて表示されたかどうかを管理

    @State private var currentProblemIndex: Int = 0
    @State private var currentProblem: Problem? = nil
    @State private var problems: [Problem?] = []
    @State private var colorSet = [Color(.white), Color(.white), Color(.white)]
    @State private var wordsIndex = 0
    @State private var currentPage: Int = 1
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        VStack{
            Text("\(currentPage)/\(problems.count)")
                .onAppear {
                    if currentPage < problems.count {
                        currentProblem = problems[currentPage]
                    }
                }
            ProblemView(currentPage: $currentPage, currentProblem: currentProblem)
                .onAppear {
                    if !hasAppeared {
                        networkManager.fetchProblemsData(sectionNum: section_num, unitNum: unit_num, componentNum: component_num)
                        
                        print("problems: ")
                        print(problems)
                    }
                    print("quizCorner")
                }
                .onReceive(networkManager.$problems, perform: { input in
                    if !input.isEmpty {
                        problems = input
                        let index = currentPage - 1
                        currentProblem = problems[index]
                    }
                })
                .onChange(of: currentPage) { oldValue, newValue in
                    print(oldValue)
                    print(newValue)
                    if !problems.isEmpty {
                        let index = currentPage - 1
                        if index < problems.count {
                            currentProblem = problems[index]
                        } else {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    print("onchange")
                }
        }
    }
}


#Preview {
    QuizCorner()
}
