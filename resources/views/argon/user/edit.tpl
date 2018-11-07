





{include file='user/newui_header.tpl'}



  <main class="profile-page">
    <section class="section-profile-cover section-shaped my-0">
      <div class="shape shape-style-1 shape-default shape-skew alpha-4">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </section>
    <section class="section section-skew">
      <div class="container">
        <div class="card card-profile shadow mt--300">
          <div class="px-4">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2" >
              </div> 
              <div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
                <div class="card-profile-actions py-4 mt-lg-0">
                  <a href="/user" class="btn btn-sm btn-primary">用户中心</a>
                  <a href="/user/shop" class="btn btn-sm btn-default float-right">商店</a>
                </div>
              </div>
              <div class="col-lg-4 order-lg-1">
                <div class="card-profile-stats d-flex justify-content-center">
                  <div>
                    <span class="heading">{$user->money}</span>
                    <span class="description">剩余金币</span>
                  </div>
                  <div>
                    <span class="heading">L{$user->class}</span>
                    <span class="description">等级</span>
                  </div>
                  <div>
                    <span class="heading">{$user->online_ip_count()}</span>
                    <span class="description">在线设备数</span>
                  </div>
                </div>
              </div>
            </div>
			
						
						
			        <div class="row row-grid justify-content-between align-items-center mt-lg">
						<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">Telegram 绑定</p>
										<p>Telegram 添加机器人账号 <a href="https://t.me/{$telegram_bot}">@{$telegram_bot}</a>，拍下下面这张二维码发给它。</p>
										<div class="form-group form-group-label">
											<div class="text-center">
												<div id="telegram-qr"></div>
												{if $user->telegram_id != 0}当前绑定：<a href="https://t.me/{$user->im_value}">@{$user->im_value}</a>{/if}
											</div>
										</div>
									<a class="btn btn-primary mt-4" href="/user/telegram_reset" >&nbsp;解绑</a>
                  </div>
                </div>
            </div>						
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">账号登录密码修改</p>
									<div class="form-group form-group-label">
											<label class="floating-label" for="oldpwd">当前密码</label>
											<input class="form-control" id="oldpwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="pwd">新密码</label>
											<input class="form-control" id="pwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="repwd">确认新密码</label>
											<input class="form-control" id="repwd" type="password">
										</div>
								<button class="btn btn-primary mt-4" id="pwd-update" >&nbsp;提交</button>
                  </div>
                </div>
            </div>
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">节点连接密码修改</p>
										<p>当前连接密码：<code id="ajax-user-passwd">{$user->passwd}</code></p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="sspwd">新连接密码</label>
											<input class="form-control" id="sspwd" type="text">
										</div>
								<button class="btn btn-primary mt-4" id="ss-pwd-update"  >&nbsp;提交</button>
                  </div>
                </div>
            </div>	
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">联络方式修改</p>
										<p>当前联络方式：
										<code id="ajax-im">
										{if $user->im_type==1}
										微信
										{/if}

										{if $user->im_type==2}
										QQ
										{/if}

										{if $user->im_type==3}
										Google+
										{/if}

										{if $user->im_type==4}
										Telegram
										{/if}
										{$user->im_value}
										</code>
										</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="imtype">选择您的联络方式</label>
											<select class="form-control" id="imtype">
												<option></option>
												<option value="1">微信</option>
												<option value="2">QQ</option>
												<option value="3">Google+</option>
												<option value="4">Telegram</option>
											</select>
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="wechat">在这输入联络方式账号</label>
											<input class="form-control" id="wechat" type="text">
										</div>

								<button class="btn btn-primary mt-4" id="wechat-update">&nbsp;提交</button>
                  </div>
                </div>
            </div>

			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">加密方式修改</p>
										<p>注意：SS 和 SSR 支持的加密方式有所不同，请根据实际情况来进行选择！</p>
										<p>当前加密方式：<code>{$user->method}</code></p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="method">加密方式</label>
											<select id="method" class="form-control">
												{$method_list = $config_service->getSupportParam('method')}
												{foreach $method_list as $method}
													<option value="{$method}" {if $user->method == $method}selected="selected"{/if}>[{if URL::CanMethodConnect($method) == 2}SS{else}SS/SSR{/if} 可连接] {$method}</option>
												{/foreach}
											</select>
										</div>
								<button class="btn btn-primary mt-4" id="method-update">&nbsp;提交</button>
                  </div>
                </div>
            </div>		
			
			
			
						{if $config['port_price']>=0 || $config['port_price_specify']>=0}
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
									{if $config['port_price']>=0}
									<div class="card-inner">
										<p class="card-heading">重置端口</p>
										<p>对号码不满意？来摇号吧～！</p>
										<p>随机更换一个端口使用，价格：<code>{$config['port_price']}</code>元/次</p>
										<p>重置后1分钟内生效</p>
										<p>当前端口：<code id="ajax-user-port">{$user->port}</code></p>
									</div>
											<button class="btn btn-primary mt-4" id="portreset" >&nbsp;摇号</button>
									{/if}
									{if $config['port_price_specify']>=0}
									<div class="card-inner">
										<p class="card-heading">钦定端口</p>
										<p>不想摇号？来钦定端口吧～！</p>
										<p>价格：<code>{$config['port_price_specify']}</code>元/次</p>
										<p>端口范围：<code>{$config['min_port']}～{$config['max_port']}</code></p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="port-specify">在这输入想钦定的号</label>
											<input class="form-control" id="port-specify" type="num">
										</div>
									</div>
									<button class="btn btn-primary mt-4" id="portreset" >&nbsp;摇号</button>
									{/if}
                  </div>
                </div>
            </div>	
			
						{/if}
			
				<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">主题修改</p>
										<p>当前主题：{$user->theme}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="theme">主题</label>
											<select id="theme" class="form-control">
												{foreach $themes as $theme}
													<option value="{$theme}">{$theme}</option>
												{/foreach}
											</select>
										</div>
								<button class="btn btn-primary mt-4"  id="theme-update">&nbsp;提交</button>
                  </div>
                </div>
            </div>	
			
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">自定义ACL/PAC/Surge</p>
										<p>您可以在此处追加 Gfwlist 规则。</p>
										<p>格式参看<a href="https://adblockplus.org/zh_CN/filters">https://adblockplus.org/zh_CN/filters</a></p>
										<p>IP 段请使用 |127.0.0.0/8 类似格式表示</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="pac">规则书写区</label>
											<textarea class="form-control" id="pac" rows="8">{$user->pac}</textarea>
										</div>
								<button class="btn btn-primary mt-4" id="setpac">&nbsp;提交</button>
                  </div>
                </div>
            </div>	
			
			<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
									<div class="card-inner">
										<p class="card-heading">协议&混淆设置</p>
										<p>当前协议：{$user->protocol}</p>
										<p>注意1：如果需要兼容原版SS请选择带_compatible的兼容选项！</p>
										<p>注意2：如果您使用原版 SS 客户端此处请直接设置为 origin！</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="protocol">协议</label>
											<select id="protocol" class="form-control">
												{$protocol_list = $config_service->getSupportParam('protocol')}
												{foreach $protocol_list as $protocol}
													<option value="{$protocol}" {if $user->protocol == $protocol}selected="selected"{/if}>[{if URL::CanProtocolConnect($protocol) == 3}SS/SSR{else}SSR{/if} 可连接] {$protocol}</option>
												{/foreach}
											</select>
										</div>

									</div>

									<div class="card-inner">
										<p>当前混淆方式：{$user->obfs}</p>
										<p>注意1：如果需要兼容原版SS请选择带_compatible的兼容选项！</p>
										<p>注意2：SS 和 SSR 支持的混淆类型有所不同，simple_obfs_* 为原版 SS 的混淆方式，其他为 SSR 的混淆方式！</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="obfs">混淆方式</label>
											<select id="obfs" class="form-control">
												{$obfs_list = $config_service->getSupportParam('obfs')}
												{foreach $obfs_list as $obfs}
													<option value="{$obfs}" {if $user->obfs == $obfs}selected="selected"{/if}>[{if URL::CanObfsConnect($obfs) >= 3}SS/SSR{else}{if URL::CanObfsConnect($obfs) == 1}SSR{else}SS{/if}{/if} 可连接] {$obfs}</option>
												{/foreach}
											</select>
										</div>
									</div>

									<div class="card-inner">
										<p>当前混淆参数：<code id="ajax-user-obfs-param">{$user->obfs_param}</code></p>
										<p>注意：如果需要兼容原版SS请留空！</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="obs-param">在这输入混淆参数</label>
											<input class="form-control" id="obfs-param" type="text">
										</div>
									</div>

								<button class="btn btn-primary mt-4"id="ssr-update">&nbsp;提交</button>
                  </div>
                </div>
            </div>
			
				<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
										<p class="card-heading">每日邮件接收设置</p>
										<p>当前设置：{if $user->sendDailyMail==1} 发送 {else} 不发送 {/if}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="mail">发送设置</label>
											<select id="mail" class="form-control">
												<option value="1">发送</option>
												<option value="0">不发送</option>
											</select>
										</div>
								<button class="btn btn-primary mt-4"   id="mail-update">&nbsp;提交</button>
                  </div>
                </div>
            </div>	
        </div>
						
						
          </div>
        </div>
      </div>
      
    </section>
    

	
	
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}


