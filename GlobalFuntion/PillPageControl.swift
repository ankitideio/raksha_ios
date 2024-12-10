//
//  PillPageControl.swift
//  Raksha
//
//  Created by Ideio Soft on 10/12/24.
//

import Foundation
import UIKit

class PillPageControl: UIView {
    
    private var numberOfPages: Int = 0
    private var currentPage: Int = 0
    private var indicators: [UIView] = []
    
    var selectedColor: UIColor = UIColor.purple
    var unselectedColor: UIColor = .lightGray
    var indicatorHeight: CGFloat = 6.0
    var indicatorSpacing: CGFloat = 6.0

    init(numberOfPages: Int, currentPage: Int) {
        super.init(frame: .zero)
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
        setupIndicators()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupIndicators() {
        for subview in indicators {
            subview.removeFromSuperview()
        }
        
        indicators = []
        
        for index in 0..<numberOfPages {
            let indicator = UIView()
            indicator.layer.cornerRadius = indicatorHeight / 2
            indicator.backgroundColor = index == currentPage ? selectedColor : unselectedColor
            indicator.translatesAutoresizingMaskIntoConstraints = false
            addSubview(indicator)
            indicators.append(indicator)
            
            // Setup the constraints for the pill indicators
            NSLayoutConstraint.activate([
                indicator.heightAnchor.constraint(equalToConstant: indicatorHeight),
                indicator.widthAnchor.constraint(equalToConstant: 15), // Adjust width as needed
                indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            if index == 0 {
                indicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            } else {
                indicator.leadingAnchor.constraint(equalTo: indicators[index - 1].trailingAnchor, constant: indicatorSpacing).isActive = true
            }
            
            if index == numberOfPages - 1 {
                indicator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            }
        }
    }
    
    func setCurrentPage(_ page: Int) {
        guard page >= 0 && page < numberOfPages else { return }
        
        currentPage = page
        
        for (index, indicator) in indicators.enumerated() {
            indicator.backgroundColor = index == currentPage ? selectedColor : unselectedColor
        }
    }
    
    func setNumberOfPages(_ pages: Int) {
        numberOfPages = pages
        setupIndicators()
    }
}
