<?php

use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\MinkExtension\Context\MinkContext;

/**
 * Defines application features from the specific context.
 */
class UserAuthenticationContext extends MinkContext implements Context, SnippetAcceptingContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {


    }

    /**
     * @Given I visit the login page
     */
    public function iVisitTheLoginPage()
    {
        $this->visit('/login');
    }

    /**
     * @Given I fill in the form with my username and password and submit the form
     */
    public function iFillInTheFormWithMyUsernameAndPasswordAndSubmitTheForm()
    {
        $this->fillField('email', 'foo@foo.com');
        $this->fillField('password', env('EXAMPLE_USER_PASSWORD'));
        $this->pressButton('Login');
    }

}
