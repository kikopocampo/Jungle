describe("Home", () => {

  it("Should visit home page", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  });