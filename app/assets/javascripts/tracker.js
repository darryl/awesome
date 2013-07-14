// samples have x position within the tracks div, width, xEnd?, startTime, endTime in seconds

// use jquery ui to make samples draggable 
/// this breaks with turbo links ###
$(document).ready(function() {
    $( ".sample" ).draggable({ axis: "x", 
                               stop: function(event, ui){ 
                                   positionImportage(ui.helper.attr('importageId'), ui.position.left)}})})

var yay = function(selector) {
    // apply the update effect to selector
    $(selector).effect('highlight', 500);
}

var removeImportage = function(importageId) {
$("[importageId="+importageId+']').hide()
}

var addSample = function(sampleId) {
    // each track has a #sample-id id that is the id of the sample
    var yaySelector = '';
    var importageId;

    $.ajax({ 
        async: false,
        url: '/mixes/' + mixId + '/add_sample.json', 
        dataType: 'json', 
        type: 'POST', 
        // processData: false, 
        data: {sample_id: sampleId}, 
        success: function(woot){
            importageId = woot.id;
        }
    })
    var sampleHtml = 
        '<div class="sample ui-widget-content" sampleId="' + sampleId + '" importageId="' + importageId + '">' +
        '<p>' + $('#library tr[sampleId=' + sampleId + '] .name').first().html() +
        '<audio src="' + $('#library tr[sampleId=' + sampleId + '] audio').attr('src') + '"></audio>' +
        '<a rel="nofollow" onclick="removeImportage(' + importageId + '); return false;" ' + 
        'href="/importages/' + importageId + '.json" data-remote="true" data-method="delete">del</a>' +
        '</p>' +
        '</div>';
    // is the track already in the tracks list?
    if ($('#tracks .track[sampleId=' + sampleId + ']').length > 0){
        // add a sample object to that track
        $('#tracks .track[sampleId=' + sampleId + ']').append(sampleHtml);
        yaySelector = '#tracks div[importageId=' + importageId + ']';
    } else {
        // add the sample object to the new track
        var trackHtml = '<div class="track" sampleId="' + sampleId + '">' +
            sampleHtml +
            '</div>';
        // insert a new track at the top of the #tracks list
        $('#tracks').prepend(trackHtml);
        yaySelector = '#tracks:first-child div';
    }
    // make that new sample draggable. might be slow with a lot of samples
    $( ".sample" ).draggable({ axis: "x", 
                               stop: function(event, ui){ 
                                   // alert(ui);
                                   positionImportage(ui.helper.attr('importageId'), ui.position.left)}});
    // yay whatever we just inserted on backend ack
    yay(yaySelector);
    return false;
}

var tPlay = function (startTime){
    var numImports = $('#tracks .sample').length;
    var timeouts = [];
    var xToTimeConst = 10; // time in miliseconds
    // the importages
    var startTimes = [];
    var sounds = [];
    $('#tracks .sample').each( function(idx) {
        startTimes[idx] = this.style.left.slice(0,-2); // '34.223px'.slice(0,-2)
    });
    $('#tracks .sample audio').each( function(idx) {
        sounds[idx] = this;
    });
    for (var i = 0; i < numImports; i++){
        timeouts[i] = setTimeout(
            function(audioEl){audioEl.play();},
            startTimes[i] * xToTimeConst,
            sounds[i]
        );
    }
}

var positionImportage = function (importageId, x){
    // x to time
    var time = xToMsec(x);
    // tell the backend
    $.ajax({
        url: '/importages/' + importageId + '.json',
        type: 'PUT',
        //processData: false,
        data: {'importage[start_time]': time, _method: 'PUT:'},
        // yay on ack
        success: function(result){
            // alert('lol?');
            // alert('#tracks .sample[importageId=' + importageId + ']');
            yay('#tracks .sample[importageId=' + importageId + ']');
        }
    })
}

var xToMsec = function (x){
    var xToTimeConst = 10;
    return(x * xToTimeConst);
}

var MsexToX = function (sec){
    var xToTimeConst = 10;
    return(x / xToTimeConst);
}

var leftToMSeconds = function(left){
    return(xToMsec(left.slice(0,-2)));
}

var calculateTotalLength = function () {
    // greatest end time of all samples is end time
    // update css width? (seconds to total time
}
