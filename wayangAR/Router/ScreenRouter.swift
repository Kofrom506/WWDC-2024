
import Foundation
import SwiftUI

enum ScreenRoute: ScreenProtocol {
    case home
    case onBoarding
    case wayangView
    case arView
    case selectView
    
    var embedInNavView: Bool {
        switch self {
        case .home:
            return true
        case .onBoarding, .selectView, .wayangView, .arView:
            return false
       
        }
    }
}

class ScreenRouterFactory: RouterFactory {
    @ViewBuilder func makeBody(for screen: ScreenRoute) -> some View {
        switch screen {
        case .home:
            HomeView()
        case .arView:
            ARViewContainer(modelConfirmedForPlacement: .constant(""))
        case .wayangView:
            WayangView()
        case .onBoarding:
            OnboardingView()
        case .selectView:
            SelectView()
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
