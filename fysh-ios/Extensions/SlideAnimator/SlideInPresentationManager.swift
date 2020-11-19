//
//  SlideInPresentationManager.swift
//  fysh-ios
//
//  Created by Jack on 10/11/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit

enum PresentationDirection {
  case left
  case top
  case right
  case bottom
}


class SlideInPresentationManager: NSObject {
    var direction: PresentationDirection = .left


}

// MARK: - UIViewControllerTransitioningDelegate
extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(
      forPresented presented: UIViewController,
      presenting: UIViewController?,
      source: UIViewController
    ) -> UIPresentationController? {
      let presentationController = SlideInPresentationController(
        presentedViewController: presented,
        presenting: presenting,
        direction: direction
      )
      return presentationController
    }
    
    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController,
      source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
      return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }

    func animationController(
      forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
      return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }


}
