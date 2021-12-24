// Copyright © 2021 USAMI Kosuke

import AVKit
import GroupActivities
import UIKit

class MainViewController: UIViewController {
    private var player: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        listenForGroupSession()
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let playerViewController = segue.destination as? AVPlayerViewController {
            player = AVPlayer(url: MovieSample.url)
            playerViewController.player = player
        }
    }

    @IBAction func playButtonTouchUpInside(_: UIButton) {
        playButtonTapped()
    }

    private func playButtonTapped() {
        let activity = MovieWatchingActivity()
        Task {
            switch await activity.prepareForActivation() {
            case .activationPreferred:
                _ = try await activity.activate()
            default:
                break
            }
        }
    }

    private func listenForGroupSession() {
        Task {
            for await session in MovieWatchingActivity.sessions() {
                player.playbackCoordinator.coordinateWithSession(session)
                session.join()
            }
        }
    }
}
