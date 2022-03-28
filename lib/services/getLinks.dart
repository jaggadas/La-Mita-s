import 'package:flutter/material.dart';
class GetLinks{
  getKYClink(String email,String name,String site){


    var url='https://docs.google.com/forms/d/e/1FAIpQLScmPEZ9093paigGyMZvdcfTv4nltGr8tdyg_JxXZA1Q6aEBZw/viewform?usp=pp_url&entry.658580989=$email&entry.968675145=$site&entry.361125583=$name';
    return url;
  }
  getServiceRequestLink(String name,String email){
    var url='https://docs.google.com/forms/d/e/1FAIpQLSeUluNAw0sAaoYA_K30s7YMeiDiwp9LPH7VBaTOsppEPlfsQw/viewform?usp=pp_url&entry.1275100943=$email&entry.274199756=$name';
    return url;
  }
  getVisitorEntryLink(String name){
    var url='https://docs.google.com/forms/d/e/1FAIpQLSdHLCng0HR8bKCkGmo_ast7qysOuiuDHnWFccNDcH-tvSqazA/viewform?usp=pp_url&entry.1740053772=$name';
    return url;
  }
}