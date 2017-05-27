#= require jquery

FacebookAuthentication =

  _on_session_create: []
  _on_session_delete: []

  login: ->
    FB.getLoginStatus (response) ->
      FacebookAuthentication.facebook_login_callback response

  facebook_login_callback: (response) ->
    if (response.status == 'connected')
      $.ajax('/sessions', {
        type: 'POST',
        beforeSend: (xhr) ->
          xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
          xhr.withCredentials = true
        complete: FacebookAuthentication._session_create_callback,
        data: { facebook_token: response['authResponse']['accessToken'] }
      })
    else
      FB.login FacebookAuthentication.facebook_login_callback, {
        scope: "email,public_profile,user_friends,user_events",
        return_scopes: true
      }

  logout: ->
    $.ajax('/sessions', {
      type: 'POST',
      complete: FacebookAuthentication._session_delete_callback
      data: { '_method': 'DELETE' }
    })

  _session_create_callback: ->
    callback() for callback in FacebookAuthentication._on_session_create
    window.location.reload()

  _session_delete_callback: ->
    callback() for callback in FacebookAuthentication._on_session_delete
    window.location.reload()

  on_session_create: (callback) ->
    FacebookAuthentication._on_session_create += callback

  on_session_delete: (callback) ->
    FacebookAuthentication._on_session_delete += callback

  setup: ->
    $(document).ready () ->

      window.fbAsyncInit = ->
        FB.init({
          appId      : $("meta[name='fb-app']").attr('content'),
          autoLogAppEvents : true,
          status           : true,
          xfbml            : true,
          version          : 'v2.9'
        })

      $('.facebook_login').click () ->
        options = { scope: 'public_profile,email,user_friends,read_insights,manage_pages' }
        FacebookAuthentication.login(FacebookAuthentication.facebook_login_callback, options)

      $('.facebook_logout').click () ->
        FacebookAuthentication.logout()

FacebookAuthentication.setup()

window.login_callback = ->
  FacebookAuthentication.login()
