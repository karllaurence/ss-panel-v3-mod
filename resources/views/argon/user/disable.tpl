





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
			{if $user->enable=="0"}
			<div class="col-lg">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">										
							<p>由于某种原因，您的账户 <code>{$user->user_name}</code> 已被禁用</p>
							<p>您的ID编号：<code>{$user->id}</code></p>
                  </div>
                </div>
            </div>		
			{/if}
            </div>
	<div class="row row-grid justify-content-between align-items-center mt-lg">		
			<div class="col-lg">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">										
									<p>什么情况会被禁用？</p>
									<p>1. 0级帐户超过15天没签到会被禁用，请定期签到</p>
									<p>2. 0级帐户超过90天没连接节点使用会被禁用，请定期连接使用</p>
									<p>3. 严重违反相关用户协议，请阅读<a target="_blank" href="{$config["baseUrl"]}/legal">用户协议</a></p>
									<p>{$ssr_sub_token}</p>
									{if $user->enable=="0"}
									<button id="unlock" class="btn btn-primary mt-4">&nbsp;解除禁用</button>
									{/if}
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
    $(document).ready(function () {
        $("#unlock").click(function () {
		
		
		
            $.ajax({
                type: "POST",
                url: "disable",
                dataType: "json",
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                        window.setTimeout("location.href='/'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (data) {
                        $("#result").modal();
						$("#msg").html("成功解禁");
						window.setTimeout("location.href='/user'", {$config['jump_delay']});
                }
            })
			
			
			
        })
    })
</script>

