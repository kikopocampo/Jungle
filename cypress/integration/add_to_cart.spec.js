describe("Cart", () => {

  it("Should visit home page", () => {
    cy.visit("/");
   
  });
  
  it("Should add a product to cart inside the product description", () => {
    cy.contains("My Cart (0)")
    cy.get(".products article").contains('Scented Blade').click()
    cy.get("button").should("have.class", "btn").click({multiple: true, force: true})
    cy.contains("My Cart (1)")
  });

  it("Should add a product to cart on the home page", () => {
    cy.visit("/");
    cy.contains("My Cart (0)")
    cy.get("button").contains("Add").click({force:true})
    cy.contains("My Cart (1)")
  });
  
  });