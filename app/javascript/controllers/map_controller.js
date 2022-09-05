import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    //marker: Object,
    activityMarkers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addActivityMarkersToMap()
    this.#fitMapToActivityMarkers()
  }

  #addActivityMarkersToMap() {
    this.activityMarkersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToActivityMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.activityMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
