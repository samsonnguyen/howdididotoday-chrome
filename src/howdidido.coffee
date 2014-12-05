send_data_to_host = (details) ->
    console.log(details.url)

chrome.webNavigation.onCompleted.addListener(send_data_to_host)