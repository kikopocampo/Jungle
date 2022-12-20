describe("Navigation", () => {

it("Should visit home page", () => {
  cy.visit("http://localhost:3000/");
});

it("Should navigate to product detail page and back", () => {
  cy.get(".products article").contains("Cliff Collard")
    .click()
  cy.contains("p", "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week. It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red. These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth. They can be brewed as tea. As a defense mechanism the Cliff Collard grows thick thorns. They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.")

  cy.get(".navbar-brand").contains("Jungle")
    .click()
  
  cy.get("span").contains("Giant Tea")
  cy.contains("h3", "Sold Out")

});

});