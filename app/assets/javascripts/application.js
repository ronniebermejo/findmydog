// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular.min
//= require mm-foundation-tpls-0.2.2.min
//= require angular-resource.min
//= require_tree .
//= require foundation
//= require underscore
//= require gmaps/google


$(document).foundation();
$(function(){ $(document).foundation(); });

handler = Gmaps.build('Google');
handler.buildMap({
    internal: {id: 'map'},
    provider: {
        zoom:      12,
        center:    new google.maps.LatLng( 20.6144226, -100.4057373),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
}, function(){
    markers = handler.addMarkers([
        {
            "lat": 20.6144226,
            "lng": -100.4057373,
            "infowindow": "hello!"
        },
        {
            "lat": 20.6244226,
            "lng": -100.4157373,
            "picture": {
                "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
                "width":  36,
                "height": 36
            },
            "infowindow": "hello!"
        },
        {
            "lat": 20.6644226,
            "lng": -100.4177373,
            "infowindow": "hello!"
        },
        {
            "lat": 20.6244226,
            "lng": -100.4177373,
            "infowindow": "hello!"
        },
        {
            "lat": 20.6844226,
            "lng": -100.4187373,
            "infowindow": "hello!"
        },
        {
            "lat": 20.6654226,
            "lng": -100.4177973,
            "infowindow": "hello!"
        }

    ]);
    handler.bounds.extendWith(markers);
   // handler.fitMapToBounds();
});


