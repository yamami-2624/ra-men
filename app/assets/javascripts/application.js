// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
class @CurrentLocations
  @getCurrentLocation: ->
    $('.currentLocation').on 'click', ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition(successGetPosition, failGetPosition, options)
      else
        message = 'ご使用中のブラウザは現在地検索に対応されておりません。'
        Alert.set('warning', message)

  successGetPosition = (position) ->
    window.location.href = "/shops/searches?latitude=#{position.coords.latitude}&longitude=#{position.coords.longitude}"

  options =
    enableHighAccuracy: true

  failGetPosition = (error) ->
    switch error.code
      when 1
        message = '位置情報の提供を許可してください。'
      when 2
        message = '位置情報の取得に失敗しました。'
    Alert.set('warning', message)
