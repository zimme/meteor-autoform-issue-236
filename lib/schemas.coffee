@Schemas = Schemas =
    profile: new SimpleSchema
        name:
            label: 'Name'
            type: String

        ssn:
            # Disable valid ssn check because you probably don't know
            # valid swedish ssn's :P
            # custom: ->
            #     if @value
            #         value = @value.replace /\-/, ''
            #         unless Luhn.check value
            #             'ssnNotValid'
            index: 1
            label: 'Swedish Social Security Number'
            min: 11
            max: 11
            regEx: new RegExp '^\\d{6}\\-\\d{4}$'
            type: String
            unique: true

        createdAt:
            autoValue: ->
                if @isInsert
                    new Date
                else if @isUpsert
                    $setOnInsert: new Date
                else
                    @unset()
            denyUpdate: true
            type: Date

        updatedAt:
            autoValue: ->
                if @isUpdate
                    new Date
            denyInsert: true
            optional: true
            type: Date

Schemas.profile.messages
    regEx: 'Wrong format. (YYMMDD-NNNN)'
    ssnNotValid: 'Not a valid [label]'
    notUnique: '[label] already exists'
