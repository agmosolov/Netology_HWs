    //
    //  MapViewController.swift
    //  Navigation_HW
    //
    //  Created by Александр Мосолов on 29.10.2025.
    //

    import UIKit
    import MapKit
    import CoreLocation


    class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
        
        var mapView: MKMapView!
        let locationManager = CLLocationManager()
        var userLocationAnnotation: MKPointAnnotation?

        
        override func viewDidLoad() {
               super.viewDidLoad()
               
               mapView = MKMapView(frame: self.view.bounds)
               mapView.delegate = self
               view.addSubview(mapView)
               
               locationManager.delegate = self
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.requestWhenInUseAuthorization()
               locationManager.startUpdatingLocation()
               
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(_:)))
               mapView.addGestureRecognizer(tapGesture)
           }

        
        @objc func handleMapTap(_ gestureRecognizer: UITapGestureRecognizer) {
            print("Карта нажата")

            let nonUserLocationAnnotations = mapView.annotations.filter { $0 !== userLocationAnnotation }
            mapView.removeAnnotations(nonUserLocationAnnotations)

            let locationInView = gestureRecognizer.location(in: mapView)
            let tappedCoordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)

            let annotation = MKPointAnnotation()
            annotation.coordinate = tappedCoordinate
            annotation.title = "Целевая точка"
            mapView.addAnnotation(annotation)

            guard let userLocation = locationManager.location else {
                print("Текущее местоположение недоступно")
                return
            }

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation.coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: tappedCoordinate))
            request.transportType = .automobile

            let directions = MKDirections(request: request)
            directions.calculate { [unowned self] response, error in
                if let error = error {
                    print("Ошибка при расчете маршрута: \(error.localizedDescription)")
                    return
                }

                guard let response = response else {
                    print("Ответ отсутствует")
                    return
                }

                mapView.removeOverlays(mapView.overlays)

                for route in response.routes {
                    self.mapView.addOverlay(route.polyline)
                }
            }
        }
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            if let existingAnnotation = userLocationAnnotation {
                mapView.removeAnnotation(existingAnnotation)
            }
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "Ваше местоположение"
            mapView.addAnnotation(annotation)
            
            userLocationAnnotation = annotation
            
            locationManager.stopUpdatingLocation()
        }

        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Ошибка получения местоположения: \(error.localizedDescription)")
        }
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
              if let polyline = overlay as? MKPolyline {
                  let renderer = MKPolylineRenderer(polyline: polyline)
                  renderer.strokeColor = .blue
                  renderer.lineWidth = 4.0
                  return renderer
              }
              return MKOverlayRenderer()
          }
    }
