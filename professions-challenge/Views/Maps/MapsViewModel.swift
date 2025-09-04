import Foundation
import CoreLocation
import LocationFormatter
import GoogleMaps

class MapsViewModel: NSObject, ObservableObject, GMSMapViewDelegate {
    @Published var cameraPositionLatitude: Double = 0
    @Published var cameraPositionLongitude: Double = 0
    @Published var utmString: String = ""
    @Published var mapView: GMSMapView!
    @Published var camera = GMSCameraPosition.camera(withTarget: .init(latitude: 0, longitude: 0), zoom: 15.0)

    private var locationManager: LocationViewModel = .init()
    private var formatter: LocationCoordinateFormatter!

    override init() {
        super.init()
        
        formatter = LocationCoordinateFormatter()
        formatter.format = .utm
        
        mapView = GMSMapView(frame: .zero, camera: camera)
        mapView.mapType = .hybrid
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
    }

    func updateCurrentLocation() {
        self.cameraPositionLatitude = locationManager.latitude
        self.cameraPositionLongitude = locationManager.longitude
        camera = GMSCameraPosition.camera(withTarget: .init(latitude: self.cameraPositionLatitude, longitude: self.cameraPositionLongitude), zoom:camera.zoom)
    }

    func updateUTMCoordinates() {
        self.cameraPositionLatitude = camera.target.latitude
        self.cameraPositionLongitude = camera.target.longitude
        self.utmString = self.formatter.string(from: CLLocationCoordinate2D(latitude: self.cameraPositionLatitude, longitude: self.cameraPositionLongitude)) ?? "lá ele"
        print(self.utmString)
    }

    // GMSMapViewDelegate
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        camera = position
        updateUTMCoordinates()
    }
}
