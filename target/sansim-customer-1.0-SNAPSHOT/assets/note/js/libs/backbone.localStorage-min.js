/**
 * Backbone localStorage Adapter
 * Version 1.1.6
 *
 * https://github.com/jeromegn/Backbone.localStorage
 */(function(a,b){typeof exports=="object"&&a.require?module.exports=b(require("underscore"),require("backbone")):typeof define=="function"&&define.amd?define(["underscore","backbone"],function(c,d){return b(c||a._,d||a.Backbone)}):b(_,Backbone)})(this,function(a,b){function c(){return((1+Math.random())*65536|0).toString(16).substring(1)}function d(){return c()+c()+"-"+c()+"-"+c()+"-"+c()+"-"+c()+c()+c()}return b.LocalStorage=window.Store=function(a){if(!this.localStorage)throw"Backbone.localStorage: Environment does not support localStorage.";this.name=a;var b=this.localStorage().getItem(this.name);this.records=b&&b.split(",")||[]},a.extend(b.LocalStorage.prototype,{save:function(){this.localStorage().setItem(this.name,this.records.join(","))},create:function(a){return a.id||(a.id=d(),a.set(a.idAttribute,a.id)),this.localStorage().setItem(this.name+"-"+a.id,JSON.stringify(a)),this.records.push(a.id.toString()),this.save(),this.find(a)},update:function(b){return this.localStorage().setItem(this.name+"-"+b.id,JSON.stringify(b)),a.include(this.records,b.id.toString())||this.records.push(b.id.toString()),this.save(),this.find(b)},find:function(a){return this.jsonData(this.localStorage().getItem(this.name+"-"+a.id))},findAll:function(){return(a.chain||a)(this.records).map(function(a){return this.jsonData(this.localStorage().getItem(this.name+"-"+a))},this).compact().value()},destroy:function(b){return b.isNew()?!1:(this.localStorage().removeItem(this.name+"-"+b.id),this.records=a.reject(this.records,function(a){return a===b.id.toString()}),this.save(),b)},localStorage:function(){return localStorage},jsonData:function(a){return a&&JSON.parse(a)},_clear:function(){var b=this.localStorage(),c=new RegExp("^"+this.name+"-");b.removeItem(this.name),(a.chain||a)(b).keys().filter(function(a){return c.test(a)}).each(function(a){b.removeItem(a)}),this.records.length=0},_storageSize:function(){return this.localStorage().length}}),b.LocalStorage.sync=window.Store.sync=b.localSync=function(a,c,d){var e=c.localStorage||c.collection.localStorage,f,g,h=b.$.Deferred&&b.$.Deferred();try{switch(a){case"read":f=c.id!=undefined?e.find(c):e.findAll();break;case"create":f=e.create(c);break;case"update":f=e.update(c);break;case"delete":f=e.destroy(c)}}catch(i){i.code===22&&e._storageSize()===0?g="Private browsing is unsupported":g=i.message}return f?(d&&d.success&&(b.VERSION==="0.9.10"?d.success(c,f,d):d.success(f)),h&&h.resolve(f)):(g=g?g:"Record Not Found",d&&d.error&&(b.VERSION==="0.9.10"?d.error(c,g,d):d.error(g)),h&&h.reject(g)),d&&d.complete&&d.complete(f),h&&h.promise()},b.ajaxSync=b.sync,b.getSyncMethod=function(a){return a.localStorage||a.collection&&a.collection.localStorage?b.localSync:b.ajaxSync},b.sync=function(a, c, d){return b.getSyncMethod(c).apply(this,[a,c,d])},b.LocalStorage});