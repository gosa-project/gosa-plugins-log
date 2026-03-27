<div class="logDB-wrapper">
     <div class="row">
          <h3><i class="material-icons">chevron_right</i> {t}Logging database information{/t}</h3>
          <div class="col s12 xl6">
               {render acl=$gosaLogDBACL}
               <div class="input-field">
                    <input type="text" name="gosaLogDB" id="gosaLogDB" size=30 maxlength=60 value="{$gosaLogDB}">
                    <label for="gosaLogDB">{t}Database{/t}{$must}</label>
               </div>
               {/render}
               
               {render acl=$goLogAdminACL}
               <div class="input-field">
                    <input type='text' name="goLogAdmin" id="goLogAdmin" size=30 maxlength=60 value="{$goLogAdmin}">
                    <label for="goLogAdmin">{t}Logging DB user{/t}{$must}</label>
               </div>
               {/render}

               {render acl=$goLogPasswordACL}
               <div class="input-field">
                    <input type="password" name="goLogPassword" id="goLogPassword" size=30 maxlength=60 value="{$goLogPassword}">
                    <label for="goLogPassword">{t}Password{/t}{$must}</label>
               </div>
               {/render}
          </div>
     </div>
</div>

<div class="card-action">
    <button class="btn-small primary" type='submit' name='SaveService'>{msgPool type=saveButton}</button>
    <button class="btn-small primary" type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>

<input type="hidden" name="goLogDBServerPosted" value="1">
