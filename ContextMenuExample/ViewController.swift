import UIKit

class ViewController: UIViewController {
  
  let jobsImageView: UIImageView = {
    let image = UIImageView(image: #imageLiteral(resourceName: "Jobs"))
    image.contentMode = .scaleAspectFit
    image.isUserInteractionEnabled = true
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(jobsImageView)
    
    let interaction = UIContextMenuInteraction(delegate: self)
    jobsImageView.addInteraction(interaction)
    
    NSLayoutConstraint.activate([
      jobsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      jobsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      jobsImageView.heightAnchor.constraint(equalTo: jobsImageView.widthAnchor),
      jobsImageView.heightAnchor.constraint(equalToConstant: 450)
      ])
  }
}

extension ViewController:  UIContextMenuInteractionDelegate {
  func contextMenuInteraction(
    _ interaction: UIContextMenuInteraction,
    configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
    
    return UIContextMenuConfiguration(identifier: nil,
                                      previewProvider: nil,
                                      actionProvider: { [weak self] _ in
                                        return self?.makeContextMenu()
    })
  }
  
  
  private func makeContextMenu() -> UIMenu {
    let save = UIAction(__title: "Save to camera roll",
                        image: UIImage(systemName: "square.and.arrow.down")) { _ in
                          if let jobsImage = self.jobsImageView.image {
                            UIImageWriteToSavedPhotosAlbum(jobsImage, nil, nil, nil)
                          }
    }
    
    let remove = UIAction(__title: "Remove",
                          image: UIImage(systemName: "trash"),
                          options: .destructive) { _ in
                            self.jobsImageView.isHidden = true
    }
    
    return UIMenu(__title: "Options",
                  image: nil,
                  identifier: nil,
                  children: [save, remove])
  }
  
  
}



