
function initLogin(e,t){var n=$(".path").data("src");if(void 0==t)var i=window.location.href;else var i=t;var r=("http:"===location.protocol?"http":"https")+"://"+window.location.host+"/v3Jump.html",o=passport.pop.init({apiOpt:{staticPage:r,product:"bddoctor",u:i,memberPass:!0,safeFlag:0,sms:2},cache:!1,img:""+n+"/common/img/sign-logo.jpg",forgetLink:"https://passport.baidu.com/?getpass_index",registerLink:"https://passport.baidu.com/v2/?reg&tpl=bddoctor&u=",authsite:["tsina","renren","qzone","tqq"],tangram:!0,onLoginSuccess:function(t){if(void 0!=e&&""!=e)t.returnValue=!1,e()}});o.show()}