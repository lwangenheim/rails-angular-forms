angular.module('Form').controller 'FormCtrl', 
  class FormCtrl

    $inject:['$scope', '$http']

    constructor: (@$scope, @$http) ->

    index: 0 

    previous: () -> 
      @index -= 1
      @page()

    next: () ->
      @index += 1
      @page()

    page: ->
      @template = @templates[@index]

    loadTemplates: ->
      @$http.get('/forms/templates').success (data) =>
        @templates = data
        @page()
