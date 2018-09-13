defmodule Bezexexchange.Auth do 
    @moduledoc """
    This is a module plug that takes two functions for users authentication
    ...
    the functions are init/1 and call/2 functions
    Author Sylvia Onwukwe
    """
    import Plug.Conn

    @doc """
    init function for the module plug
    ##Parameter
    -opts: the given options
    -repo: the repository
    """
    def init(opts) do 
        Keyword.fetch!(opts, :repo)#raises an exception if giveb key doesn't exist
    end

    @doc """
    call function for the module plug
    ##Parameter
    -repo: repository received from init,checks if :user_id is stored in the session 
    -conn: assigned result from the repository
    """
    def call(conn, repo) do
        user_id = get_session(conn, :user_id)
        user = user_id && repo.get(Bezexexchange.User, user_id) 
        #assign is imported from plug.conn
        assign(conn, :current_user, user)#current user will be availabe in all downstream functions
    end 
    
end