let countryData = []; // Global variable to store country data
let exportData = []; // Global variable to store export data
// Function to fetch and store country data
async function fetchCountryData() {
  try {
    const response = await fetch("https://restcountries.com/v3.1/all");
    countryData = await response.json();
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}
// Call the function to fetch and store country data
fetchCountryData();
const searchForm = document.getElementById("search-form");
const searchInput = document.getElementById("search-input");
const searchOption = document.getElementById("search-option");
const countryContainer = document.getElementById("country-container");
const exportButton = document.getElementById("export-json");
searchForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const searchTerm = searchInput.value.trim().toLowerCase();
  const searchType = searchOption.value;
  if (searchTerm === "") {
    return;
  }
  countryContainer.innerHTML = "";
  exportData = []; // Clear previous export data
  let foundCountry = false;
  countryData.forEach((country) => {
    if (
      (searchType === "name" &&
        country.name &&
        country.name.common &&
        country.name.common.toLowerCase().includes(searchTerm)) ||
      (searchType === "currency" &&
        checkCurrency(country.currencies, searchTerm))
    ) {
      displayCountryCard(country);
      exportData.push({
        img: country.flags.png,
        name: country.name.common,
        capital: country.capital,
        population: country.population,
      });
      foundCountry = true;
    }
  });
  if (!foundCountry) {
    displayErrorMessage("Country not found");
  }
});

exportButton.addEventListener("click", () => {
  downloadJSON(exportData);
});
function checkCurrency(currencies, searchTerm) {
  const currencyCodes = Object.keys(currencies);
  return currencyCodes.some((code) => {
    const currency = currencies[code];
    return (
      currency.name.toLowerCase().includes(searchTerm) ||
      (currency.symbol && currency.symbol.toLowerCase().includes(searchTerm))
    );
  });
}
function displayCountryCard(country) {
  const countryCard = document.createElement("div");
  countryCard.classList.add("country-card");
  countryCard.innerHTML = `
<img src="${country.flags.png}" alt="${country.name.common}">
${country.name.common}</h2>
Capital: ${country.capital}</p>
   <p>Population: ${country.population}</p>
  `;
  countryContainer.appendChild(countryCard);
}

function displayErrorMessage(message) {
  const errorMessage = document.createElement("p");
  errorMessage.classList.add("error-message");
  errorMessage.textContent = message;
  countryContainer.appendChild(errorMessage);
}

function downloadJSON(data) {
  if (data.length === 0) {
    console.log("No data to export.");
    return;
  }
  const jsonData = JSON.stringify(data, null, 2);
  const dataStr =
    "data:text/json;charset=utf-8," + encodeURIComponent(jsonData);
  const downloadAnchor = document.createElement("a");
  downloadAnchor.setAttribute("href", dataStr);
  downloadAnchor.setAttribute("download", "country_data.json");
  downloadAnchor.textContent = "Download JSON";
  downloadAnchor.click();
}
