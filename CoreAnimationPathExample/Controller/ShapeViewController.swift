import UIKit

enum Shape {

    case triangle, rect

    var path : CGPath {
        switch self {
            case .triangle:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 120, y: 60))
                path.addLine(to: CGPoint(x: 120, y: 60))
                path.addLine(to: CGPoint(x: 0, y: 120))
                path.addLine(to: CGPoint(x: 0, y: 0))
                return path.cgPath
            case .rect:
                return UIBezierPath(rect: CGRect(x: 0, y: 0, width: 120, height: 120)).cgPath
        }
    }

}

class ShapeViewController: UIViewController {

    let shapeLayer = CAShapeLayer()

    var shape = Shape.triangle

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        shapeLayer.path = shape.path

        view.layer.addSublayer(shapeLayer)

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTap)))

        self.view = view
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let layerSize = CGSize(width: 100, height: 100)
        var layerOrigin = self.view.center
        layerOrigin.x -= layerSize.width / 2
        layerOrigin.y -= layerSize.height / 2
        shapeLayer.frame = CGRect(origin: layerOrigin, size: layerSize)
    }

    @objc func onTap() {

        self.shape = self.shape == .rect ? .triangle : .rect

        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        animation.duration = 0.15
        animation.fromValue = self.shapeLayer.path
        animation.toValue = self.shape.path
        self.shapeLayer.add(animation, forKey: "LayerPath")

        self.shapeLayer.path = self.shape.path

    }

}
