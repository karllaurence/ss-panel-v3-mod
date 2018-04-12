<?php

namespace App\Controllers;

class PayConfig{

    public $pay_config;

    public function init()
    {
        $this->pay_config = [
            "secret" => "0D466104745A6B52E778243F92CA3468",
            "accesskey" => "FFADFA09ACA9CC23A80653056AE8683B",
            "notify_url" => "/yft/notify",
            "return_url" => "/user/code",
            "type" => "aliPay"
        ];
    }
}