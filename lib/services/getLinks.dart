import 'package:flutter/material.dart';
class GetLinks{
  getKYClink(String email,String name,String site){


    var url='https://formfacade.com/headless/108634720667607789824/home/form/1FAIpQLScmPEZ9093paigGyMZvdcfTv4nltGr8tdyg_JxXZA1Q6aEBZw?usp=pp_url&entry.658580989=$email&entry.968675145=$site&entry.361125583=$name';
    return url;
  }
  getServiceRequestLink(String name,String email){
    var url='https://formfacade.com/headless/108634720667607789824/home/form/1FAIpQLSeUluNAw0sAaoYA_K30s7YMeiDiwp9LPH7VBaTOsppEPlfsQw?usp=pp_url&entry.1275100943=$email&entry.274199756=$name';
    return url;
  }
  getVisitorEntryLink(String name){
    var url='https://formfacade.com/headless/108634720667607789824/home/form/1FAIpQLSdHLCng0HR8bKCkGmo_ast7qysOuiuDHnWFccNDcH-tvSqazA?usp=pp_url&entry.1740053772=$name';
    return url;
  }
}