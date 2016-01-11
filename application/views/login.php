

  <div class="modal fade" id="login" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Please Sign In</h4>
      </div>
      <div class="modal-body">
        

        <?php if (isset($error) && $error): ?>
          <div class="alert alert-warning">
            <a class="close" data-dismiss="alert" href="#">×</a>Incorrect Username or Password!
          </div>
        <?php endif; ?>

        <?php echo form_open('login/login_user') ?>

        <input type="text" id="email" class="form-control" name="email" placeholder="Email Address">
        <input type="password" id="password" class="form-control" name="password" placeholder="Password">

        <!--<label class="checkbox">
          <input type="checkbox" name="remember" value="1"> Remember Me
        </label>-->

      </div>
      <div class="modal-footer">

      <!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        <button type="submit" name="submit" class="btn btn-info">Sign in</button>

      </div>
       </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  <div class="modal" id="login">
    <div class="modal-body">
      
      
    
</div>
</div>