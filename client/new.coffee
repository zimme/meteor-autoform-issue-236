AutoForm.hooks
    insertProfileForm:
        onSuccess: (operation, result, template) ->
            FlashMessages.sendSuccess 'Profile added.'
            Router.go 'editProfile', _id: result
    updateProfileForm:
        onSuccess: (operation, result, template) ->
            FlashMessages.sendSuccess 'Profile changed.'
