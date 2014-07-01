Router.map ->
    @route 'newProfile',
        data: ->
            buttonContent: 'Add'
            id: 'insertProfileForm'
            omitFields: 'createdAt,updatedAt'
            type: 'insert'

        onStop: ->
            formId = @data().id
            AutoForm.resetForm formId
        path: 'new'
        template: 'profileForm'

    @route 'editProfile',
        data: ->
            id = @params._id
            profile = Profiles.findOne
                _id: id

            doc: profile
            id: 'updateProfileForm'
            omitFields: 'createdAt,updatedAt'
            type: 'update'
            buttonContent: 'Change'

        onStop: ->
            formId = @data().id
            AutoForm.resetForm formId
        path: ':_id'
        template: 'profileForm'
