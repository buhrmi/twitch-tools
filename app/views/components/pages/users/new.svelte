<script>
  import { page, inertia } from 'inertia-svelte'
</script>

Engage with your audience in completely new ways.

<div class="tool">
  <a class="btn primary" href="/auth/twitch">Install</a> 
  <h2>AuctionsBot</h2>
  Run live auctions in your channel.
</div>

<div class="tool">
  <div class="btn primary disabled">Coming Soon</div>
  <h2>Screen Estate</h2>
  Buy and sell ad space on live streams
</div>


<style>
.tool {
  padding: 36px;
  background: #36393f;
  margin: 36px 0;
  box-shadow: 0 2px 10px 0 rgba(0,0,0,.2);
}
.btn {
  letter-spacing: 1pt;
  font-weight: bold;
  float: right;
  color: white;
  background: #7289da;
  padding: 18px 40px;
  border-radius: 5px;
}
.btn.disabled {
  background-color: #4e546b;
}
</style>