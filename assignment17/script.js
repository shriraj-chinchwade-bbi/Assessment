// script.js
const searchButton = document.getElementById("search-button");
const searchInput = document.getElementById("search");
const countryContainer = document.getElementById("countries");

searchButton.addEventListener("click", () => {
  const countryName = searchInput.value.trim();
  if (countryName !== "") {
    fetchCountryData(countryName);
  }
});

async function fetchCountryData(countryName) {
  try {
    const response = await fetch(
      `https://restcountries.com/v3.1/name/${countryName}`
    );
    const data = await response.json();
    const country = data[0];

    const countryCard = document.createElement("div");
    countryCard.classList.add("country-card");

    countryCard.innerHTML = `
<img src="${country.flags.png}" alt="${country.name.common}">
<p>Country: ${country.name.common}</p>
<p>Capital: ${country.capital}</p>
<p>Population: ${country.population}</p>
<p>Region: ${country.region}</p>
`;

    countryContainer.innerHTML = "";
    countryContainer.appendChild(countryCard);
  } catch (error) {
    console.error("Error fetching country data:", error);
  }
}
