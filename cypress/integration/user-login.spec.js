describe("Login", () => {

  it("Should be taken to home page after logging in", () => {
    cy.visit("/");
    cy.contains("Log In").click()

    cy.get("[id=email]").type("kikopocampo2@gmail.com")
    cy.get("[id=password]").type("bananas")
    cy.get("[name=commit]").click()
    cy.get(".products article").contains("Giant Tea")
    cy.contains("Hello, Francisco")
  });

  it("Should not log in when wrong credentials are entered", () => {
    cy.visit("/");
    cy.contains("Log In").click()
    
    cy.get("[id=email]").type("unknown@gmail.com")
    cy.get("[id=password]").type("1234567")
    cy.get("[name=commit]").click()
    cy.contains('Invalid Email/Password, please try again')
    
  });

  });

  describe("Sign up", () => {

    beforeEach(() => {
      cy.request('/cypress_rails_reset_state')
    })
  
    it("Should be taken to home page after signing up and is logged in", () => {
      cy.visit("/");
      cy.contains("Sign Up").click()
      cy.get("[id=user_first_name]").type("Kiko")
      cy.get("[id=user_last_name]").type("Ocampo")
      cy.get("[id=user_email]").type("kikopocampo3@gmail.com")
      cy.get("[id=user_password]").type("bananas")
      cy.get("[id=user_password_confirmation]").type("bananas")
      cy.get("[name=commit]").click()
      cy.get(".products article").contains("Giant Tea")
      cy.contains("Hello, Kiko")
    });

    it("Should show an error if an email is already taken", () => {
      cy.visit("/");
      cy.contains("Sign Up").click()
      cy.get("[id=user_first_name]").type("Kiko")
      cy.get("[id=user_last_name]").type("Ocampo")
      cy.get("[id=user_email]").type("kikopocampo2@gmail.com")
      cy.get("[id=user_password]").type("bananas")
      cy.get("[id=user_password_confirmation]").type("bananas")
      cy.get("[name=commit]").click()
      cy.contains("Registration Failed: Email already exists / Incomplete form")
    });

    it("Should show an error not all field are filled", () => {
      cy.visit("/");
      cy.contains("Sign Up").click()
      cy.get("[id=user_first_name]").type("Kiko")
      cy.get("[id=user_password]").type("bananas")
      cy.get("[id=user_password_confirmation]").type("bananas")
      cy.get("[name=commit]").click()
      cy.contains("Registration Failed: Incomplete form")
    });
    
    });