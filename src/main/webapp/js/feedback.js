
function init_feedback(){if(bds&&bds.qa&&bds.qa.ShortCut&&bds.qa.ShortCut.initRightBar){bds.qa.ShortCut.base_url_path="https://sp3.baidu.com/-uV1bjeh1BF3odCf";var e={product_id:185,plugintitle:"意见反馈",issueTips:"请描述您遇到的问题或您的意见、建议",issuePlaceholder:"欢迎提出您在使用过程中遇到的问题或宝贵建议（400字以内），感谢您对百度的支持。",emailPlaceholder:"留下您的邮箱，便于我们及时回复您。",guide:"<span>您也可以通过邮箱(<a href=mailto:baiduyisheng@baidu.com>baiduyisheng@baidu.com</a>)直接与我们取得联系</span>",cutFileTips:"上传问题图片，图片大小不超过3M",emailTips:"请留下您的联系方式（选填）",needIssueTips:!0,needIssue:!0,needCut:!0,needEmail:!0,needGuide:!0,showPosition:"right",onlyUpFile:!1,defaultCut:!0,cutImg:"biaoji.png",upImg:"upload_btn.png",commitContent:"提交反馈",skinStyle:"flat"};bds.qa.ShortCut.initRightBar(e);var t={product_id:185,username:$("#feedback").data("user"),input:$("#feedback-input").val(),secret:$("#feedback-tel").val()};bds.qa.ShortCut._getProData(t)}}function loadScript(e,t,n){var i=document.createElement("script"),n=n||{};if(i.type="text/javascript",n.charset)i.charset=n.charset;if(n.id)i.id=n.id;if(i.readyState)i.onreadystatechange=function(){if("loaded"==i.readyState||"complete"==i.readyState)i.onreadystatechange=null,t()};else i.onload=function(){t()};i.src=e,document.body.appendChild(i)}function loadRightBar(){if(window.bds&&window.bds.qa&&window.bds.qa.ShortCut)init_feedback();else{var e=$("footer").attr("data-src");loadScript(e+"/common/js/feedback0.0.2.js",function(){init_feedback()},{charset:"utf-8",id:"feedback_script"})}return!1}$("#feedback-but").on("click",function(){loadRightBar()});