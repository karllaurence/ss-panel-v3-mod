
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
			{if $user->money <5}
			  <div class="mt-5 py-5 text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
              <div class="mb-3">
                <small class="text-uppercase font-weight-bold">好像余额不足了哦</small>
              </div>
			  
                    <a  class="btn btn-primary mt-4"  href="/user/code">充值中心</a>
					
                </div>
              </div>
            </div>
			{/if}
			        <div class="row row-grid justify-content-between align-items-center mt-lg">
					
					
					
					
					 {foreach $shops as $shop}
						<div class="col-lg-6" style=" margin-top: 3rem;">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
							<div class="card-main">
								<div class="card-inner">
									<p class="card-heading" >
										{$shop->name}-<code>{$shop->price}</code>金币
									</p>
                                 <a id="buy_button" class="btn btn-sm btn-primary pull-right" href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew},{$shop->auto_reset_bandwidth})">购买</a>
									<p>
										套餐详情<br>
										<code>{$shop->content()}</code>
									</p>
                                {if $shop->auto_renew==0}
										<p><span class="label label-red">
										不能自动续费
										</span></p>
										{else}
										<p><span class="label label-red">
										可选在 {$shop->auto_renew} 天后自动续费
										</span></p>
								{/if}		                                
								{if $shop->auto_reset_bandwidth==0}
										<p><span class="label label-red">
										不可自动重置
										</span></p>
										{else}
										<p><span class="label label-red">
										可自动重置
										</span></p>
								{/if}	
								</div>
							</div>
                  </div>
            </div>				
          </div>
		  
					{/foreach}
						{$shops->render()}
        </div>
       </div>
     </div>
   </div>
    </section>
	
<div class="modal fade"  id="coupon_modal" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">您有优惠码吗？</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
									<div class="form-group form-group-label">
										<label class="floating-label" for="coupon">有的话，请在这里输入。没有的话，直接确定吧</label>
										<input class="form-control" id="coupon" type="text">
									</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"  data-dismiss="modal" id="coupon_input" type="button">确定</button>
            </div>
        </div>
    </div>
    </div>
					
					
					
	<div class="modal fade"  id="order_modal"  tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">订单确认</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
             					<p><font color="red">如您是更换套餐,那剩余流量和有效期将会重置。</font></p>					   
									<p id="name">商品名称：</p>
									<p id="credit">优惠额度：</p>
									<p id="total">总金额：</p>
									
									<div class="checkbox switch" id="autor">       
									<p id="auto_reset">在到期时自动续费</p>
										<label class="custom-toggle">
											<input type="checkbox" id="autorenew" >
											<span class="custom-toggle-slider rounded-circle"></span>
										</label>
									</div>

									
									
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="order_input" type="button">确定</button>
            </div>
        </div>
    </div>
    </div>
					
	<div class="modal fade"  id="tx_modal" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">退订确认</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>是否退订当前套餐</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="delete_input">确定</button>
            </div>
        </div>
    </div>
    </div>
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}



<script>
function buy(id,auto) {
	if(auto==0)
	{
		document.getElementById('autor').style.display="none";
	}
	else
	{
		document.getElementById('autor').style.display="";
	}
	shop=id;
	$("#coupon_modal").modal();
}


$("#coupon_input").click(function () {
		$.ajax({
			type: "POST",
			url: "coupon_check",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop
			},
			success: function (data) {
				if (data.ret) {
					$("#name").html("商品名称："+data.name);
					$("#credit").html("优惠额度："+data.credit);
					$("#total").html("总金额："+data.total);
					$("#order_modal").modal();
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});
	
$("#order_input").click(function () {

		if(document.getElementById('autorenew').checked)
		{
			var autorenew=1;
		}
		else
		{
			var autorenew=0;
		}

		if(document.getElementById('disableothers').checked){
			var disableothers=1;
		}
		else{
			var disableothers=0;
		}
			
		$.ajax({
			type: "POST",
			url: "buy",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop,
				autorenew: autorenew,
				disableothers:disableothers
			},
			success: function (data) {
				if (data.ret) {
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});

</script>