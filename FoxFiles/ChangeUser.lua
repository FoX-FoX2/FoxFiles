local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local abbs = redis:get("DevProxTEAM:User"..result.id_)
if not result.username_ then 
if abbs then 
SendFoX(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..abbs.."", 1, 'html')
redis:del("DevProxTEAM:User"..result.id_) 
end
end
if result.username_ then 
if abbs and abbs ~= result.username_ then 
local abs_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
abbss = math.random(#abs_text)
SendFoX(msg.chat_id_, msg.id_, 1, abs_text[abbss], 1, 'html')
end  
redis:set("DevProxTEAM:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
DevProx = ChangeUser
}