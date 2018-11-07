

{include file='newui_header.tpl'}


<main>
    <section class="section section-shaped section-lg my-0">
      <div class="shape shape-style-1 bg-gradient-default">
      </div>
      <div class="container pt-lg-md">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="card bg-secondary shadow border-0">
              <div class="card-header bg-white pb-5">
                <div class="text-muted text-center mb-3">
                  <small>重置密码</small>
                </div>            
              </div>
              <div class="card-body px-lg-5 py-lg-5">
                  <div class="form-group mb-3">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="新密码"  id="password" type="password">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="重复新密码" type="password"  id="repasswd">
                    </div>
                  </div>
                  <div class="text-center">
					    <button  id="reset" type="submit" class="btn btn-primary my-4">登录</button>
                  </div>
              </div>
			  
            </div>
            <div class="row mt-3">
              <div class="col-6">
                <a href="/auth/login" class="text-light">
                  <small>登陆</small>
                </a>
              </div>
              <div class="col-6 text-right">
                <a href="/auth/register" class="text-light">
                  <small>注册账号</small>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	
{include file='newui_dialog.tpl'}
{include file='auth/auth_footer.tpl'}


<script>
    $(document).ready(function(){
        function reset(){
            $.ajax({
                type:"POST",
                url:"/password/token/{$token}",
                dataType:"json",
                data:{
                    password: $("#password").val(),
                    repasswd: $("#repasswd").val(),
                },
                success:function(data){
                    if(data.ret){
						$("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误："+jqXHR.status);
                    // 在控制台输出错误信息
                    console.log(removeHTMLTag(jqXHR.responseText));
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                reset();
            }
        });
        $("#reset").click(function(){
            reset();
        });
    })
</script>



