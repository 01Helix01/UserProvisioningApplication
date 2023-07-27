function applyDatePicker(id) {
    $(`#${id}`).datepicker({
        dateFormat: 'yy-mm-dd',
        changeYear: true,
        yearRange: "c-10:c+22",
        defaultDate: new Date()
    });
}

