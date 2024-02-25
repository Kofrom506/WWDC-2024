
import Foundation
import SwiftUI

enum ScreenRoute: ScreenProtocol {
    case home
    case onBoardingSemar
    case onBoardingPetruk
    case wayangViewSemar
    case wayangViewPetruk

    case selectView
    
    
    var embedInNavView: Bool {
        switch self {
        case .home:
            return true
        case .onBoardingSemar, .selectView, .wayangViewSemar,.wayangViewPetruk, .onBoardingPetruk:
            return false
       
        }
    }
}

class ScreenRouterFactory: RouterFactory {
    @ViewBuilder func makeBody(for screen: ScreenRoute) -> some View {
        switch screen {
        case .home:
            HomeView()
       
        case .wayangViewPetruk:
            WayangViewPetruk()
        case .onBoardingSemar:
            OnboardingViewSemar()
        case .onBoardingPetruk:
            OnboardingViewPetruk()
        case .selectView:
            SelectView()
        case .wayangViewSemar:
            WayangViewSemar()
        }
        
    }
}

typealias ScreenRouter = Router<ScreenRoute, ScreenRouterFactory>

struct MainView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        screenRouter.start()
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
