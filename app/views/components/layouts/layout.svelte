<script>
  import { inertia } from 'inertia-svelte'
  import currentUser  from 'user'
  import currentPlayer from 'player'
</script>

<div class="container">
  {#if $currentUser}
    <div class="top">
      Welcome, {$currentUser.twitch_name}

      <div class="logout">
        <a use:inertia={{method: 'DELETE'}} href="/session">Log out</a>
      </div>
    </div>
  {:else}
    <h1><a use:inertia href="/">StreamTools</a></h1>

    <div class="login">
      <a href="/auth/twitch">Log In</a> 
    </div>
  {/if}

  <slot />

  <footer>
    <a use:inertia href="/about">About</a>
  </footer>
</div>

<style>
.top {
  height: 30px;
}
.login {
  position: absolute;
  top: 0;
  right: 0;
  border: 1px solid black;
  padding: 8px 24px;
}

.logout {
  position: absolute;
  right: 0;
}

h1 span {
  font-size: 0.5em;
  font-weight: normal;
}

h1 a {
  text-decoration: none !important;
}

footer {
  margin-top: 30px;
  padding-top: 10px;
  border-top: 1px solid #363636;
}
.container {
  position: relative;
  margin: 0 auto;
  width: 100%;
}
@media screen and (min-width: 1022px) {
  .container {
    margin: 0 auto;
    width: 1022px;
  }
}

</style>