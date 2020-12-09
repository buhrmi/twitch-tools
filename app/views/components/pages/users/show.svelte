<script>
import currentUser from 'user'
import { page, inertia } from 'inertia-svelte'
export let user
</script>

{#if $currentUser && $currentUser.id == user.id}
  <h2>{user.twitch_name}</h2>
{/if}