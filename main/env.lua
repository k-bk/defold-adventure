local env = {}



function env.init(self, on_look, on_item, on_talk)
	self.id = go.get_id()
	self.actions = { "look", "take", "talk" }
	self.on_look = on_look
	self.on_item = on_item
	self.on_talk = on_talk
	self.timer = 0
	self.coroutine = nil
end



function env.on_message(self, message_id, message, sender)
	if message_id == hash("on_look") then
		self.coroutine = self.coroutine or coroutine.create(self.on_look)
		coroutine.resume(self.coroutine, self)

	elseif message_id == hash("on_item") then
		self.coroutine = self.coroutine or coroutine.create(self.on_item)
		coroutine.resume(self.coroutine, self, message.item)

	elseif message_id == hash("on_talk") then
		self.coroutine = self.coroutine or coroutine.create(self.on_talk)
		coroutine.resume(self.coroutine, self)

	end
end



return env