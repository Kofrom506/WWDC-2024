//
//  OnBoardingData.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let listPetruk: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "petruk-1", primaryText: "Meet Petruk, the Jester of Wayang", secondaryText: "Petruk, a prominent character in Javanese wayang kulit, is a charming and humorous figure. His misadventures and wit have made him a beloved character in Indonesian folklore."),
        OnboardingData(id: 1, objectImage: "petruk-2", primaryText: "Unraveling Petruk's Origins", secondaryText: "Petruk's roots trace back to ancient Javanese mythology, where he emerged as a comedic presence in wayang kulit shadow puppetry. His character brings laughter and joy to audiences."),
        OnboardingData(id: 2, objectImage: "petruk-3", primaryText: "Petruk's Unique Role", secondaryText: "In wayang kulit performances, Petruk serves as a jester and comic relief. His humorous antics provide a delightful contrast to the more serious characters, adding a touch of mirth to the storytelling."),
        OnboardingData(id: 3, objectImage: "petruk-4", primaryText: "Symbolism of Petruk's Traits", secondaryText: "Petruk's character embodies wit, resilience, and a zest for life. His comedic nature symbolizes the balance of laughter in the face of adversity, making him a unique and cherished figure"),
        OnboardingData(id: 4, objectImage: "petruk-5", primaryText: "Step into Petruk's World", secondaryText: "Welcome to the enchanting world of Petruk! Immerse yourself in his timeless tales, witness his playful antics, and embark on a journey filled with laughter and cultural richness."),
       
 
    ]
    static let listSemar: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "semar-1", primaryText: "Meet Semar, the Wise Father of Wayang", secondaryText: "Semar, an iconic figure in Javanese wayang kulit, holds a special place as the wise and nurturing father figure. Join us as we unravel the timeless tales of Semar."),
        OnboardingData(id: 1, objectImage: "semar-2", primaryText: "Tracing Semar's Mythical Roots", secondaryText: "Semar's origins intertwine with ancient Javanese mythology, where he emerged as a symbol of wisdom, guidance, and compassion. His character transcends time, captivating audiences with his timeless wisdom."),
        OnboardingData(id: 2, objectImage: "semar-3", primaryText: "Semar's Archetypal Significance", secondaryText: "In the world of wayang kulit, Semar represents the archetypal father figure. His character embodies kindness, humility, and unwavering support, contributing to the moral fabric of traditional wayang tales."),
        OnboardingData(id: 3, objectImage: "semar-4", primaryText: "Symbolism of Semar's Attributes", secondaryText: "Semar's character is laden with symbolic significance. His benevolence, humor, and sage-like wisdom serve as a beacon of light, guiding audiences through the moral landscapes of wayang narratives."),
       
        OnboardingData(id: 4, objectImage: "semar-5", primaryText: "Embrace the Wisdom of Semar", secondaryText: "Step into the world of Semar! Immerse yourself in the timeless wisdom of this revered character. Join us on a journey that celebrates the enduring legacy of Semar and the cultural richness he brings."),
       
    ]
}
