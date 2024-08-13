defmodule Examples.Structs.Conversation do 
  defstruct [:other_party, messages: []]

  def new(sms_list) do
    other_party = List.first(sms_list) |> Examples.Structs.Sms.other_party() 
    %__MODULE__{other_party: other_party, messages: sms_list}
  end

  def append(conversation, sms) do
    new_messages = conversation.messages ++ [sms] 
    Map.put(conversation, :messages, new_messages)
  end

  def clear(conversation) do 
    Map.put(conversation, :messages, [])
  end 
end