<script>
$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板。");
});
</script>

<script>
    $(document).ready(function () {
        $("#portreset").click(function () {
            $.ajax({
                type: "POST",
                url: "resetport",
                dataType: "json",
                data: {

                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                      	$("#ajax-user-port").html(data.msg);
						$("#msg").html("设置成功，新端口是"+data.msg);
						
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#portspecify").click(function () {
            $.ajax({
                type: "POST",
                url: "specifyport",
                dataType: "json",
                data: {
					port: $("#port-specify").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"出现了一些错误。");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#setpac").click(function () {
            $.ajax({
                type: "POST",
                url: "pacset",
                dataType: "json",
                data: {
                   pac: $("#pac").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
<script>
	var ga_qrcode = '{$user->getGAurl()}';
	jQuery('#ga-qr').qrcode({
		"text": ga_qrcode
	});

	{if $config['enable_telegram'] == 'true'}
	var telegram_qrcode = 'mod://bind/{$bind_token}';
	jQuery('#telegram-qr').qrcode({
		"text": telegram_qrcode
	});
	{/if}
</script>


<script>
    $(document).ready(function () {
        $("#wechat-update").click(function () {
            $.ajax({
                type: "POST",
                url: "wechat",
                dataType: "json",
                data: {
                    wechat: $("#wechat").val(),
					imtype: $("#imtype").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#ajax-im").html($("#imtype").find("option:selected").text()+" "+$("#wechat").val());
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ssr-update").click(function () {
            $.ajax({
                type: "POST",
                url: "ssr",
                dataType: "json",
                data: {
                    protocol: $("#protocol").val(),
					obfs: $("#obfs").val(),
					obfs_param: $("#obfs-param").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#ajax-user-obfs-param").html($("#obfs-param").val());
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#relay-update").click(function () {
            $.ajax({
                type: "POST",
                url: "relay",
                dataType: "json",
                data: {
                    relay_enable: $("#relay_enable").val(),
					relay_info: $("#relay_info").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#unblock").click(function () {
            $.ajax({
                type: "POST",
                url: "unblock",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#ajax-block").html("IP: "+data.msg+" 没有被封");
						$("#msg").html("发送解封命令解封 "+data.msg+" 成功");
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-test").click(function () {
            $.ajax({
                type: "POST",
                url: "gacheck",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-set").click(function () {
            $.ajax({
                type: "POST",
                url: "gaset",
                dataType: "json",
                data: {
                    enable: $("#ga-enable").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#ajax-user-passwd").html($("#sspwd").val());
						$("#msg").html("成功了");
                    } else {
                        $("#result").modal();
						$("#msg").html("失败了");
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#mail-update").click(function () {
            $.ajax({
                type: "POST",
                url: "mail",
                dataType: "json",
                data: {
                    mail: $("#mail").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#theme-update").click(function () {
            $.ajax({
                type: "POST",
                url: "theme",
                dataType: "json",
                data: {
                    theme: $("#theme").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href='/user/edit'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>



<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("成功了");
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
