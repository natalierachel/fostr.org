(function(g){var j=0;g.fn.checkboxTree=function(p){var 
	q={checkChildren:true,checkParents:true,collapsable:false,container:"checkboxTree["+j+++"]",
	cssClass:"checkboxTree",initializeChecked:"expanded",initializeUnchecked:"expanded",
	onCheck:{ancestors:"",descendants:"check",node:""},
	onUncheck:{ancestors:"uncheck",descendants:"uncheck",node:""}};
	var p=g.extend(true,q,p);if(p.collapsable){if(p.checkChildren){p.onCheck.descendants="check";
	p.onUncheck.descendants="uncheck"}if(p.checkParents){p.onCheck.ancestors="check"}if(p.collapsed){p.initializeChecked="collapsed";
	p.initializeUnchecked="collapsed"}p.collapseAnchor=(p.collapseImage.length>0)?'<img src="'+p.collapseImage+'" />':"-";
	p.expandAnchor=(p.expandImage.length>0)?'<img src="'+p.expandImage+'" />':"+";p.leafAnchor=(p.leafImage.length>0)?'<img src="'+p.leafImage+'" />':"";
	if(p.collapseAllButton.html.length>0){p.collapseAllButton.container.prepend(g("<a/>",{"class":p.cssClass+" all",href:"javascript:void(0);",
	html:p.collapseAllButton.html,click:function(){g("[class*="+p.container+"] li.expanded").each(function(){k(g(this),p)})}}))}if(p.expandAllButton.html.length>0)
	{p.expandAllButton.container.prepend(g("<a/>",{"class":p.cssClass+" all",href:"javascript:void(0);",
	html:p.expandAllButton.html,click:function(){g("[class*="+p.container+"] li.collapsed").each(function(){l(g(this),p)})}}))}g("li:not(:has(ul))",
	this).each(function(){g(this).prepend(g("<span></span>"));f(g(this),p)});g("li:has(ul):has(input:checked)",this).each(function(){g(this).prepend(g("<span></span>"));
	p.initializeChecked=="collapsed"?k(g(this),p):l(g(this),p)});g("li:has(ul):not(:has(input:checked))",this).each(function(){g(this).prepend(g("<span></span>"));
	p.initializeUnchecked=="collapsed"?k(g(this),p):l(g(this),p)});g("li.collapsed span",this).live("click",function(){l(g(this).parents("li:first"),p);return false});
	g("li.expanded span",this).live("click",function(){k(g(this).parents("li:first"),p);return false});
	g(p.collapseAllElement).bind("click",function(){i(p)});g(p.expandAllElement).bind("click",function(){o(p)});
	if(p.onUncheck.node=="collapse"){g(":checkbox:not(:checked)",this).live("click",function(){k(g(this).parents("li:first"),p)})}
	else{if(p.onUncheck.node=="expand"){g(":checkbox:not(:checked)",this).live("click",function(){l(g(this).parents("li:first"),p)})}}
	if(p.onCheck.node=="collapse"){g(":checkbox:checked",this).live("click",function(){k(g(this).parents("li:first"),p)})}
	else{if(p.onCheck.node=="expand"){g(":checkbox:checked",this).live("click",function(){l(g(this).parents("li:first"),p)})}}this.collapse=function(r){if(g(r).hasClass("expanded")){k(r,p)}};
	this.collapseAll=function(){i(p)};this.expand=function(r){if(g(r).hasClass("collapsed")){l(r,p)}};this.expandAll=function(){o(p)}}g(":checkbox:not(:checked)",this).live("click",function(){var r=g(this).parents("li:first");e(r,p)});g(":checkbox:checked",this).live("click",function(){var r=g(this).parents("li:first");d(r,p)});this.addClass(p.container);this.addClass(p.cssClass);this.check=function(r){d(r,p)};this.uncheck=function(r){e(r,p)};return this};function d(p,q){g(p).find("input:first:not(:checked)").attr("checked","checked").change();if(q.onCheck.ancestors=="check"){b(p,q)}else{if(q.onCheck.ancestors=="uncheck"){h(p,q)}}if(q.onCheck.descendants=="check"){c(p,q)}else{if(q.onCheck.descendants=="uncheck"){n(p,q)}}}function b(p,q){p.parents("li").find("input:first:not(:checked)").attr("checked","checked").change()}function c(p,q){p.find("li input:not(:checked)").attr("checked","checked").change()}function k(p,q){if(g(p).hasClass("collapsed")||g(p).hasClass("leaf")){return}if(g.ui!==undefined){p.children("ul").hide(q.collapseEffect,{},q.collapseDuration)}else{p.children("ul").hide(q.collapseDuration)}m(p,q)}function i(p){g("[class*="+p.container+"] li.expanded").each(function(){k(g(this),p)})}function l(p,q){if(g(p).hasClass("expanded")||g(p).hasClass("leaf")){return}if(g.ui!==undefined){p.children("ul").show(q.expandEffect,{},q.expandDuration)}else{p.children("ul").show(q.expandDuration)}a(p,q)}function o(p){g("[class*="+p.container+"] li.collapsed").each(function(){l(g(this),p)})}function m(p,q){p.children("span").html(q.expandAnchor);p.addClass("collapsed").removeClass("expanded")}function a(p,q){p.children("span").html(q.collapseAnchor);p.addClass("expanded").removeClass("collapsed")}function f(p,q){p.children("span").html(q.leafAnchor);p.addClass("leaf")}function e(p,q){g(p).find("input:first:checked").attr("checked","").change();if(q.onUncheck.ancestors=="check"){b(p,q)}else{if(q.onUncheck.ancestors=="uncheck"){h(p,q)}}if(q.onUncheck.descendants=="check"){c(p,q)}else{if(q.onUncheck.descendants=="uncheck"){n(p,q)}}}function h(p,q){p.parents("li").find("input:first:checked").attr("checked","").change()}function n(p,q){p.find("li input:checked").attr("checked","").change()}})(jQuery);

document.documentElement.className += ' js';

(function($){
	$('ul#checkboxes input[type="checkbox"]').ajaxComplete().each (
		function () {
			$(this).bind('click change', function (){
				if($(this).is(':checked')) {
					$(this).siblings('ul').find('input[type="checkbox"]').attr('checked', 'checked');
					$(this).parents('ul').siblings('input[type="checkbox"]').attr('checked', 'checked');
                } else {
                    $(this).siblings('ul').find('input[type="checkbox"]').removeAttr('checked', 'checked');
                }
			});
		}
	);
	
})(jQuery);