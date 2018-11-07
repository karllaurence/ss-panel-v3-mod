{include file='newui_header.tpl'}
  <main>
    <section class="section section-shaped section-lg my-0">
      <div class="shape shape-style-1 bg-gradient-default">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="container pt-lg-md">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="card bg-secondary shadow border-0">
              <div class="card-body px-lg-5 py-lg-5">
                <div class="text-center text-muted mb-4">
                  <small>注册账号</small>
                </div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                      </div>
                      <input class="form-control" placeholder="昵称" type="text" id="name" >
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                      </div>
					  <input class="form-control" id="email" type="text" placeholder="邮箱" >
                    </div>
                  </div>
					{if $enable_email_verify == 'true'}
                  <div class="form-group">
                    <div class="input-group input-group-alternative mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-key-25"></i></span>
                      </div>
                      <input class="form-control" placeholder="邮箱验证码" id="email_code" type="text">
                    </div>
							<button id="email_verify" class="btn btn-primary mt-4">获取验证码</button>
                  </div>
                {/if}
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="密码" id="passwd" type="password">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="重复密码" id="repasswd" type="password">
                    </div>
                  </div>							                       
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-key-25"></i></span>
                      </div>
                      <input class="form-control" placeholder="邀请码{if $enable_invite_code == 'false'}(没有就不填){/if}" id="code" type="text">
                    </div>{if $enable_invite_code == 'true'}
							<button id="view_code" data-toggle="modal" data-target="#reg_code" class="btn btn-primary mt-4">查看公共邀请码</button>
                    {/if}
                  </div>
				  
							{if $geetest_html != null}
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<div id="embed-captcha"></div>
													</div>
												</div>
											</div>
										{/if}
						
                <div class="custom-control custom-control-alternative custom-checkbox">
                    <input class="custom-control-input" id="legal" name="legal" type="checkbox"> 
                    <label class="custom-control-label" for="legal">
                      <span>我已阅读<a href="/legal" target="_blank">《服务条款》</a>和<a href="/legal/privacy" target="_blank">《隐私条款》</a>，并且保证所录入信息的真实性(如有不实信息会导致账号被删除)</span>
                    </label>
                  </div>
                  <div class="custom-control custom-control-alternative custom-checkbox">
                    <input class="custom-control-input" id="oneclick_theme" name="oneclick_theme" type="checkbox"> 
                    <label class="custom-control-label" for="oneclick_theme">
                      <span>我是小白，需要更明了的操作方式</span>
                    </label>
                  </div>
                  <div class="text-center">
						 <button id="tos" type="submit" disabled class="btn btn-primary mt-4">注册</button>
                  </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-6">
                <a href="/auth/login" class="text-light">
                  <small>已经注册？请登录</small>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
	  
						
				<div class="modal fade" id="tos_modal" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
              <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                <div class="modal-content">
                  <div class="modal-body">
						{include file='reg_tos.tpl'}
						</div>
                  <div class="modal-footer">
					<button class="btn btn-primary" data-dismiss="modal" type="button" id="cancel">我不服</button>
					<button class="btn btn-primary" data-dismiss="modal" id="reg" type="button">同意</button>
                  </div>
                </div>
              </div>
            </div>
			<div class="modal fade" id="reg_code" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
              <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
                <div class="modal-content">
                  <div class="modal-body">
											<tbody style="table-layout:fixed;" >
                                          				{foreach $codes as $code}
											<tr>
												<td><a class="copy-text" data-clipboard-text="{$code->code}">{$code->code}</a></td>
											</tr>
                                              <br>
													<button  class="copy-text btn btn-primary mt-4" data-clipboard-text="{$code->code}">复制邀请码</button>
											{/foreach}
                    </tbody>		
						</div>
                </div>
              </div>
            </div>
    </section>
  </main></main>
  
						{include file='newui_dialog.tpl'}
  
						{include file='auth/auth_footer.tpl'}

