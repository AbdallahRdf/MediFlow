const cancelButtton = document.getElementById("cancelBtn");
const updateButton = document.getElementById("submitBtn");
const form = document.getElementById("form");

updateButton.addEventListener("click", e => {
    e.preventDefault();
    if(updateButton.textContent === "Click to Update your information"){
        updateButton.textContent = "update";
        cancelButtton.classList.remove("hidden");
        const inputs = document.getElementsByTagName("input");
        for(let i = 2; i < inputs.length; i++){
            inputs[i].disabled = false;
            inputs[i].classList.add("focus:ring-2");
        }
    } else {
        form.submit();
    }
});

cancelButtton.addEventListener("click", e => {
    cancelButtton.classList.add("hidden");
    updateButton.textContent = "Click to Update your information";
    const inputs = document.getElementsByTagName("input");
    for(let i = 2; i < inputs.length; i++){
        inputs[i].disabled = true;
        inputs[i].classList.remove("focus:ring-2");
    }
})