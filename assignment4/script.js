const first = document.getElementById("F");

const second = document.getElementById("S");

const third = document.getElementById("T");

first.addEventListener("click", function (event) {
  first.style.backgroundColor = "black";

  second.style.backgroundColor = "white";

  third.style.backgroundColor = "white";
});
