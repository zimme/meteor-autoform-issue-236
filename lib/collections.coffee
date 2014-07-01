@Profiles = Profiles = new Meteor.Collection 'profiles'

Meteor.startup ->
    Profiles.attachSchema Schemas.profile

Profiles.allow
    insert: ->
        true
    update: ->
        true
    remove: ->
        true
