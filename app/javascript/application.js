// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function getCoordinates() {
  const ticketId = window.location.pathname.split('/').slice(-1)[0];

  let xhr = new XMLHttpRequest();

  let url =`/api/v1/tickets/${ticketId}`;

  xhr.open("GET", url);

  xhr.send();

  xhr.onload = () => {
    initMap(data);
  }
};
function initMap(ticket) {
  console.log(ticket);
  const { coordinates } = ticket;
  const polygonCoordinates = coordinates.map(coord => {
    return {
      lat: parseFloat(coord[0]),
      lng: parseFloat(coord[1]),
    }
  })
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 5,
    center: polygonCoordinates[0],
    mapTypeId: "terrain",
  });
  const polygonFigre = new google.maps.Polygon({
    paths: polygonCoordinates,
    strokeColor:  "#1393D1",
    strokeOpacity: 0.8,
    strokeWeight: 3,
    fillColor: " #1393D1",
    fillOpacity: 0.35,
  });
  polygonFigre.setMap(map);
}
window.getCoordinates = getCoordinates;
