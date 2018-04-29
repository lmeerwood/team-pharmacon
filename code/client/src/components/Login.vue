<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>
        <fieldset>
        <div class="uname">
          <label class="username"><b>Username</b></label>
          <input type="text" placeholder="Enter Username" name="username" required>
        </div>
        <div class="pword">
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>
        </div>
        <div class="button">
            <input type="submit" value="Login">
        </div>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      msg: 'Please Login'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
  .uname {
    padding: 15px;
  }
  .pword {
    padding: 15px;
  }
  .button {
    padding: 15px;
    background-color: cornflowerblue;
    width: 200px;
    text-align: center;
  }
  
</style>


