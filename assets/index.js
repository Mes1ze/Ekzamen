document.addEventListener("DOMContentLoaded", () => {
    scroll();
    openPopup();
    closePopup();
    //  authorization();
    showPassword();
    let phoneInput = reg_popup.querySelector('input[type="tel"]');
    phoneInput.addEventListener("input", function () {
        phoneMask(this);
    });
});

const body = document.body ?? document.documentElement;
// Шапка
const header = document.querySelector("header");
function scroll() {
    window.addEventListener("scroll", () => {
        if (window.scrollY > 100) {
            header.classList.add("scroll");
        } else {
            header.classList.remove("scroll");
        }
    });
}

// Попапы
const reg_popup = document.querySelector(".registration-popup"),
    autho_popup = document.querySelector(".authorization-popup"),
    //  succes_popup = document.querySelector(".success-popup"),
    reg_btn_open = header.querySelector(".reg-btn"),
    reg_btn_close = reg_popup.querySelector(".popup-close"),
    autho_btn_open = header.querySelector(".autho-btn"),
    autho_btn_close = autho_popup.querySelector(".popup-close"),
    //  succes_btn_close = succes_popup.querySelector(".popup-close"),
    autho_btn = autho_popup.querySelector(".authorization-btn");

function openPopup() {
    reg_btn_open.addEventListener("click", () => {
        body.style.overflow = "hidden";
        reg_popup.classList.add("open");
    });
    autho_btn_open.addEventListener("click", () => {
        body.style.overflow = "hidden";
        autho_popup.classList.add("open");
    });
}
function closePopup() {
    reg_btn_close.addEventListener("click", () => {
        body.style.overflow = "auto";
        reg_popup.classList.remove("open");
    });
    autho_btn_close.addEventListener("click", () => {
        body.style.overflow = "auto";
        autho_popup.classList.remove("open");
    });
    //  succes_btn_close.addEventListener("click", () => {
    //      body.style.overflow = "auto";
    //      succes_popup.classList.remove("open");
    //  });
}

const user = {
    login: "",
    password: "",
};

function authorization() {
    autho_btn.addEventListener("click", (e) => {
        e.preventDefault();
        let login = autho_popup.querySelector('input[name="Login"]').value;
        let password = autho_popup.querySelector(
            'input[name="Password"]'
        ).value;
        if (login != "" || password != "") {
            body.style.overflow = "hidden";
            succes_popup.classList.add("open");

            user.login = login;
            user.password = password;

            console.log(user);
        }
    });
}
function phoneMask(input) {
    var phoneNumber = input.value.replace(/\D/g, "");

    var formattedPhoneNumber = "";
    if (phoneNumber.length > 0) {
        formattedPhoneNumber = "+7";
    }
    if (phoneNumber.length > 1) {
        formattedPhoneNumber += " (" + phoneNumber.substring(1, 4);
    }
    if (phoneNumber.length > 4) {
        formattedPhoneNumber += ") " + phoneNumber.substring(4, 7);
    }
    if (phoneNumber.length > 7) {
        formattedPhoneNumber += "-" + phoneNumber.substring(7, 9);
    }
    if (phoneNumber.length > 9) {
        formattedPhoneNumber += "-" + phoneNumber.substring(9, 11);
    }

    input.value = formattedPhoneNumber;
}

function showPassword() {
    const block = autho_popup.querySelector(".authorization-form-block.pwd");
    const input = block.querySelector("input");
    const btn = block.querySelector(".show-password");
    btn.addEventListener("mousedown", () => {
        input.type = "text";
    });
    btn.addEventListener("mouseup", () => {
        input.type = "password";
    });
}
