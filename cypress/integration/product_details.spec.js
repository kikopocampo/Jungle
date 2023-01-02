describe("Navigation", () => {

it("Should visit home page", () => {
  cy.visit("/");
});

it("Should navigate to product detail page and back", () => {
  cy.get(".products article").contains('Giant Tea')
    .click()
  cy.contains("p", "The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks.")

  cy.get(".navbar-brand").contains("Jungle")
    .click()
  
  cy.get("span").contains("Giant Tea")
  cy.contains("h3", "Sold Out")

});

});