





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
                  <a href="/user/node" class="btn btn-sm btn-default float-right">节点列表</a>
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
				  
				  
				  
						<h6 class="category">您的邀请链接</h6>
						<h2 class="card-title">
						<p><code>{$config["baseUrl"]}/auth/register?code={$code->code}</code></p>
										<p>剩余可邀请次数：{if $user->invite_num<0}无限{else}<code>{$user->invite_num}</code>{/if}</p>
                    <button  class="copy-text btn btn-primary mt-4"  data-clipboard-text="{$config["baseUrl"]}/auth/register?code={$code->code}">点击复制链接</button>
					
					
					
					
                  </div>
                </div>
            </div>
			
			
			
			
        </div>
			
			
            <div class="mt-5 py-5 text-center">
              <div class="row justify-content-center">
                <div class="col-lg-11">
						{$paybacks->render()}
						<table class="table ">
							<tr>

                             <!--   <th>ID</th> -->
                                <th>ID</th>
								<th>被邀请用户ID</th>
								<th>获得返利</th>
                            </tr>
                            {foreach $paybacks as $payback}
                            <tr>

                          <!--       <td>#{$payback->id}</td> -->
                                <td>{$payback->id}</td>
								<td>{$payback->userid}</td>
								<td>{$payback->ref_get} 元</td>

                            </tr>
                            {/foreach}
                        </table>
						{$paybacks->render()}
                </div>
              </div>
            </div>
			
			
          </div>
        </div>
      </div>
      
    </section>
    

	<div class="modal fade"  id="tx_modal" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">信息确认</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
									<p><font color="red">请在下方输入您的支付宝账户以及真实姓名，我们核实后会将奖励金发送至您账户</font></p>	
									<p><font color="red">我们采集姓名仅做账号核实，不会公开您的信息。详情可见 <a href="{$config["baseUrl"]}/legal/privacy">《隐私策略》</a></font></p>						   
									<div class="form-group form-group-label">
										<label class="floating-label" for="alipay">支付宝账户</label>
										<input class="form-control" id="alipay" type="number"> 
									</div>									
									<div class="form-group form-group-label">
										<label class="floating-label" for="alipayname">真实姓名</label>
										<input class="form-control" id="alipayname" type="text" >
									</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"  id="tx_input" type="button">确定</button>
            </div>
        </div>
    </div>
    </div>
	
	
	
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}

<script>
function txqq() {
	$("#tx_modal").modal();
}
	$(function(){
		new Clipboard('.copy-text');
	});

	$(".copy-text").click(function () {
		$("#result").modal();
		$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
	});
  
    $(document).ready(function () {
        $("#czye").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite_czye",
                dataType: "json",
                success: function (data) {
                    $("#result").modal();
					$("#msg").html(data.msg);
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })  
  
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })    
  $(document).ready(function () {
        $("#tx_input").click(function () {
			$("#tx_modal").modal();
            $.ajax({
                type: "POST",
                url: "/user/invite_txqq",
                dataType: "json",
				data: {
				alipay: $("#alipay").val(),
				alipayname: $("#alipayname").val()
				},
                success: function (data) {
                    $("#result").modal();
					$("#msg").html(data.msg);
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
{include file='table/js_1.tpl'}

$("#buy-invite").click(function () {
    $.ajax({
        type: "POST",
        url: "/user/buy_invite",
        dataType: "json",
        data: {
            num: $("#buy-invite-num").val(),
        },
        success: function (data) {
             if (data.ret) {
     			$("#result").modal();
				$("#msg").html(data.msg);
				window.setTimeout("location.href='/user/invite'", {$config['jump_delay']});
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
});

$(document).ready(function(){
 	{include file='table/js_2.tpl'}
});

</script>