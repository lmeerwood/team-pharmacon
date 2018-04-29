<template>
  <div id="app">
    <v-app>
      <page-header/>
      <main>
        <router-view/>
      </main>
    </v-app>
  </div>
</template>

<script>
import PageHeader from '@/components/Header.vue'

export default {
  name: 'App',
  components: {
    PageHeader
  }
}
</script>

<style>
section::before {
  content: "";
  display: block;
  position: relative;
  width: 0;
  height: 80px;
  margin-top: -80px;
}
</style>
