<?php
/*
  This code is part of GOsa (https://gosa.gonicus.de)
  Copyright (C) 2003  Cajus Pollmeier

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

class dhcpPool extends dhcpPlugin
{
  /* Used attributes */
  var $dhcpRange= "";
  var $range_start= "";
  var $range_stop= "";

  /* attribute list for save action */
  var $objectclasses= array('top', 'dhcpPool');

  function dhcpPool($attrs)
  {
    dhcpPlugin::dhcpPlugin($attrs);

    /* Load attributes */
    if (!$this->new){
      $this->dhcpRange= $attrs['dhcpRange'][0];
      list($this->range_start, $this->range_stop)= preg_split('/\s+/', $this->dhcpRange);
    }

    $this->advanced->setAutoOptions(array("host-name"));
    $this->advanced->setAutoStatements(array("fixed-address"));
  }

  function execute()
  {
    $smarty= get_smarty();
    $smarty->assign("cn", $this->cn);
    $smarty->assign("range_start", $this->range_start);
    $smarty->assign("range_stop", $this->range_stop);

    /* Show main page */
    $display= $smarty->fetch(get_template_path('dhcp_pool.tpl', TRUE)).$this->network->execute();

    /* Merge arrays for advanced view */
    foreach (array("options", "statements") as $type){
      $this->advanced->$type= $this->$type + $this->network->$type;;
    }

    $display.= $this->advanced->execute();

    /* Merge back for removals */
    foreach (array("options", "statements") as $type){
      $this->$type= $this->advanced->$type;
      $this->network->$type= $this->advanced->$type;
    }

    /* Add footer */
    $display.= "<div style='width:100%;text-align:right;margin-top:5px;'><input type=submit name='save_dhcp' value='"._("Save")."'>".
               "&nbsp;<input type=submit name='cancel_dhcp' value='"._("Cancel")."'></div>";

    return ($display);
  }

  function remove_from_parent()
  {
  }


  /* Save data to object */
  function save_object()
  {
    if (isset($_POST['cn'])){
      $this->cn= validate($_POST['cn']);
      $this->range_start= validate($_POST['range_start']);
      $this->range_stop= validate($_POST['range_stop']);
    }

    dhcpPlugin::save_object();

    /* Move range to internal variable */
    $this->dhcpRange= $this->range_start." ".$this->range_stop;
  }


  /* Check values */
  function check($cache)
  {
    $message= array();

    /* All required fields are set? */
    if ($this->cn == ""){
      $message[]= _("Required field 'Name' is not filled.");
    }

    /* cn already used? */
    if ($this->orig_cn != $this->cn || $this->new){

      foreach($cache as $dn => $dummy){
        if (preg_match("/^cn=".$this->cn.",/", $dn) && count($dummy)){
          $message[]= _("The name for this section is already used!");
          break;
        }
      }
    }

    if ($this->dhcpRange == ""){
      $message[]= _("Required field 'Range' is not filled.");
    }

    if (!is_ip($this->range_start) || !is_ip($this->range_stop)){
      $message[]= _("Field 'Range' contains invalid IP addresses.");
    }

    return $message;
  }

  /* Save to LDAP */
  function save()
  {
    dhcpPlugin::save();
    $this->attrs['dhcpRange']= array($this->dhcpRange);

    return ($this->attrs);
  }
  
}

?>