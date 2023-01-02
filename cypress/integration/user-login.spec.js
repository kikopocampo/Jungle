describe("Cart", () => {

  
  it("Should not log in when wrong credentials are entered", () => {
    cy.visit("http://localhost:3000/");
    cy.contains("Log In").click()
    
    cy.get("[id=email]").type("unknown@gmail.com")
    cy.get("[id=password]").type("1234567")
    cy.get("[name=commit]").click()
    cy.contains('Invalid Email/Password, please try again')
    
  });
 
  it("Should be taken to home page after logging in", () => {
    cy.visit("http://localhost:3000/");
    cy.contains("Log In").click()

    cy.get("[id=email]").type("kikopocampo@gmail.com")
    cy.get("[id=password]").type("bananas")
    cy.get("[name=commit]").click()
    cy.get(".products article").contains("Giant Tea")
    cy.contains("Hello, Francisco")
  });
  
  });