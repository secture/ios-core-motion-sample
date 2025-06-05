//
//  ContentView.swift
//  Core Motion Sample
//
//  Created by Polina Demidova on 2/6/25.
//

import SwiftUI
import CoreMotion

enum CMMotionActivityType {
    case unknown
    case stationary
    case walking
    case running
    case automotive
    case cycling
}

struct ContentView: View {
    @State private var currentActivity = "Unknown"
    @State private var isTracking = false
    private let motionActivityManager = CMMotionActivityManager()
    
    var body: some View {
        VStack {
            VStack {
                Text("\(getActivityEmoji()) \(currentActivity)")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.primary)
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            Button(action: {
                if isTracking {
                    stopTracking()
                } else {
                    startTracking()
                }
                isTracking.toggle()
            }) {
                Text(isTracking ? "Stop Tracking" : "Start Tracking")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        .onAppear {
            startTracking()
        }
    }
    
    func startTracking() {
        if CMMotionActivityManager.isActivityAvailable() {
            motionActivityManager.startActivityUpdates(to: OperationQueue.main) { activity in
                guard let activity = activity else { return }
                
                if activity.stationary {
                    currentActivity = "Stationary"
                } else if activity.walking {
                    currentActivity = "Walking"
                } else if activity.running {
                    currentActivity = "Running"
                } else if activity.automotive {
                    currentActivity = "Automotive"
                } else if activity.cycling {
                    currentActivity = "Cycling"
                } else {
                    currentActivity = "Unknown"
                }
            }
        }
    }
    
    func stopTracking() {
        motionActivityManager.stopActivityUpdates()
    }
    
    func getActivityEmoji() -> String {
        switch currentActivity {
        case "Walking":
            return "🚶‍♂️"
        case "Running":
            return "🏃‍♂️"
        case "Automotive":
            return "🚗"
        case "Cycling":
            return "🚴‍♂️"
        case "Stationary":
            return "🪑"
        default:
            return "❓"
        }
    }
    
    func queryPastActivities() {
        let startDate = Date().addingTimeInterval(-3600)  // 1 hour ago
        let endDate = Date()
        
        motionActivityManager.queryActivityStarting(from: startDate, to: endDate, to: OperationQueue.main) { activities, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let activities = activities else { return }
            for activity in activities {
                print("Activity: \(activity), Confidence: \(activity.confidence.rawValue)")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
