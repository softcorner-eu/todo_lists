// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require select2-full
//= require_tree .


$(document).on('turbolinks:load', function() {
    $('select').select2({
    allowClear: true,
    theme: "bootstrap",
    tags: true
    });
});

$(document).on("click", "[data-action='add-tag']", function(e) {
    e.preventDefault();
    const $this = $(this)
    const $tagFields = $this.parent()
    const $tagField = $this.nextAll('.form-group')
    const destTagField = $tagField.first().clone();
    destTagField.find('input').each(function(index, elt){
        ['name', 'id'].forEach(function(attr) {
            $(elt).attr(attr, $(elt).attr(attr).replace(/\[\d+\]/, $tagField.length)).val('');
        });
    });
    $tagFields.append(destTagField);
});

$(document).on("click", "[data-action='remove-tag']", function(e) {
    e.preventDefault();
    $(this).closest("[data-div='tag-group']").remove();
});