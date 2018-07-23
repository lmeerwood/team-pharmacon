webpackJsonp([1],{"2ayk":function(e,t){},"5PhG":function(e,t){},E5XW:function(e,t){},NHnr:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=a("7+uW"),s=a("Dd8w"),i=a.n(s),n=a("NYxO"),o={computed:i()({},Object(n.b)({authlevel:"auth"})),methods:{logout:function(){this.$store.dispatch("logout"),this.$router.push("/login")}}},l={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-toolbar",{attrs:{fixed:""}},[a("v-toolbar-title",{staticClass:"mr-4"},[e._v("\n    Pharmacy Error Tracker\n  ")]),e._v(" "),a("v-spacer"),e._v(" "),0!==e.authlevel?a("v-toolbar-items",[a("v-btn",{attrs:{to:{name:"Error"},flat:""}},[e._v("Log Error")]),e._v(" "),2===e.authlevel?a("v-btn",{attrs:{to:{name:"Physician"},flat:""}},[e._v("Manage Physicians")]):e._e(),e._v(" "),2===e.authlevel?a("v-btn",{attrs:{href:"http://18.188.218.170:17050",flat:""}},[e._v("Reporting")]):e._e(),e._v(" "),a("v-btn",{attrs:{flat:""},on:{click:e.logout}},[e._v("Logout")])],1):e._e()],1)},staticRenderFns:[]};var c={name:"App",components:{PageHeader:a("VU/8")(o,l,!1,function(e){a("p1t7")},"data-v-1b64cef4",null).exports}},u={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"body",attrs:{id:"app"}},[t("v-app",{staticClass:"blue lighten-5"},[t("page-header"),this._v(" "),t("div",{staticClass:"imgcontainer"},[t("img",{attrs:{src:a("igIz"),alt:"Avatar"}})]),this._v(" "),t("main",[t("router-view")],1)],1)],1)},staticRenderFns:[]};var v=a("VU/8")(c,u,!1,function(e){a("5PhG")},null,null).exports,d=a("/ocq"),f={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-layout",{staticClass:"pt-5 top-margin",attrs:{row:""}},[a("v-flex",{attrs:{xs6:"","offset-xs3":""}},[a("section",{staticClass:"page-head"},[a("h1",{staticClass:"display-1 primary--text",attrs:{id:"introduction"}},[e._v("\n        "+e._s(e.msg)+"\n      ")]),e._v(" "),a("div",[a("p",[e._v("This page provides direct links to different sections of the app. It will be removed for production.\n        "),a("br"),a("br"),e._v("Also, none of this layout is permanent. All of it can be changed and modified to suit the end goal. This\n          was simply made to provide a starting ground.")])])]),e._v(" "),a("section",[a("v-btn",{attrs:{to:{name:"Login"},flat:""}},[e._v("\n        Login Page\n      ")]),e._v(" "),a("v-btn",{attrs:{to:{name:"Error"},flat:""}},[e._v("\n        Error Page\n      ")])],1),e._v(" "),a("h2",{staticClass:"headline primary--text pt-4"},[e._v("Useful Links")]),e._v(" "),a("section",[a("v-card",[a("v-container",{staticStyle:{"min-height":"0"},attrs:{fluid:"","grid-list-lg":""}},[a("v-layout",{attrs:{row:"",wrap:""}},[a("v-flex",{attrs:{xs12:""}},[a("v-card",{staticClass:"white--text",attrs:{color:"blue-grey darken-2"}},[a("v-card-title",{attrs:{"primary-title":""}},[a("div",{staticClass:"headline"},[e._v("Vuetify Documentation")]),e._v(" "),a("div",[e._v("Vuetify.js is what enables us to easily apply a Material Theme design. The documentation for it\n                   is quite good. Go here to see all the different widgets they have for use.")])]),e._v(" "),a("v-card-actions",[a("a",{attrs:{href:"https://vuetifyjs.com/en/getting-started/quick-start",target:"_blank"}},[a("v-btn",{attrs:{flat:"",dark:""}},[e._v("Show me teh Docs!")])],1)])],1)],1),e._v(" "),a("v-flex",{attrs:{xs12:""}},[a("v-card",{staticClass:"white--text",attrs:{color:"blue-grey darken-2"}},[a("v-card-title",{attrs:{"primary-title":""}},[a("div",{staticClass:"headline"},[e._v("YouTube Tutorial")]),e._v(" "),a("div",[e._v("This is a very long but in-depth series on how the entire stack will work together. It's what\n                   I'm using to learn all this.")])]),e._v(" "),a("v-card-actions",[a("a",{attrs:{href:"https://www.youtube.com/watch?v=Fa4cRMaTDUI&list=PLWKjhJtqVAbnadueQ-C5keMQQiQau_i0D",target:"_blank"}},[a("v-btn",{attrs:{flat:"",dark:""}},[e._v("Video Tutorial")])],1)])],1)],1)],1)],1)],1)],1)])],1)},staticRenderFns:[]};var m=a("VU/8")({name:"HelloWorld",data:function(){return{msg:"Pharmacy Error Tracker Debug Page"}}},f,!1,function(e){a("2ayk")},"data-v-6f96b93a",null).exports,p=a("Xxa5"),h=a.n(p),y=a("exGp"),x=a.n(y),g=a("mtWM"),_=a.n(g),b=a("424j");r.a.use(n.a);var w=new n.a.Store({strict:!0,plugins:[Object(b.a)()],state:{token:null,user:{authlevel:0,email:""},isUserLoggedIn:!1},mutations:{setToken:function(e,t){e.token=t,e.isUserLoggedIn=!!t},setUser:function(e,t){e.user=t},clearUser:function(e){e.user={authlevel:0,email:""}}},actions:{setToken:function(e,t){var a=e.commit;console.log("Setting token: "+t),a("setToken",t)},setUser:function(e,t){var a=e.commit;console.log("Setting user: "+t),a("setUser",t)},logout:function(e){var t=e.commit;console.log("logging out"),t("clearUser"),t("setToken",null)}},getters:{auth:function(e){return console.log("Someone wants the user "+e.user.authlevel),e.user.authlevel}}}),k=function(){return _.a.create({baseURL:"",headers:{Authorization:"Bearer "+w.state.token}})},C=function(e){return k().post("/api/v1/query/error",e)},T=function(){return k().get("/api/v1/query/error")},N=function(){return k().get("/api/v1/query/worker")},P=function(){return k().get("/api/v1/query/errortype")},E=function(){return k().get("/api/v1/query/severity")},q=function(){return k().get("/api/v1/query/medicationtype")},F=function(){return k().get("/api/v1/query/patienttype")},S=function(){return k().get("/api/v1/query/locations")},L={data:function(){return{menu:!1,msg:"Error Form",loading:!1,errorMessage:"",message:"",errorLocations:[],patientTypes:[],errorTypes:[],medicationTypes:[],workers:[],severityLevels:[],datePicker:!1,timePicker:!1,valid:!0,date:"",time:null,patientId:"",patientFirstName:"",patientSurname:"",patientType:"",errorType:"",medication:"",medicationType:"",errorComment:"",workerAtFault:"",workerNotified:!1,errorLocation:"",iimsCompleted:!1,severity:"",wasPhysicianNotified:!1,physicianFirstName:"",physicianSurname:"",providerNumber:"",physicianComment:"",diagnosis:""}},created:function(){P().then(function(e,t){var a;for(this.errorTypes=[],a=0;a<e.data.length;a++)this.errorTypes.push({value:e.data[a].id,text:e.data[a].errorType});this.errorTypes.sort(function(e,t){return e.text.localeCompare(t.text)})}.bind(this)),F().then(function(e,t){var a;for(this.patientTypes=[],a=0;a<e.data.length;a++)this.patientTypes.push({value:e.data[a].id,text:e.data[a].patientType});this.patientTypes.sort(function(e,t){return e.text.localeCompare(t.text)})}.bind(this)),q().then(function(e,t){var a;for(this.medicationTypes=[],a=0;a<e.data.length;a++)this.medicationTypes.push({value:e.data[a].id,text:e.data[a].medicationType});this.medicationTypes.sort(function(e,t){return e.text.localeCompare(t.text)})}.bind(this)),S().then(function(e,t){var a;for(this.errorLocations=[],a=0;a<e.data.length;a++)this.errorLocations.push({value:e.data[a].id,text:e.data[a].errorLocation});this.errorLocations.sort(function(e,t){return e.text.localeCompare(t.text)})}.bind(this)),E().then(function(e,t){var a;for(this.severityLevels=[],a=0;a<e.data.length;a++)this.severityLevels.push({value:e.data[a].id,text:e.data[a].level})}.bind(this)),N().then(function(e,t){var a;for(this.workers=[],a=0;a<e.data.length;a++)if(e.data[a].workerActive){var r=e.data[a].workerSurname+", "+e.data[a].workerFirstName;this.workers.push({value:e.data[a].id,text:r})}this.workers.sort(function(e,t){return e.text.localeCompare(t.text)})}.bind(this))},methods:{submit:function(){var e=this;return x()(h.a.mark(function t(){var a,r,s;return h.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:if(e.errorMessage="",e.message="",!e.validForm()){t.next=18;break}return t.prev=3,a="true"===e.wasPhysicianNotified.valueOf()?1:0,r="true"===e.iimsCompleted.valueOf()?1:0,s="true"===e.workerNotified.valueOf()?1:0,t.next=9,C({errorDate:e.date.valueOf(),errorTime:e.time,patientId:e.patientId,patientFirstName:e.patientFirstName,patientSurname:e.patientSurname,patientType:e.patientType.valueOf(),errortypeId:e.errorType.valueOf(),medicationName:e.medication.valueOf(),medicationtypeId:e.medicationType.valueOf(),generalComment:e.errorComment,errorCausedByWorker:e.workerAtFault.valueOf(),wasWorkerNotified:s,locationId:e.errorLocation.valueOf(),iimsCompleted:r,severityId:e.severity.valueOf(),wasPhysicianNotified:a,physicianFirstName:e.physicianFirstName,physicianSurname:e.physicianSurname,providerNumber:e.providerNumber,physicianComment:e.physicianComment,diagnosis:e.diagnosis});case 9:e.clear(),e.message="Form submitted successfully!",t.next=16;break;case 13:t.prev=13,t.t0=t.catch(3),e.errorMessage=t.t0.response.data.error;case 16:t.next=19;break;case 18:e.errorMessage="There was an error with your form.";case 19:case"end":return t.stop()}},t,e,[[3,13]])}))()},clear:function(){this.$refs.form.reset(),this.message="",this.errorMessage=""},validForm:function(){return this.$refs.form.validate()}}},M={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-layout",{staticClass:"pt-5 top-margin",attrs:{row:""}},[a("v-flex",{attrs:{xs6:"","offset-xs3":""}},[a("section",{staticClass:"page-head"},[a("h1",{staticClass:"display-1 primary--text",attrs:{id:"introduction"}},[e._v("\n        "+e._s(e.msg)+"\n      ")]),e._v(" "),a("fieldset",{staticClass:"white"},[a("v-form",{ref:"form",attrs:{"lazy-validation":""},model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[a("v-container",{attrs:{fluid:""}},[a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs1":""}},[a("v-menu",{ref:"datePicker",attrs:{"close-on-content-click":!1,"nudge-right":40,"return-value":e.date,lazy:"",transition:"scale-transition","offset-y":"","full-width":"","min-width":"290px"},on:{"update:returnValue":function(t){e.date=t}},model:{value:e.datePicker,callback:function(t){e.datePicker=t},expression:"datePicker"}},[a("v-text-field",{attrs:{slot:"activator",label:"Date of Error","prepend-icon":"event",rules:[function(){return!!e.date||"This field is required"}],required:"",readonly:""},slot:"activator",model:{value:e.date,callback:function(t){e.date=t},expression:"date"}}),e._v(" "),a("v-date-picker",{on:{input:function(t){e.$refs.datePicker.save(e.date)}},model:{value:e.date,callback:function(t){e.date=t},expression:"date"}})],1)],1),e._v(" "),a("v-flex",{attrs:{xs8:"","offset-xs1":""}},[a("v-menu",{ref:"timePicker",attrs:{"close-on-content-click":!1,"nudge-right":40,"return-value":e.time,lazy:"",transition:"scale-transition","offset-y":"","full-width":"","max-width":"290px","min-width":"290px"},on:{"update:returnValue":function(t){e.time=t}},model:{value:e.timePicker,callback:function(t){e.timePicker=t},expression:"timePicker"}},[a("v-text-field",{attrs:{slot:"activator",label:"Time of Error","prepend-icon":"access_time",rules:[function(){return!!e.time||"This field is required"}],required:"",readonly:""},slot:"activator",model:{value:e.time,callback:function(t){e.time=t},expression:"time"}}),e._v(" "),a("v-time-picker",{attrs:{format:"24hr"},on:{change:function(t){e.$refs.timePicker.save(e.time)}},model:{value:e.time,callback:function(t){e.time=t},expression:"time"}})],1)],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Patient MRN",rules:[function(){return!!e.patientId||"This field is required"}],required:""},model:{value:e.patientId,callback:function(t){e.patientId=t},expression:"patientId"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Patient First Name",rules:[function(){return!!e.patientFirstName||"This field is required"}],required:""},model:{value:e.patientFirstName,callback:function(t){e.patientFirstName=t},expression:"patientFirstName"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Patient Surname",rules:[function(){return!!e.patientSurname||"This field is required"}],required:""},model:{value:e.patientSurname,callback:function(t){e.patientSurname=t},expression:"patientSurname"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.patientTypes,rules:[function(){return e.patientType>0||"You must select one"}],label:"Select Patient Type",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.patientType,callback:function(t){e.patientType=t},expression:"patientType"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.errorTypes,rules:[function(){return e.errorType>0||"You must select one"}],label:"Select an Error Type",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.errorType,callback:function(t){e.errorType=t},expression:"errorType"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Medication Given",rules:[function(){return!!e.medication||"This field is required"}],required:""},model:{value:e.medication,callback:function(t){e.medication=t},expression:"medication"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.medicationTypes,rules:[function(){return e.medicationType>0||"You must select one"}],label:"Select Medication Type",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.medicationType,callback:function(t){e.medicationType=t},expression:"medicationType"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Error Description or General Comment"},model:{value:e.errorComment,callback:function(t){e.errorComment=t},expression:"errorComment"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.workers,rules:[function(){return e.workerAtFault>0||"You must select one"}],label:"Select Person Who Made Error",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.workerAtFault,callback:function(t){e.workerAtFault=t},expression:"workerAtFault"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("h4",[e._v("Was the person notified?")])])],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-radio-group",{attrs:{mandatory:!1,row:"row"},model:{value:e.workerNotified,callback:function(t){e.workerNotified=t},expression:"workerNotified"}},[a("v-radio",{attrs:{label:"Yes",value:"true"}}),e._v(" "),a("v-radio",{attrs:{label:"No",value:"false"}})],1)],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.errorLocations,rules:[function(){return e.errorLocation>0||"You must select one"}],label:"Where was error detected?",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.errorLocation,callback:function(t){e.errorLocation=t},expression:"errorLocation"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("h4",[e._v("Was an IIMS completed?")])])],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-radio-group",{attrs:{row:"row"},model:{value:e.iimsCompleted,callback:function(t){e.iimsCompleted=t},expression:"iimsCompleted"}},[a("v-radio",{attrs:{label:"Yes",value:"true"}}),e._v(" "),a("v-radio",{attrs:{label:"No",value:"false"}})],1)],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-select",{attrs:{loading:e.loading,items:e.severityLevels,rules:[function(){return e.severity>0||"You must select one"}],label:"Select Severity Level",autocomplete:"","cache-items":"",chips:"",required:""},model:{value:e.severity,callback:function(t){e.severity=t},expression:"severity"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("h4",[e._v("Was the physician notified?")])])],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-radio-group",{attrs:{row:"row"},model:{value:e.wasPhysicianNotified,callback:function(t){e.wasPhysicianNotified=t},expression:"wasPhysicianNotified"}},[a("v-radio",{attrs:{label:"Yes",value:"true"}}),e._v(" "),a("v-radio",{attrs:{label:"No",value:"false"}})],1)],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician Provider Number",disabled:"false"==this.wasPhysicianNotified||0==this.wasPhysicianNotified},model:{value:e.providerNumber,callback:function(t){e.providerNumber=t},expression:"providerNumber"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician First Name",disabled:"false"==this.wasPhysicianNotified||0==this.wasPhysicianNotified},model:{value:e.physicianFirstName,callback:function(t){e.physicianFirstName=t},expression:"physicianFirstName"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician Surname",disabled:"false"==this.wasPhysicianNotified||0==this.wasPhysicianNotified},model:{value:e.physicianSurname,callback:function(t){e.physicianSurname=t},expression:"physicianSurname"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician Comments",disabled:"false"==this.wasPhysicianNotified||0==this.wasPhysicianNotified},model:{value:e.physicianComment,callback:function(t){e.physicianComment=t},expression:"physicianComment"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Diagnosis",disabled:"false"==this.wasPhysicianNotified||0==this.wasPhysicianNotified},model:{value:e.diagnosis,callback:function(t){e.diagnosis=t},expression:"diagnosis"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs12:""}},[a("v-alert",{attrs:{value:e.errorMessage,type:"error"}},[e._v("\n                "+e._s(e.errorMessage)+"\n              ")]),e._v(" "),a("v-alert",{attrs:{value:e.message,type:"success"}},[e._v("\n                "+e._s(e.message)+"\n              ")])],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-btn",{attrs:{round:"",color:"primary",dark:"",disabled:!e.valid},on:{click:e.submit}},[e._v("Submit\n                ")]),e._v(" "),a("v-btn",{attrs:{round:"",color:"secondary",dark:""},on:{click:e.clear}},[e._v("\n                  clear\n                ")])],1)],1)],1)],1)],1)])])],1)},staticRenderFns:[]};var I=a("VU/8")(L,M,!1,function(e){a("E5XW")},"data-v-abad5f7e",null).exports,U=function(e){return k().post("/auth/login",e)},$={data:function(){return{msg:"Please Login",e1:!0,email:"",password:"",valid:!0,message:"",errorMessages:[],rules:{required:function(e){return!!e||"Required."}},error:null,formHasErrors:!1}},computed:{form:function(){return{email:this.email,password:this.password}}},watch:{email:function(){this.errorMessages=[]},password:function(){this.errorMessages=[]}},methods:{login:function(){var e=this;return x()(h.a.mark(function t(){var a;return h.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:if(e.error=null,e.formHasErrors){t.next=14;break}return t.prev=2,t.next=5,U({email:e.email,password:e.password});case 5:a=t.sent,e.$store.dispatch("setToken",a.data.token),e.$store.dispatch("setUser",a.data.user),e.$router.push({name:"Error"}),t.next=14;break;case 11:t.prev=11,t.t0=t.catch(2),e.error=t.t0.response.data.error;case 14:case"end":return t.stop()}},t,e,[[2,11]])}))()},clear:function(){this.$refs.form.reset(),this.error=""}}},D={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-layout",{staticClass:"pt-5 top-margin",attrs:{row:""}},[a("v-flex",{attrs:{xs6:"","offset-xs3":""}},[a("section",{staticClass:"page-head"},[a("h1",{staticClass:"display-1 primary--text",attrs:{id:"introduction"}},[e._v("\n        "+e._s(e.msg)+"\n      ")]),e._v(" "),a("fieldset",{staticClass:"white"},[a("v-form",{ref:"form",attrs:{"lazy-validation":""},model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[a("v-container",{attrs:{fluid:""}},[a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs4:""}},[a("v-subheader",[a("b",[e._v("Enter Email")])])],1),e._v(" "),a("v-flex",{attrs:{xs8:""}},[a("v-text-field",{attrs:{name:"email",label:"Email",rules:[function(){return!!e.email||"This field is required"}],"error-messages":e.errorMessages,required:"","single-line":""},model:{value:e.email,callback:function(t){e.email=t},expression:"email"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs4:""}},[a("v-subheader",[a("b",[e._v("Enter Password")])])],1),e._v(" "),a("v-flex",{attrs:{xs8:""}},[a("v-text-field",{attrs:{name:"password",label:"Enter your password",hint:"At least 8 characters",min:"8","append-icon":e.e1?"visibility":"visibility_off","append-icon-cb":function(){return e.e1=!e.e1},type:e.e1?"password":"text",rules:[function(){return!!e.password||"This field is required"}],"error-messages":e.errorMessages,required:"",counter:""},model:{value:e.password,callback:function(t){e.password=t},expression:"password"}})],1)],1)],1),e._v(" "),a("div",{staticClass:"text-xs-center"},[a("v-btn",{attrs:{round:"",color:"primary",dark:"",disabled:!e.valid},on:{click:e.login}},[e._v("Login\n          ")]),e._v(" "),a("v-btn",{attrs:{round:"",color:"secondary",dark:""},on:{click:e.clear}},[e._v("Clear\n          ")]),e._v(" "),a("v-slide-x-reverse-transition",[e.formHasErrors?a("v-tooltip",{attrs:{left:""}},[a("v-btn",{staticClass:"my-0",attrs:{slot:"activator",icon:""},on:{click:e.resetForm},slot:"activator"},[a("v-icon",[e._v("refresh")])],1),e._v(" "),a("span",[e._v("Refresh form")])],1):e._e()],1)],1),e._v(" "),a("br"),e._v(" "),a("v-alert",{attrs:{value:e.error,type:"error"},domProps:{innerHTML:e._s(e.error)}},[e._v("\n          This is a error alert.\n        ")]),e._v(" "),a("br")],1)],1)])])],1)},staticRenderFns:[]};var A=a("VU/8")($,D,!1,function(e){a("bqCl")},"data-v-4bd9e8de",null).exports,O=a("mtWM"),V={data:function(){return{physicianName:"",providerNo:"",physicianComments:"",valid:!0,message:""}},methods:{submit:function(){if(this.validForm()){this.message="";O.post("http://localhost:3000/api/v1/query/physician",{name:this.physicianName,number:this.providerNo,comment:this.physicianComments}).then(function(e){200===e.data.status&&(this.message="Physician added successfully.",this.clear())}.bind(this)).catch(function(e){this.message="There was an error adding the Physician: "+e.stack}.bind(this))}else this.message="There was an error with your form."},clear:function(){this.$refs.form.reset()},validForm:function(){return!0}}},W={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-layout",{staticClass:"pt-5 top-margin",attrs:{row:""}},[a("v-flex",{attrs:{xs6:"","offset-xs3":""}},[a("section",{staticClass:"page-head"},[a("h1",{staticClass:"display-1 primary--text",attrs:{id:"introduction"}},[e._v("\n        Physician Details\n      ")]),e._v(" "),a("fieldset",{staticClass:"white"},[a("v-form",{ref:"form",attrs:{"lazy-validation":""},model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[a("v-container",{attrs:{fluid:""}},[a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs12:""}},[a("v-alert",{attrs:{value:!0,type:"error"}},[e._v("\n                Please note: This form is a non-functional placeholder\n              ")])],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician Name",rules:[function(e){return e.length<=45||"Max 45 characters"}],counter:45},model:{value:e.physicianName,callback:function(t){e.physicianName=t},expression:"physicianName"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Provider Number",rules:[function(e){return e.length<=15||"Max 15 characters"}],counter:15},model:{value:e.providerNo,callback:function(t){e.providerNo=t},expression:"providerNo"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-text-field",{attrs:{label:"Physician Comments",rules:[function(e){return e.length<=150||"Max 150 characters"}],counter:150},model:{value:e.physicianComments,callback:function(t){e.physicianComments=t},expression:"physicianComments"}})],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("v-btn",{attrs:{round:"",color:"primary",dark:"",disabled:!e.valid},on:{click:e.submit}},[e._v("Submit\n              ")]),e._v(" "),a("v-btn",{attrs:{round:"",color:"primary",dark:""},on:{click:e.clear}},[e._v("\n                clear\n              ")])],1),e._v(" "),a("v-flex",{attrs:{xs4:""}},[a("v-btn",{attrs:{to:{name:"viewPhysician"},round:"",color:"primary",dark:""}},[e._v("View All\n              ")])],1)],1),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("p",[e._v(e._s(e.message))])])],1)],1)],1)],1)])])],1)},staticRenderFns:[]};var R=a("VU/8")(V,W,!1,function(e){a("c8CX")},"data-v-cb586cb6",null).exports,Y=a("mtWM"),j={data:function(){return{physicians:[],message:""}},methods:{loadPhysicians:function(){Y.get("http://localhost:3000/api/v1/query/physician").then(function(e){this.physicians=e.data.response,this.message=""}.bind(this))}},beforeMount:function(){this.message="Loading all the Physicians now",this.loadPhysicians()}},z={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-layout",{staticClass:"pt-5 top-margin",attrs:{row:""}},[a("v-flex",{attrs:{xs6:"","offset-xs3":""}},[a("section",{staticClass:"page-head"},[a("h1",{staticClass:"display-1 primary--text",attrs:{id:"introduction"}},[e._v("\n        Physician Details\n      ")])]),e._v(" "),e._l(e.physicians,function(t){return a("v-card",{key:t.idPhysician,staticClass:"white--text top-buffer mb-2",attrs:{color:"blue-grey darken-2"}},[a("v-card-title",{attrs:{"primary-title":""}},[a("div",{staticClass:"headline"},[e._v("Physician Name: "+e._s(t.physicianName))])]),e._v(" "),a("v-card-text",[a("div",[e._v("Provider Number: "+e._s(t.providerNumber)),a("br"),e._v("\n            Comment: "+e._s(t.physicianComment)),a("br")])])],1)}),e._v(" "),a("v-layout",{attrs:{row:""}},[a("v-flex",{attrs:{xs8:"","offset-xs2":""}},[a("p",[e._v(e._s(e.message))])])],1)],2)],1)},staticRenderFns:[]};var H=a("VU/8")(j,z,!1,function(e){a("yfYU")},"data-v-e069ad7e",null).exports,Q={data:function(){return{search:"",errors:[],id:"",generalComment:"",carbs:"",protein:"",headers:[{text:"Error ID",align:"left",sortable:!0,value:"id"},{text:"General Comment",align:"center",value:"generalComment"},{text:"Error Date",align:"center",value:"errorDate"},{text:"Error Time",align:"center",value:"errorTime"},{text:"Patient",align:"center",value:"patientName"},{text:"Physician",align:"center",value:"physicianName"}]}},created:function(){T().then(function(e,t){var a;for(a=0;a<e.data.length;a++)console.log(e.data),this.errors.push({id:e.data[a].id,generalComment:e.data[a].generalComment,errorDate:e.data[a].errorDate,errorTime:e.data[a].errorTime,patientName:e.data[a].patient.patientFirstName+" "+e.data[a].patient.patientSurname,physicianName:e.data[a].physician.physicianFirstName+" "+e.data[a].physician.physicianSurname})}.bind(this))}},G={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-card",[a("v-card-title",[e._v("\n    Search Errors\n    "),a("v-spacer"),e._v(" "),a("v-text-field",{attrs:{"append-icon":"search",label:"Search","single-line":"","hide-details":""},model:{value:e.search,callback:function(t){e.search=t},expression:"search"}})],1),e._v(" "),a("v-data-table",{attrs:{headers:e.headers,items:e.errors,search:e.search},scopedSlots:e._u([{key:"items",fn:function(t){return[a("td",[e._v(e._s(t.item.id))]),e._v(" "),a("td",{staticClass:"text-xs-center"},[e._v(e._s(t.item.generalComment))]),e._v(" "),a("td",{staticClass:"text-xs-center"},[e._v(e._s(t.item.errorDate))]),e._v(" "),a("td",{staticClass:"text-xs-center"},[e._v(e._s(t.item.errorTime))]),e._v(" "),a("td",{staticClass:"text-xs-center"},[e._v(e._s(t.item.patientName))]),e._v(" "),a("td",{staticClass:"text-xs-center"},[e._v(e._s(t.item.errorCausedByWorker))])]}}])},[a("v-alert",{attrs:{slot:"no-results",value:!0,color:"error",icon:"warning"},slot:"no-results"},[e._v('\n      Your search for "'+e._s(e.search)+'" found no results.\n    ')])],1)],1)},staticRenderFns:[]};var X=a("VU/8")(Q,G,!1,function(e){a("hEQT")},"data-v-713a8464",null).exports;r.a.use(d.a);var B=new d.a({routes:[{path:"/",redirect:"/main"},{path:"/main",name:"Main",component:m},{path:"/error",name:"Error",component:I},{path:"/login",name:"Login",component:A},{path:"/physician",name:"Physician",component:R},{path:"/physician/view",name:"viewPhysician",component:H},{path:"/searchError",name:"searchError",component:X}]});B.beforeEach(function(e,t,a){"Login"!==e.name&&null===w.state.token?a("/login"):a()});var J=B,K=a("3EgV"),Z=a.n(K),ee=(a("QCv7"),a("9JMe"));r.a.config.productionTip=!1,r.a.use(Z.a),Object(ee.sync)(w,J),new r.a({el:"#app",router:J,store:w,components:{App:v},template:"<App/>"})},QCv7:function(e,t){},bqCl:function(e,t){},c8CX:function(e,t){},hEQT:function(e,t){},igIz:function(e,t,a){e.exports=a.p+"static/img/PET-image.e677650.png"},p1t7:function(e,t){},yfYU:function(e,t){}},["NHnr"]);
//# sourceMappingURL=app.0b97a91e4108344ee48b.js.map