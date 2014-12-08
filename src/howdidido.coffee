## Define a global namespace to reference Objects
window.HowDidIDoToday = { }

class HowDidIDoToday.Options
    constructor: (callback) ->
        chrome.storage.sync.get(
          {
              email: '',
              apiToken: ''
          },
            (items) =>
                @email = items.email
                @apiToken = items.apiToken
                callback()
        )

    save: (callback) =>
        chrome.storage.sync.set(
          {
              email: @email,
              apiToken: @apiToken
          }, callback
        )

class HowDidIDoToday.OptionsUI
    constructor: () ->
        @restoreOptions()
        document.getElementById('save').addEventListener('click', @saveOptions);

    setStatus: (el, status) ->
        el.textContent = status

    # Saves options to chrome.storage
    saveOptions: () =>
        callback = () =>
            # Update status to let user know options were saved.
            statusEl = document.getElementById('status')
            @setStatus(statusEl, 'Contents have been saved')
            setTimeout =>
                @setStatus(statusEl, '')
            , 1250
        email = $('#email-input').val()
        apiToken = $('#api-token-input').val()
        @options ||= new HowDidIDoToday.Options
        @options.email =  email
        @options.apiToken = apiToken
        @options.save(callback)

    #Restores select box and checkbox state using the preferences stored in chrome.storage.
    restoreOptions: () ->
        @options = new HowDidIDoToday.Options () =>
            console.log @options
            $('#email-input').val @options.email
            $('#api-token-input').val @options.apiToken

class HowDidIDoToday.LogService
    HOWDIDIDOTODAY_URL = 'http://localhost:3000'

    constructor: () ->
        @options = new HowDidIDoToday.Options () =>
            console.log 'HowDidIDoToday logging-service is ready'
            chrome.webNavigation.onCompleted.addListener(@sendDataToHost)

    sendDataToHost: (details) =>
        $.ajax({
            type: "POST"
            url: HOWDIDIDOTODAY_URL + '/api/user_entries.json'
            data: @getData(details)
#            success: success
            dataType: 'json'

            beforeSend: (request) =>
                request.setRequestHeader 'X-Api-Token', @options.apiToken
                request.setRequestHeader 'X-User-Email', @options.email
        });

    getData: (details) ->
        console.log(details.url)
        {"url": details.url}