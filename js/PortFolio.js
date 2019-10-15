// window.onload = carousel(1);

var counter = 0;
var imageSrc = [];
var txtSrc = [];
for (var i = 1; i <= 4; i++) {
    if (i == 4) {
        imageSrc[3] = "../img/car" + i + ".jpg";
    } else {
        imageSrc[i - 1] = "../img/car" + i + ".png";
    }
    txtSrc[i - 1] = "txtId" + i;
}
imgBox = document.getElementById("SlideBox");

function setDisplay(n) {
    imgBox.setAttribute("src", imageSrc[n]);
    activeText = document.getElementById(txtSrc[n]);
    activeText.style.display = "block";
}




function nxtImg() {
    activeText = document.getElementById(txtSrc[counter]);
    activeText.style.display = "none"
    if (counter < 3) {
        counter++;
    } else {
        counter = 0;
    };
    setDisplay(counter);
}

function prevImg() {
    activeText = document.getElementById(txtSrc[counter]);
    activeText.style.display = "none"
    if (counter > 0) {
        counter--
    } else {
        counter = 3;
    };
    setDisplay(counter);

}

setDisplay(counter);