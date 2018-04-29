<template>
  <div id="app" class="body">
    <v-app class="blue lighten-5">
      <page-header/>
      <div class="imgcontainer">
        <img src="@/assets/PET-image.png" alt="Avatar">
        </div>  
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
  height: 60px;
  margin-top: -60px;
}
.imgcontainer {
  margin-top: 20mm;
  text-align: center;
}

</style>
