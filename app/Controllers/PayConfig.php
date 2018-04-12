<?php

namespace App\Controllers;

class PayConfig{

    public $pay_config;

    public function init()
    {
        $this->pay_config = [
            "secret" => "3CD38461C5BFE4B4892DA44871B26B2F",
            "accesskey" => "5E06F95DCD08AF6916826225C33F6E31",
            "notify_url" => "/yft/notify",
            "return_url" => "/user/code",
            "type" => "aliPay"
        ];
    }
}