namespace :contact_page do
  task generate: :environment do
    page = Workarea::Content::Page.create!(name: 'contact_page')

    html = <<-HTML
      <form id="Form">
        <p class='name'>
          <input type="text" id="name" placeholder='Name' required maxlength="30">
        </p>    
        <p class='email'>
          <input type="email" id="emailField" placeholder='Email' required maxlength="50">
        </p>       
        <p class='comment'>
          <input type="text" id="comment" placeholder='Comment' maxlength="300">
        </p>     
        <div class='submit'>
          <button id="Button" disabled>Submit</button>
        </div> 
      </form>
      
      <script>
        const form = document.getElementById('Form');
        const emailField = document.getElementById('emailField');
        const nameField = document.getElementById('name');
        const commentField = document.getElementById('comment');
        
        const okButton = document.getElementById('Button');
          
        form.addEventListener('keyup', function (event) {
          isValidName = nameField.checkValidity();
          isValidEmail = emailField.checkValidity();
          isValidComment = commentField.checkValidity();
        
          if ( isValidEmail && isValidName && isValidComment ) {
            okButton.disabled = false;
          } else {
            okButton.disabled = true;
          }
        });
          
        okButton.addEventListener('click', function (event) {
          Form.submit();
        });
      </script>
    HTML

    css = <<-CSS
        #form {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        #name, #emailField, #comment {   
            outline: none;
            border: 1px solid #ccc;
            background-color: white;
            font: inherit;
            padding: 6px 10px;
            display: block;
            width: 50%;
            box-sizing: border-box;
        }
        
        #comment {
          height: 80px
        }
        
        input::placeholder {
          vertical-align: top;
        }
        
        #Button {
            background-color: green;
            border: none;
            color: white;
            outline: none;
            cursor: pointer;
            font: inherit;
            padding: 10px;
            margin: 10px;
            font-weight: bold;
        }
        
        #Button:disabled {
          background-color: red
        }
      CSS

    content =  Workarea::Content.for(page)
    content.css = css
    content.save!
    content.blocks.create!(type: 'html', data: { html: html })
  end
end
