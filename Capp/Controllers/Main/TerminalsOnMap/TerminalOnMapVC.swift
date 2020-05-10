//
//  TerminalOnMapVC.swift
//  Capp
//
//  Created by tannaz on 2/16/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import GoogleMaps
import UIKit
import MapKit
class TerminalOnMapVC: LocationBaseVC {
    
    var coordinate = CLLocationCoordinate2D(latitude: Globals.shared.selectedTerminal.latitude, longitude: Globals.shared.selectedTerminal.longitude)
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var lblTerminalAddress: UILabel!
    @IBOutlet weak var lblTerminalName: UILabel!
    @IBAction func btnDirectionToTerminalPressed(_ sender: Any) {
       // openMaps(latitude: 27.296670, longitude: 56.336901)
    }
    override func viewDidLoad() {
        lblTerminalName.text = Globals.shared.selectedTerminal.name
        lblTerminalAddress.text = Globals.shared.selectedTerminal.address
        title = "TerminalDetails".text
        mapView.delegate = self
        mapView.camera = GMSCameraPosition(target: coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.selectedMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: Globals.shared.selectedTerminal.latitude, longitude: Globals.shared.selectedTerminal.longitude))
        
        DispatchQueue.main.async
            {
                // 2. Perform UI Operations.
                let position = CLLocationCoordinate2DMake(Globals.shared.selectedTerminal.latitude,Globals.shared.selectedTerminal.longitude)
                let marker = GMSMarker(position: position)
               // marker.iconView
                marker.title = Globals.shared.selectedTerminal.name
                marker.map = self.mapView
        }
    }
    
    func openMaps(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let googleMapsInstalled = UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)
        if googleMapsInstalled {
            UIApplication.shared.open(URL(string: "comgooglemaps-x-callback://" +
                "?daddr=\(latitude),\(longitude)&directionsmode=bicycling&zoom=17")!)
        } else {
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.openInMaps(launchOptions: nil)
        }
    }
}
// MARK: - CLLocationManagerDelegate
extension TerminalOnMapVC: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        selectedRestaurant  = -1
//        clusterItems()
//        if !restaurantInfoCollectionView.isHidden {
//            restaurantInfoCollectionView.isHidden = true
//            moveLocationButton()
//        }
//        activeMarker        = nil
//        updateInfo()
    }
    
    // MARK: - GMUMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        if let poiItem = marker.userData as? MyClusterItem {
//            selectedRestaurant = Int(poiItem.index)
//            clusterItems()
//            updateInfo()
//            let newCamera = GMSCameraPosition.camera(withTarget: marker.position,
//                                                     zoom: mapView.camera.zoom)
//            let update = GMSCameraUpdate.setCamera(newCamera)
//            mapView.animate(with: update)
//        } else {
//            // zoom on cluster
//            let newCamera = GMSCameraPosition.camera(withTarget: marker.position,
//                                                     zoom: mapView.camera.zoom + 1)
//            let update = GMSCameraUpdate.setCamera(newCamera)
//            mapView.animate(with: update)
//        }
        return true
    }
    
}

