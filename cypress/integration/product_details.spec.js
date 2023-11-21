

it("Confirm user can click on product link", () => {
  cy.visit("/");
  cy.get('article').then(($article) => {
    cy.wrap($article).first('a').then(($link) => {
      const productPath = $link.attr('href');
      cy.wrap($link).then((link) => console.log(link));
      cy.wrap($link).find('img').click();


     
    });
  });

});