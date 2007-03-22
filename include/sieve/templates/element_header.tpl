<table class='sieve_test_case'>
	{if $Expert}
    	{if $LastError != ""}
        	<tr>
				<td colspan=4>
		            <font color='red'><b>{$LastError}</b></font>
				</td>
			</tr>

        {/if}


	 <tr>
        <td>
            {t}Match type{/t}
        </td>
        <td>
            <select name='matchtype_{$ID}' title='{t}Boolean value{/t}' onChange='document.mainform.submit();'>
                {html_options options=$match_types selected=$match_type}
            </select>

        </td>
        <td>
            {t}Invert test{/t}?
        </td>
        <td>
            {if $Inverse}
                <input type='submit' name='toggle_inverse_{$ID}' value='{t}Yes{/t}'>
            {else}
                <input type='submit' name='toggle_inverse_{$ID}' value='{t}No{/t}'>
            {/if}
        </td>
        <td style='text-align:right; vertical-align:top;'>
            <input type='submit' name='Toggle_Expert_{$ID}' value='{t}Normal mode{/t}'>
        </td>
    </tr>
    <tr>
        <td>
            {t}Comparator{/t}
        </td>
        <td>
            <select name='comparator_{$ID}' title='{t}Boolean value{/t}'>
                {html_options options=$comparators selected=$comparator}
            </select>
        </td>
        {if $match_type == ":count" || $match_type == ":value"}
        <td>
            {t}operator{/t}
        </td>
        <td>
            <select name='operator_{$ID}' title='{t}Boolean value{/t}' onChange='document.mainform.submit();'>
                {html_options options=$operators selected=$operator}
            </select>
        </td>
        {else}
        <td style='text-align:right;'>
            &nbsp;
        </td>
        {/if}
        <td style='text-align:right;'>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan=2>
            {t}Address fields to include{/t}<br>
            <textarea style='width:95%;height:50px;' name='keys_{$ID}'>{$keys}</textarea>
        </td>
        <td colspan=3>
            {t}Values to match for{/t}<br>
            <textarea style='width:95%;height:50px;' name='values_{$ID}'>{$values}</textarea>
        </td>
    </tr>

	{else}
    	{if $LastError != ""}
        	<tr>
				<td colspan=4>
		            <font color='red'><b>{$LastError}</b></font>
				</td>
			</tr>

        {/if}
		 <tr>
        <td style='vertical-align:top;'>
            <b>{t}Header{/t}</b>

            {if $Inverse}
                <input type='submit' name='toggle_inverse_{$ID}' value='{t}Not{/t}'>
            {else}
                <input type='submit' name='toggle_inverse_{$ID}' value='{t}-{/t}'>
            {/if}
            &nbsp;
            <select onChange='document.mainform.submit();' name='matchtype_{$ID}' title='{t}Boolean value{/t}'>
                {html_options options=$match_types selected=$match_type}
            </select>

            {if $match_type == ":count" || $match_type == ":value"}
            <select name='operator_{$ID}' title='{t}Boolean value{/t}' onChange='document.mainform.submit();'>
                {html_options options=$operators selected=$operator}
            </select>
            {/if}
        </td>
        <td>
            <textarea style='width:45%;height:20px;' name='keys_{$ID}'>{$keys}</textarea>
            <textarea style='width:45%;height:20px;' name='values_{$ID}'>{$values}</textarea>
        </td>
        <td style='text-align:right; vertical-align:top;'>
            <input type='submit' name='Toggle_Expert_{$ID}' value='{t}Expert mode{/t}'>
        </td>
    </tr>

	{/if}
</table>