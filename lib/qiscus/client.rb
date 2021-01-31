module Qiscus
  module Client
    POST_METHODS = [
      "create_room",
      "get_or_create_room_with_target",
      "update_room",

      "get_or_create_channel",

      "add_room_participants",
      "remove_room_participants",

      "post_comment",

      "login_or_register",
      "reset_user_token",
    ]

    GET_METHODS = [
      "get_rooms_info",

      "get_room_participants",

      "load_comments",

      "user_profile",
      "get_user_rooms",
      "get_user_list",
    ]

    DELETE_METHODS = [
      "delete_messages"
    ]
  end
end