<script>
    $("#legal").click(function () {
      if($('#legal').is(':checked')) {
      $("#tos").removeAttr("disabled")
      }else{
      $('#tos').attr("disabled",true);
      }
      });
  $(function(){
	new Clipboard('.copy-text');
});
  $(".copy-text").click(function () {
$("#code").val($(this).parent().parent().find("td:eq(0)").text());
$("#reg_code").modal('hide')
    	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});
    $(document).ready(function(){
        function register(){
			
			document.getElementById("tos").disabled = true; 
			
            $.ajax({
                type:"POST",
                url:"/auth/register",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
					wechat: $("#wechat").val(),
                  	oneclick_theme: $("#oneclick_theme:checked").val(),
					imtype: $("#imtype").val(), 
					code: $("#code").val(){if $enable_email_verify == 'true'},
					emailcode: $("#email_code").val(){/if}{if $geetest_html != null},
					geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode
					{/if}
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        setCookie('code','',0);
                        $("#code").val(getCookie('code'));
						document.getElementById("tos").disabled = false;
						{if $geetest_html != null}
						captcha.refresh();
						{/if}
                    }
                },
                error:function(jqXHR){
						$("#result").modal();
                        $("#msg").html("注册成功");
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                $("#tos_modal").modal();
            }
        });
		
		{if $geetest_html != null}
		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});
		
		
		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});
		
        
		{/if}
		
		$("#reg").click(function(){
            register();
        });
		
		$("#tos").click(function(){
			{if $geetest_html != null}
			if(typeof validate == 'undefined')
			{
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。(少数情况验证码会被广告屏蔽插件拦截，请添加到白名单或禁用插件。)");
				return;
			}
			
			if (!validate) {
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。(少数情况验证码会被广告屏蔽插件拦截，请添加到白名单或禁用插件。)");
				return;
			}
			
			{/if}
            $("#tos_modal").modal();
        });
    })
</script>


{if $enable_email_verify == 'true'}
<script>
var wait=60;
function time(o) {
		if (wait == 0) {
			o.removeAttr("disabled");			
			o.text("获取验证码");
			wait = 60;
		} else {
			o.attr("disabled","disabled");
			o.text("重新发送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			},
			1000)
		}
	}



    $(document).ready(function () {
        $("#email_verify").click(function () {
			time($("#email_verify"));
            $.ajax({
                type: "POST",
                url: "send",
                dataType: "json",
                data: {
                    email: $("#email").val()
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
{/if}

{if $geetest_html != null}
<script>
	var handlerEmbed = function (captchaObj) {
        // 将验证码加到id为captcha的元素里
		
		captchaObj.onSuccess(function () {
		    validate = captchaObj.getValidate();
		});
		
		captchaObj.appendTo("#embed-captcha");

		captcha = captchaObj;
		// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
	
	initGeetest({
		gt: "{$geetest_html->gt}",
		challenge: "{$geetest_html->challenge}",
		product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
		offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
	}, handlerEmbed);
</script>

{/if}
<script>
	{*dumplin：轮子1.js读取url参数*}
	function getQueryVariable(variable)
	{
	       var query = window.location.search.substring(1);
	       var vars = query.split("&");
	       for (var i=0;i<vars.length;i++) {
	            	var pair = vars[i].split("=");
	            	if(pair[0] == variable){
	            		return pair[1];
	            	}
	       }
	       return "";
	}

	{*dumplin:轮子2.js写入cookie*}
	function setCookie(cname,cvalue,exdays)
	{
	  var d = new Date();
	  d.setTime(d.getTime()+(exdays*24*60*60*1000));
	  var expires = "expires="+d.toGMTString();
	  document.cookie = cname + "=" + cvalue + "; " + expires;
	}

	{*dumplin:轮子3.js读取cookie*}
	function getCookie(cname)
	{
	  var name = cname + "=";
	  var ca = document.cookie.split(';');
	  for(var i=0; i<ca.length; i++) 
	  {
	    var c = ca[i].trim();
	    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
	  }
	  return "";
	}

	{*dumplin:读取url参数写入cookie，自动跳转隐藏url邀请码*}
	if (getQueryVariable('code')!=''){
		setCookie('code',getQueryVariable('code'),30);
		window.location.href='/auth/register';
      } 
	

	{*dumplin:读取cookie，自动填入邀请码框*}
	if ((getCookie('code'))!=''){
		$("#code").val(getCookie('code'));
		$("#invite_div").hide();
    }
	

</script>