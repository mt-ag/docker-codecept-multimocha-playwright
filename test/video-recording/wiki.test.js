Feature(`Samplet Test`);

Scenario(`Whatsmybrowser`, async ({ I }) => {
  I.amOnPage(`https://www.whatsmybrowser.org/`);
  I.wait(2);
  I.click("#this_id_is_not_a_thing");
  I.saveScreenshot("Webkit_Whatsmybrowser.png");
});
