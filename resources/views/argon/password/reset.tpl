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
                  <small>找回密码</small>
                </div>
              </div>
              <div class="card-body px-lg-5 py-lg-5">
                  <div class="form-group mb-3">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                      </div>
                      <input class="form-control" placeholder="邮箱" id="email" type="email">
                    </div>
                  </div>
                  <div class="text-center">
					    <button id="reset" type="submit" class="btn btn-primary my-4">发送邮件</button>
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
			$("#result").modal();
            $("#msg").html("正在发送，请稍候。。。");
            $.ajax({
                type:"POST",
                url:"/password/reset",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                       // window.setTimeout("location.href='/auth/login'", 2000);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#result").modal();
                    $("#msg").html(data.msg);
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