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
    theme: "bootstrap"
    });
});

$(document).on("click", "[data-action='add-tag']", function(e) {
    e.preventDefault();
    const tagFields = $("[data-div='tag-fields']");
    const tagField = $("[data-div='tag-group']");
    const destTagField = tagField.first().clone();
    destTagField.find("[type='text']").val('');
    destTagField.find("[type='text']").attr('name', `todo_list[tags_attributes][${tagField.length}][name]`);
    destTagField.find("[type='text']").attr('id', `todo_list_tags_attributes_${tagField.length}_name`);
    destTagField.find("[type='hidden']").val('');
    destTagField.find("[type='hidden']").attr('id', `todo_list_tags_attributes_${tagField.length}_id`);
    destTagField.find("[type='hidden']").attr('name', `todo_list[tags_attributes][${tagField.length}][id]`);
    tagFields.append(destTagField);
});

$(document).on("click", "[data-action='remove-tag']", function(e) {
    e.preventDefault();
    $(this).parents("[data-div='tag-group']").remove();
});