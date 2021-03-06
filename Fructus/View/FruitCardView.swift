//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

struct FruitCardView: View {
  // MARK: - PROPERTIES
  
  var fruit: Fruit
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        // FRUIT: IMAGE
        Image(fruit.image)
          .resizable()
          .scaledToFit()
            .shadow(color: Color.blue, radius: 25, x: 15, y: 8)
          .scaleEffect(isAnimating ? 1.0 : 0.8)
        
        // FRUIT: TITLE
        Text(fruit.title)
          .foregroundColor(Color.black)
          .font(.largeTitle)
          .fontWeight(.light)
          .shadow(color: Color(red: 0, green: 0, blue: 5, opacity: 1), radius: 20, x: 6, y: 5)
        
        // FRUIT: HEADLINE
        Text(fruit.headline)
          .foregroundColor(Color.yellow)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)
        
        // BUTTON: START
        StartButtonView()
      } //: VSTACK
    } //: ZSTACK
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

// MARK: - PREVIEW

struct FruitCardView_Previews: PreviewProvider {
  static var previews: some View {
    FruitCardView(fruit: fruitsData[1])
        .previewDevice("iPhone 11 Pro Max")
  }
}
