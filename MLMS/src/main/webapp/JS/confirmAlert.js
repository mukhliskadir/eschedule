const ui = {
		  confirm: async (message) => createConfirm(message)
		}

		const createConfirm = (message) => {
		  return new Promise((complete, failed)=>{
		    $('#confirmMessage').text(message)

		    $('#confirmYes').off('click');
		    $('#confirmNo').off('click');
		    
		    $('#confirmYes').on('click', ()=> { $('.confirm').hide(); complete(true); });
		    $('#confirmNo').on('click', ()=> { $('.confirm').hide(); complete(false); });
		    
		    $('.confirm').show();
		  });
		}
		                     
		const deleteTopic = async () => {
		  const confirm = await ui.confirm('Are you sure you want to do this?');
		  
		  if(confirm){
			  var contact = document.getElementById("id").value;
			  document.getElementById("form_id").action = "TopicServlet"; //Setting form action to "success.php" page
			  document.getElementById("form_id").submit(); // Submitting form
		  } else{
		  }
		}