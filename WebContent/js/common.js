/**
 * 공통 자바스크립트
 * author: 이대용
 */
window.addEventListener('load', function(e) {
	document.getElementById('selDepNm').addEventListener('change', function(e) {
		
		document.getElementById('selDepLdNm').innerHTML = '<option>선택하세요</option>';
		
		var managerId = e.target.value;
		
		for (var i in depSelList){
			if (depSelList[i].managerId == managerId) {
				document.getElementById('selDepLdNm').innerHTML += '<option value="' + depSelList[i].managerId + '">' + depSelList[i].lastName + '</option';
			}
		}
		
	}, false);
	
	document.getElementById('btnSubmit').addEventListener('click', function(e) {
		
		var manageId = document.getElementById('selDepNm').value
		console.log(manageId);
		var departmentId = "";
		if (manageId != '선택하세요') {
			for (var x in depSelList) {
				if (depSelList[x].managerId == manageId) {
					departmentId = depSelList[x].departmentId;
				}
			}
			
			for (var i in document.forms[1].elements) {
				if (document.forms[1].elements[i].name == 'manage_id') {
					document.forms[1].elements[i].value = manageId;
				}
				if (document.forms[1].elements[i].name == 'department_id') {
					document.forms[1].elements[i].value = departmentId;
				}
			}
		}
		
		document.forms[1].submit();
		
	}, false);
}, false);