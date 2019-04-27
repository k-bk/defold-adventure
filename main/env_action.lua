local action = {}



function action.text(msg) 
	label.set_text("#text", msg) 
end



function action.finish()
	self.coroutine = nil
end



return action