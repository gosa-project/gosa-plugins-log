<table summary="" width="100%">
 <tr>
  <td style="vertical-align:top; width:50%;">
	<table summary="">
	 <tr>
	  <td>{t}Device name{/t}{$must}</td>
	  <td><input name="cn" size=20 maxlength=60 value="{$cn}"></td>
	 </tr>
	 <tr>
          <td colspan=2>&nbsp;</td>
	 </tr>
 	 <tr>
	  <td>{t}Base{/t}{$must}</td>
	  <td>
	   <select size="1" name="base" title="{t}Choose subtree to place terminal in{/t}">
	    {html_options options=$bases selected=$base_select}
	   </select>
	  </tr>
	</table>
  </td>
  <td style="vertical-align:top">
	<table summary="">
	 <tr>
	  <td>{t}Description{/t}</td>
	  <td><input name="description" size=25 maxlength=80 value="{$description}"></td>
	 </tr>
	</table>
  </td>
 </tr>
</table>

<p class="plugbottom" style="margin-bottom:0px; padding:0px;">&nbsp;</p>

{include file="$netconfig"}

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  document.mainform.cn.focus();
  -->
</script>
