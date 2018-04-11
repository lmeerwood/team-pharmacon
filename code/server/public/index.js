
new Vue({
    el: '#app',
    data: {
        totalClicks: 0,
        saving: false
    },
    methods: {
        submit: function() {
            console.log("Saving...");
            this.saving = true;
            this.totalClicks++;

            //Post to API
            this.$http.post('/api/v1/tableData')
                .then(response => {
                console.log("Saved successfully");
                this.saving = false;
            }, response => {
                console.log("Failure to save...");
                this.totalClicks--;
                this.saving = false;
            });
        }
    }
});