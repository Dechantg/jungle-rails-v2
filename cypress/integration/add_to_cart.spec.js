

it("Confirm user can click on product link", () => {
  cy.visit("/");

  cy.get('nav').then(($nav) => {
    cy.get('.nav-link:contains("My Cart (0)")');

    cy.wrap($nav).invoke('css', 'z-index', '-1');
    cy.get('button.btn').then(($button) => {
      cy.wrap($button).click();

      cy.get('.nav-link:contains("My Cart (1)")');
    });
  });

});