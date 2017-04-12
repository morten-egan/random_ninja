create or replace package body computer_data

as

begin

  -- Init data structures.
  mountpoints := computertypes_list(null);
  mountpoints.extend(2);
  filetypes := computertypes_list(null);
  filetypes.extend(21);
  mimetypes := computertypes_list(null);
  mimetypes.extend(6);
  useragents := useragent_list(null);
  useragents.extend(86);
  errors := computertypes_list(null);
  errors.extend(4);

  -- Errors
  errors(1).c_category := 'Oracle RDBMS';
  errors(1).c_types := 'ORA-0####';
  errors(2).c_category := 'SQLServer';
  errors(2).c_types := 'Msg #####';
  errors(3).c_category := 'DB2 UDB';
  errors(3).c_types := 'errorcode=-###';
  errors(4).c_category := 'Python';
  errors(4).c_types := 'NameError: name ????? is not defined';

  -- Useragents.
  useragents(1) := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(2) := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(3) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(4) := 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(5) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(6) := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(7) := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(8) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(9) := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(10) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Safari/602.1.50';
  useragents(11) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(12) := 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(13) := 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(14) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(15) := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
  useragents(16) := 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(17) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14';
  useragents(18) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(19) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(20) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Safari/602.1.50';
  useragents(21) := 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(22) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(23) := 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(24) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393';
  useragents(25) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(26) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(27) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(28) := 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(29) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(30) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(31) := 'Mozilla/5.0 (Windows NT 6.1; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(32) := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(33) := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(34) := 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko';
  useragents(35) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(36) := 'Mozilla/5.0 (X11; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(37) := 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(38) := 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(39) := 'Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0';
  useragents(40) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(41) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/53.0.2785.143 Chrome/53.0.2785.143 Safari/537.36';
  useragents(42) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7';
  useragents(43) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8';
  useragents(44) := 'Mozilla/5.0 (iPad; CPU OS 10_0_2 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/14A456 Safari/602.1';
  useragents(45) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(46) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(47) := 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(48) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(49) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Safari/602.1.50';
  useragents(50) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(51) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(52) := 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)';
  useragents(53) := 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;  Trident/5.0)';
  useragents(54) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14';
  useragents(55) := 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko';
  useragents(56) := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0';
  useragents(57) := 'Mozilla/5.0 (Windows NT 5.1; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(58) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586';
  useragents(59) := 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(60) := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(61) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(62) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(63) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36';
  useragents(64) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(65) := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0';
  useragents(66) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(67) := 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko';
  useragents(68) := 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(69) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(70) := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';
  useragents(71) := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0';
  useragents(72) := 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/53.0.2785.109 Mobile/14A456 Safari/601.1.46';
  useragents(73) := 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/14A456 Safari/602.1';
  useragents(74) := 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0';
  useragents(75) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/601.6.17 (KHTML, like Gecko) Version/9.1.1 Safari/601.6.17';
  useragents(76) := 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:48.0) Gecko/20100101 Firefox/48.0';
  useragents(77) := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36';
  useragents(78) := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/52.0.2743.116 Chrome/52.0.2743.116 Safari/537.36';
  useragents(79) := 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36';
  useragents(80) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36';
  useragents(81) := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(82) := 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0';
  useragents(83) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(84) := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17';
  useragents(85) := 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';
  useragents(86) := 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36';


  -- Mimetypes.
  mimetypes(1).c_category := 'Audio';
  mimetypes(1).c_types := 'audio/aiff,audio/x-aiff,audio/midi,audio/mpeg,audio/x-mpequrl,audio/x-midi,audio/x-mpeg,audio/mpeg3,audio/x-mpeg-3';
  mimetypes(2).c_category := 'Video';
  mimetypes(2).c_types := 'video/x-ms-asf,video/avi,video/x-dv,video/gl,video/x-gl,video/mpeg,video/quicktime,video/x-mpeg,';
  mimetypes(3).c_category := 'Image';
  mimetypes(3).c_types := 'image/bmp,image/gif,image/x-icon,image/jpeg,image/png,image/x-tiff,image/tiff';
  mimetypes(4).c_category := 'Text';
  mimetypes(4).c_types := 'text/html,text/asp,text/plain,text/css,text/x-script,text/x-java-source,text/javascript,text/x-script.perl,text/x-script.python,text/richtext,text/sgml,text/xml';
  mimetypes(5).c_category := 'Application';
  mimetypes(5).c_types := 'application/octet-stream,application/postscript,application/octet-stream,application/x-binary,application/pkix-cert,application/java,application/x-x509-ca-cert,application/msword,application/x-gzip,application/javascript,application/pdf,application/mspowerpoint,application/x-compressed,application/excel';
  mimetypes(6).c_category := 'Multipart';
  mimetypes(6).c_types := 'multipart/x-gzip,multipart/x-zip';

  -- Mount points.
  mountpoints(1).c_category := 'Windows';
  mountpoints(1).c_types := 'C:,D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,U:,X:,Y:';
  mountpoints(2).c_category := 'Unix';
  mountpoints(2).c_types := '/,/usr,/proc,/var,/opt,/tmp,/usr,/home';

  -- Filetypes and extensions.
  filetypes(1).c_category := 'Archive';
  filetypes(1).c_types := 'cab,7z,aac,alz,apk,arc,arj,bin,bkf,bzip2,deb,dmg,egg,gzip,jar,lzh,lzip,pak,rar,rpm,npg,tar,tgz,Z,zip';
  filetypes(2).c_category := 'Image';
  filetypes(2).c_types := 'iso,img,sdi,mds,dmg,cif';
  filetypes(3).c_category := 'CAD';
  filetypes(3).c_types := '3mf,acp,aec,ar,dwf,dwg,f3d,ipn,scad,';
  filetypes(4).c_category := 'Database';
  filetypes(4).c_types := '4dd,accdb,db,dbf,frm,mdb,mde,mdf,myd,nsf,sqlite,';
  filetypes(5).c_category := 'Publishing';
  filetypes(5).c_types := 'ai,cdr,psd,pdf,pmd,pub,qxd,fm,';
  filetypes(6).c_category := 'Document';
  filetypes(6).c_types := 'abw,cwk,doc,docx,epub,fdx,gdoc,md,odt,pages,pdf,rtf,tex,txt,';
  filetypes(7).c_category := 'Finance';
  filetypes(7).c_types := 'myob,tax,ynab,ifx,ofx,qfx,qif';
  filetypes(8).c_category := 'Graphics';
  filetypes(8).c_types := 'act,pal,ase,bmp,cpt,cr2,exif,gif,ico,jpg,png,psd,psp,raw,tiff,xcf,ai,svg,blend,cal3d,max,skp';
  filetypes(9).c_category := 'Mathmatical';
  filetypes(9).c_types := 'mml,odf,sxm';
  filetypes(10).c_category := 'Executable';
  filetypes(10).c_types := 'apk,app,bpl,class,com,ear,elf,exe,ipa,jar,xpi,war,vbx';
  filetypes(11).c_category := 'Presentation';
  filetypes(11).c_types := 'keynote,nb,odp,pez,ppt,pptx,sdd';
  filetypes(12).c_category := 'Scientific';
  filetypes(12).c_types := 'fits,silo,spc,ost,ccp4,sdf,cdf,grib,mol,g6,bcf,sam,sbml,dicom,nii,mnc,acq,edf';
  filetypes(13).c_category := 'Script';
  filetypes(13).c_types := 'ahk,as,bat,bas,cljs,cmd,coffee,egg,erb,hta,js,lua,m,php,pl,ps1,py,r,rb,sh,tcl,vbs,sql';
  filetypes(14).c_category := 'Security';
  filetypes(14).c_types := 'ssh,pub,ppk,cer,crt,der,p7b,p12,pfx,pem,kdb,kdbx';
  filetypes(15).c_category := 'Audio';
  filetypes(15).c_types := 'aif,au,raw,wav,flac,la,pac,m4a,mp2,mp3,wma,aac,m4p,aac,ra,rm,midi,m3u,pls';
  filetypes(16).c_category := 'Source';
  filetypes(16).c_types := 'ada,adb,asm,bas,c,clj,cls,cob,cbl,cpp,cc,cs,d,for,go,h,hpp,java,lisp,m,php,pl,py,r,rb,scala,tcl,vb,';
  filetypes(17).c_category := 'Spreadsheet';
  filetypes(17).c_types := '123,csv,gsheet,numbers,ods,sdc,tsv,xls,xlsx';
  filetypes(18).c_category := 'Video';
  filetypes(18).c_types := 'aaf,3gp,gif,asf,avi,flv,mpeg1,mpeg2,m1v,m2v,m4v,mkv,mpg,mpe,ogg,wmv';
  filetypes(19).c_category := 'Virtual';
  filetypes(19).c_types := 'vhd,vmc,vsv,vmdk,vmsn,vmx,vdi,hdd';
  filetypes(20).c_category := 'Web';
  filetypes(20).c_types := 'dtd,html,xhtml,mhtml,asp,aspx,jsp,pl,php,atom,json,rss,md,psp';
  filetypes(21).c_category := 'Generic';
  filetypes(21).c_types := 'csv,html,css,ini,json,tsv,xml,yaml,txt,bak,bin,dat,conf,cfg,log,temp,tmp';

  dbms_application_info.set_client_info('computer_data');
  dbms_session.set_identifier('computer_data');

end computer_data;
/
