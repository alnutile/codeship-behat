<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class QueryJsonTest extends TestCase
{
    use DatabaseMigrations, DatabaseTransactions;

    public function setUp()
    {
        parent::setUp();
    }

    /**
     * @test
     */
    public function will_query_json()
    {
        factory(\App\Example::class, 5)->create(
            [
                'data' => [
                    "foo" => "baz",
                    "bar" => "boo",
                ]
            ]
        );


        factory(\App\Example::class)->create([
            'data' => [
                "foo" => "here",
                "bar" => "not-here",
            ]
        ]);
        $results = \App\Example::where("data->foo", "here")->first();
        PHPUnit_Framework_Assert::assertNotNull($results);
    }

}
