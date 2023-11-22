



it("Confirm user can click on product link", () => {
  cy.visit("/");
  cy.get('article').then(($article) => {

    cy.wrap($article).find('a').first().then(($link) => {

      cy.wrap($link).invoke('attr', 'href').then((href) => {

        cy.wrap($link).find('img').click();

        cy.url().should('include', href);

      });
    });
  });
});