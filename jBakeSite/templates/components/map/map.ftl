<#function getComponnentInfo>
	<#return {"componnentVersion":2, "name":"map", "description":"display a map", "recommandedNamespace":"map", "version":"0.1.0", "require":[{"value":"propertiesHelper", "type":"lib"}, {"value":"map", "type":"contentHeader"}]}>
</#function>

<#global pageUseMap=false />

<#function init>
	<#return "" />
</#function>

<#function registerDefaultHooks()>
	<#return "" />
</#function>

<#function addHeaderScripts()>
<#return "" />
</#function>

<#function addFooterScripts()>
	<#if pageUseMap>
		<#if ressourcesHelper??>
			${ressourcesHelper.addFooterRessource({"tagType":"link", "href":"templates/components/map/copyToAssets/noAgregation/leaflet.css", "order":40, "rel":"stylesheet"})}
			${ressourcesHelper.addFooterRessource({"tagType":"script", "src":"templates/components/map/copyToAssets/noAgregation/leaflet.js", "order":50})}
		<#else>
			<#if logHelper??>
				${logHelper.stackDebugMessage("map.addFooterScripts : ERROR cannot add footer script, missing 'ressourcesHelper' component")}
			</#if>
		</#if>
		<#else>
		<#if logHelper??>
			${logHelper.stackDebugMessage("map.addFooterScripts : map component are not use in this page, no script added")}
		</#if>
	</#if>
	<#return "" />
</#function>

<#macro build theContent>
	<#if (theContent.map)??>
		<#if logHelper??>
			${logHelper.stackDebugMessage("map.build : adding map. Page already contain map component : " + pageUseMap?string("yes","no"))}
		</#if>
		<#global pageUseMap=true />
		
		<div id="${theContent.map.id}"class="customMap" data-map-config="<#escape x as x?xml>${common.toString(theContent.map)}</#escape>"></div>
	</#if>

</#macro>
