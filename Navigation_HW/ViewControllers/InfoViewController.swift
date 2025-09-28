//
//  InfoViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class InfoViewController: UIViewController {

    private var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "ИНФОРМАЦИЯ"
        
        setupUI()
        fetchPlanetData()
    }
    
    private func setupUI() {
        
        titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 0

            self.view.addSubview(titleLabel)

            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            ])

            let alertButton = UIButton(type: .system)
            alertButton.setTitle("ПОКАЗАТЬ", for: .normal)
            alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

            alertButton.translatesAutoresizingMaskIntoConstraints = false

            self.view.addSubview(alertButton)

            NSLayoutConstraint.activate([
                alertButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                alertButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }
    
    func fetchPlanetData() {
        let urlString = "https://swapi.dev/api/planets/1/"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else { return }
//            print("guard по data выполнен")
            do {
                let decoder = JSONDecoder()
                let planet = try decoder.decode(Planet.self, from: data)
                DispatchQueue.main.async {
                    self.titleLabel.text = "Orbital Period: \(planet.orbitalPeriod)"
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    
    //    func fetchData() {
    //        let urlString = "https://jsonplaceholder.typicode.com/todos/1"
    //        guard let url = URL(string: urlString) else { return }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let error = error {
    //                print("Error fetching data: \(error)")
    //                return
    //            }
    //
    //            guard let data = data else { return }
    //
    //            do {
    //                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
    //                   let title = jsonObject["title"] as? String {
    //                    DispatchQueue.main.async {
    //                        self.titleLabel.text = title
    //                    }
    //                }
    //            } catch {
    //                print("Error decoding JSON: \(error)")
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    @objc func showAlert() {
        
        let alertController = UIAlertController(title: "ВНИМАНИЕ", message: "ВЫБЕРИ ДАЛЬНЕЙШЕЕ ДЕЙСТВИЕ", preferredStyle: .alert)
        
        let actionOne = UIAlertAction(title: "Действие 1", style: .default) { _ in
            self.showMessage("Действие 1 запущено")
        }
        
        let actionTwo = UIAlertAction(title: "Действие 2", style: .default) { _ in
            self.showMessage("Действие 2 запущено")
        }
        
        alertController.addAction(actionOne)
        alertController.addAction(actionTwo)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showMessage(_ message: String) {
        
        let messageAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        messageAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(messageAlert, animated: true, completion: nil)
        
    }
}
