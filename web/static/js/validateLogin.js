
const form = document.querySelector('form');
const username = document.getElementById('username');
const password = document.getElementById('password');
// Show input error message
function showError(input, message) {
    const formControl = input.parentElement;
    formControl.className = 'form-control error';
    const small = formControl.querySelector('small');
    small.innerText = message;
}

// Show success outline
function showSuccess(input) {
    const formControl = input.parentElement;
    formControl.className = 'form-control success';
    const small = formControl.querySelector('small');
    small.innerText = '';
}

// Check required fields
function checkRequired(inputArr) {
    let isRequired = false;
    inputArr.forEach(function (input) {
        if (input.value.trim() === '') {
            showError(input, `${getFieldName(input)} is required`);
            isRequired = true;
        } else {
            showSuccess(input);
        }
    });

    return isRequired;
}

// Check input length
function checkLength(input, min, max) {
    if (input.value.length < min) {
        showError(
                input,
                `${getFieldName(input)} must be at least ${min} characters`
                );
    } else if (input.value.length > max) {
        showError(
                input,
                `${getFieldName(input)} must be less than ${max} characters`
                );
    } else {
        showSuccess(input);
    }
}

// Get fieldname
function getFieldName(input) {
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

// Event listeners
form.addEventListener('submit', function (e) {
    e.preventDefault();
    if (!checkRequired([username, password])) {
        checkLength(username, 3, 15);
        checkLength(password, 6, 25);
        form.submit();
    } 
});


