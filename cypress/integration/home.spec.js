


it("There is 2 products on the page", () => {
  cy.visit("/");
  cy.get(".products article").should("be.visible");
});