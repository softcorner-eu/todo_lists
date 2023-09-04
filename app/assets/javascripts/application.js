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

// $(document).on("turbolinks:load", function() {
//     $("#add-tag").click(function(e) {
//         e.preventDefault();
//         const tagFields = $("#todo_list_tags_attributes").append('<div class="tag-fields"></div>');
//     });
//
// });

$(document).on("turbolinks:load", function () {
    $('#add-tag').click(function(e) {
        e.preventDefault();
        const countTagField = $('.tag-group').length;
        const tagFields = $("#tags_fields")
        const formGroup = $('<div class="form-group tag-group" ></div>');
        const tagField = $(`<input type="text" name="todo_list[tags_attributes][${countTagField}][name]" class="form-control">`);
        const tagLabel = $(`<label for="todo_list_tags_attributes_${countTagField}_name">Tag's name number ${countTagField+1}</label>`)
        const removeLink = $('<a href="#" class="remove-tag">Remove</a>');
        tagFields.append(formGroup);
        formGroup.append(tagLabel);
        formGroup.append(tagField);
        formGroup.append(removeLink);
    });

    $(document).on("click", ".remove-tag", function(e) {
        e.preventDefault();
        $(this).parent().remove();
    });
});