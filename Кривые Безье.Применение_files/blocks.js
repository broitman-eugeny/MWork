// collapsible blocks routine

var NavigationBarHide = '[hide]'
var NavigationBarShow = '[show]'
var tocHideText = '[hide]'
var tocShowText = '[show]'

//---
function hasClass (obj, className) {
   if (typeof obj == 'undefined' || obj==null || !RegExp) { return false; }
   var re = new RegExp("(^|\\s)" + className + "(\\s|$)");
   if (typeof(obj)=="string") {
      return re.test(obj);
   }
   else if (typeof(obj)=="object" && obj.className) {
      return re.test(obj.className);
   }
   return false;
}

//--- 11.14.09
function collapsibleDivs() {
   var divIdx = 0, colDivs = [], i, DivFrame
   var divs = document.getElementsByTagName('DIV')

   for (i=0; DivFrame = divs[i]; i++) {
      if (!hasClass(DivFrame, 'divFrame')) continue
      DivFrame.id = 'DivFrame' + divIdx
      var a = document.createElement('a')
      a.className = 'NavToggle'
      a.id = 'NavToggle' + divIdx
      a.href = 'javascript:collapseDiv(' + divIdx + ');'
      a.appendChild(document.createTextNode(NavigationBarHide))

      for (var j=0; j < DivFrame.childNodes.length; j++)
         if (hasClass(DivFrame.childNodes[j], 'divTgl'))
            DivFrame.childNodes[j].appendChild(a)
      colDivs[divIdx++] = DivFrame
   }
   for (i=0; i < divIdx; i++)
      if (hasClass(colDivs[i], 'collapsed'))
         collapseDiv(i)
}

//--- 11.14.09
function collapseDiv(idx) {
   var div = document.getElementById('DivFrame' + idx)
   var btn = document.getElementById('NavToggle' + idx)
   if (!div || !btn) return false

   var isShown = (btn.firstChild.data == NavigationBarHide)
   btn.firstChild.data = isShown ? NavigationBarShow : NavigationBarHide
   var disp = isShown ? 'none' : 'block'
   for (var child = div.firstChild;  child != null;  child = child.nextSibling)
     if (hasClass(child, 'content'))
        child.style.display = disp
}

