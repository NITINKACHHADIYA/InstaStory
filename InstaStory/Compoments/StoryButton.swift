//
//  StoryButton.swift
//  InstaStory
//
//  Created by Nitin Kachhadiya on 30/05/21.
//

import UIKit


@IBDesignable
final class StoryButton: UIButton {

    private static let kLayerNameGradientBorder = "GradientBorderLayer"
    private var gradient = CAGradientLayer()
    private let shape = CAShapeLayer()
    private let animation = CABasicAnimation(keyPath: "strokeEnd")
    var borderColors:[UIColor] = [UIColor.blue, UIColor.green]
    var isAnimated = false
    
    @IBInspectable var borderWidth: CGFloat {
        didSet {
//            self.layer.borderWidth = borderWidth
        }
    }
    
    override init(frame: CGRect){
        self.borderWidth = 0;
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        self.borderWidth = 0;
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.gardientBorderWith(borderColors: borderColors);
    }
        
    private func gradientBorderLayer() -> CAGradientLayer? {
        let borderLayers = layer.sublayers?.filter { return $0.name == StoryButton.kLayerNameGradientBorder }
        if borderLayers?.count ?? 0 > 1 {
            fatalError()
        }
        return borderLayers?.first as? CAGradientLayer
    }
        
    func gardientBorderWith(borderColors: [UIColor]) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        self.imageView?.clipsToBounds = true
        self.imageView?.layer.cornerRadius = self.frame.size.width/2

        let existingBorder = gradientBorderLayer()
        if existingBorder != nil {
            gradient = existingBorder!
        }
        
        shape.lineWidth = borderWidth
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.path = circlePath().cgPath

        gradient.frame =  CGRect(origin: .zero, size: self.frame.size)
        gradient.colors = borderColors.map({ return $0.cgColor })
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.mask = shape
        
        let exists = (existingBorder != nil)
        if !exists {
            layer.addSublayer(gradient)
        }
        
        if self.isAnimated {
            
            shape.lineDashPattern = [2, 2];
            animation.fromValue = CGFloat(0.0)
            animation.toValue = CGFloat(1.0)
            animation.speed = 0.1
            animation.autoreverses = false
            animation.repeatCount = .infinity
            animation.fillMode = CAMediaTimingFillMode.forwards
            shape.add(animation, forKey: "circleAnimation");
        } else {
            
            shape.lineDashPattern = [];
            shape.removeAllAnimations()
        }
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: self.bounds);
    }
}
