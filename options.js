// Saves options to chrome.storage
function save_options() {
    var email = document.getElementById('email-input').value;
    var apiToken = document.getElementById('api-token-input').value;
    chrome.storage.sync.set({
        email: email,
        apiToken: apiToken
    }, function () {
        // Update status to let user know options were saved.
        var status = document.getElementById('status');
        status.textContent = 'Options saved.';
        setTimeout(function () {
            status.textContent = '';
        }, 750);
    });
}

// Restores select box and checkbox state using the preferences
// stored in chrome.storage.
function restore_options() {

    chrome.storage.sync.get({
        email: '',
        apiToken: ''
    }, function (items) {
        document.getElementById('email-input').value = items.email;
        document.getElementById('api-token-input').value = items.apiToken;
    });
}
document.addEventListener('DOMContentLoaded', restore_options);
document.getElementById('save').addEventListener('click',
    save_options);