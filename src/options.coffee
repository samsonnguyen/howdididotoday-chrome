setStatus = (el, status) -> el.textContent = status

# Saves options to chrome.storage
saveOptions = () ->
  email = $('#email-input').val()
  apiToken = $('#api-token-input').val()
  chrome.storage.sync.set(
    {
      email: email,
      apiToken: apiToken
    }, ->
      # Update status to let user know options were saved.
      statusEl = document.getElementById('status')
      setStatus(statusEl, 'Contents have been saved')
      setTimeout ->
        setStatus(statusEl, '')
      , 1250
  )

#Restores select box and checkbox state using the preferences stored in chrome.storage.
restoreOptions = () ->
  chrome.storage.sync.get(
    {
      email: '',
      apiToken: ''
    }, (items) ->
      $('#email-input').val items.email
      $('#api-token-input').val items.apiToken
  )


document.addEventListener('DOMContentLoaded', restoreOptions);
document.getElementById('save').addEventListener('click', saveOptions);