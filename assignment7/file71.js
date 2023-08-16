const data = [
  {
    type: "div",
    children: [
      { type: "h1", children: [{ type: "p", text: "abtc" }] },
      {
        type: "ul",
        children: [
          { type: "li", text: "item 1" },
          { type: "li", text: "item 2" },
        ],
      },
    ],
  },
];
const abc = document.getElementById("abc");
function createElement(type) {
  return document.createElement(type);
}
function renderData(data, abc) {
  for (const elementData of data) {
    const element = createElement(elementData.type);

    abc.appendChild(element);

    // console.log(`${elementData.type}`);
    if (elementData.text) {
      element.textContent = elementData.text;
    }

    if (elementData.children) {
      renderData(elementData.children, element);
    }
  }
}
renderData(data, abc);
