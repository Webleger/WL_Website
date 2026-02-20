<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"block", "description":"Add blocks in content", "recommandedNamespace":"block", "version":"0.1.0", "require":[{"value":"sequenceHelper", "type":"lib"}, {"value":"hookHelper", "type":"lib"}, {"value":"common", "type":"lib"}, {"value":"org_openCiLife_blocks", "type":"contentType"}], "uses":[{"value":"langHelper", "type":"lib"}, {"value":"logHelper", "type":"lib"}, {"value":"subTemplate", "type":"contentHeader"}]}>
</#function>

<#function init>
	<#return "" />
</#function>


<#macro build theContent>
	<#if (theContent.includeBlocks)?? && (theContent.includeBlocks.category)??>
		<#local displayToc="">
		<#if (theContent.includeBlocks)?? && (theContent.includeBlocks.toc)??>
			<#local displayToc = theContent.includeBlocks.toc>
		</#if>
		<@buildWithCategory theContent.includeBlocks.category "order" displayToc/>
	</#if>
</#macro>


<#assign allGeneratedAnchorIdByTitle = []>
<#-- build a content with blocks
    @param categoryFilter category to filter to get blocks. "config.site_homepage_category" for HomePage.
-->
<#macro buildWithCategory categoryFilter orderBy="order" displayToc="">
	<#local blocks = org_openCiLife_blocks?filter(b -> b.status=="published")?filter(b-> sequenceHelper.seq_containsOne(b.category!"__empty_categ__", categoryFilter))>
	<#if (langHelper)??>
		<#local blocks = blocks?filter(ct -> langHelper.isCorectLang(ct, langHelper.getLang(content)))>
	</#if>
	
	<#if logHelper??>
		<@logHelper.debug "Blocks : display block for " + categoryFilter + " (published, filtered by lang if resquired) with " + blocks?size + " blocks"/>
	</#if>
	
	<#if displayToc?has_content>
		<#if logHelper??>
	 		${logHelper.stackDebugMessage("Blocks : display TOC for ${content.uri} with value " + common.toString(displayToc))}
	 	</#if>
		<#local subTemplateName = "defaultTocSubTemplate">
		<#if (displayToc.subTemplate??)>
			<#local subTemplateName=displayToc.subTemplate>
		</#if>
		
		<#local subTemplateInterpretation = "<@${subTemplateName} displayToc blocks orderBy />"?interpret>
		<@subTemplateInterpretation/>
	</#if>	
	
	<#list blocks?sort_by(orderBy) as block>
		<#local blockCategory = block.category!"__empty_categ__">
		<#if (sequenceHelper.seq_containsOne(blockCategory, categoryFilter))>
	 		<#local uselessTempVar = commonInc.propagateContentChain(block) />
			<#local subTemplateName = "defaultBlockSubTemplate">
			<#if (block.subTemplate??)>
				<#local subTemplateName=block.subTemplate>
			</#if>
			
			<#local subTemplateInterpretation = "<@${subTemplateName} block />"?interpret>
			<@subTemplateInterpretation/>
		</#if>
  	</#list>
  	<#assign allGeneratedAnchorIdByTitle = []>
</#macro>

<#macro defaultTocSubTemplate displayToc blocks blocksOrderBy>
	<@blockTocUlLiWithLinkSubTemplate displayToc blocks blocksOrderBy />
</#macro>

<#macro blockTocUlLiWithLinkSubTemplate displayToc blocks blocksOrderBy>
	<div class="toc">
		<#local endTag="">
		<@displayTocTitle displayToc />
		
		<ul class="toc_list">
		<#list blocks?sort_by(blocksOrderBy) as blockForToc>
			<#local uri = buildTocUri(blockForToc)>
			<#if uri?has_content>
				<a href="${uri}">
				<#local endTag="</a>">
			</#if>
			<li class="toc_item">${blockForToc.title}</li>
			${endTag}
		</#list>
		</ul>
	</div>
</#macro>

<#macro blockTocSelectSubTemplate displayToc blocks blocksOrderBy>
	<div class="toc">
		<#local endTag="">
		<select class="toc_list toc-select">
		<option value="">--${displayToc.title!"Choisir"}--</option>
		<#list blocks?sort_by(blocksOrderBy) as blockForToc>
			<#local uri = buildTocUri(blockForToc)>
			<option value="${uri}" class="toc_item">${blockForToc.title}</option>
			${endTag}
		</#list>
		</select>
	</div>
</#macro>

<#macro displayTocTitle displayToc>
	<#local tocTitle = displayToc.title!"">
	<#if tocTitle?has_content>
		<h3 class="toc_title">${tocTitle}</h3>
	</#if>
</#macro>

<#function buildTocUri block>
	<#local uri = "">
	<#if (block.anchorId)??>
		<#local uri = "#" + block.anchorId>
	<#else>
		<#local generatedAnchorId = common.randomNumber()>
		<#assign allGeneratedAnchorIdByTitle = allGeneratedAnchorIdByTitle + [{"title":block.title, "anchorId":generatedAnchorId}]>
		<#local uri = "#" + generatedAnchorId>
	</#if>
	<#return uri>
</#function>

<#function getGeneratedAnchorId blockTitle>
	<#if logHelper??>
 		${logHelper.stackDebugMessage("Blocks TOC : searching for the eventually generated ID for : '${blockTitle}' in ${allGeneratedAnchorIdByTitle?size} generatedIds")}
 	</#if>
	<#local anchorId = "">
	<#list allGeneratedAnchorIdByTitle as  generatedAnchorIdByTitle>
		<#if generatedAnchorIdByTitle.title == blockTitle>
			<#local anchorId = generatedAnchorIdByTitle.anchorId>
			<#break>
		</#if>
	</#list>
	<#return anchorId>
</#function>

<#macro generateAnchor block>
	<#local theAnchorId = "">
	<#if (block.anchorId)??>
		<#local theAnchorId = block.anchorId>
	<#else>
		<#local theGeneratedAnchorId = getGeneratedAnchorId(block.title)>
		<#if theGeneratedAnchorId?has_content>
			<#local theAnchorId = theGeneratedAnchorId>
		</#if>
	</#if>
	<#if theAnchorId?has_content>
		id="<#escape x as x?xml>${theAnchorId}</#escape>"<#rt>
	</#if>
</#macro>

<#macro generateCssClass block customCssClass="">
	<#local classes = "block">
	<#if (block.specificClass)?? && block.specificClass?has_content>
		<#local classes = classes + " " + block.specificClass>
	</#if>
	<#if (customCssClass)?? && customCssClass?has_content>
		<#local classes = classes + " " + customCssClass>
	</#if>
	<#lt>class="<#escape x as x?xml>${classes}</#escape>"
</#macro>

<#macro generateTitle block contentImageBefore=false>
	<#if (block.title)?? && block.title?has_content && !((block.displayTitle)?? && block.displayTitle == "false")>
		<#local titleTag = "h2">
		<#if (block.titleTag)??>
			<#local titleTag = block.titleTag>
		</#if>
		<${titleTag} class="blockTitle"><#escape x as x?xml>
		<#if (block.beforeTitleImage?has_content)>
			<@common.addImageIcon block.beforeTitleImage "block_title_image" block.title/>
		</#if>
		<#if (contentImageBefore)>
			<@common.addImageIcon block.contentImage "block_title_image" block.title/>
		</#if>
		${block.title}</#escape>
		</${titleTag}>
	</#if>
</#macro>

<#macro generateBodyContent block>
	<#if hookHelper??>
		<@hookHelper.hook "beforeBlockContent" block/>
	</#if>
	<div class="blockContent">
		<#if hookHelper??>
			<@hookHelper.hook "beforeBlockBody" block/>
		</#if>
		${block.body}
		<#if hookHelper??>
			<@hookHelper.hook "afterBlockBody" block/>
		</#if>
	</div>
	<#if hookHelper??>
		<@hookHelper.hook "afterBlockContent" block/>
	</#if>
</#macro>

<#macro defaultBlockSubTemplate block>
	<@imageRightSubTemplate block />
</#macro>

<#macro imageRightSubTemplate block>
	<div <@generateAnchor block/> <@generateCssClass block "imageRightSubTemplate"/>>
		<@generateTitle block/>
		<div class="blockBody">
			<@generateBodyContent block/>
			<#if (block.contentImage)??>
				<@common.addImageIcon block.contentImage "blockIcon" block.title/>
			</#if>
		</div>
	</div>
</#macro>

<#macro imageLeftSubTemplate block>
	<div <@generateAnchor block/> <@generateCssClass block "imageLeftSubTemplate"/>>
		<@generateTitle block/>
		<div class="blockBody">
			<#if (block.contentImage)??>
				<@common.addImageIcon block.contentImage "blockIcon" block.title/>
			</#if>
			<@generateBodyContent block/>
		</div>
	</div>
</#macro>

<#macro imageLeftTitleAndContentSubTemplate block>
	<div <@generateAnchor block/> <@generateCssClass block "imageLeftTitleAndContentSubTemplate"/>>
		<#if (block.contentImage)??>
				<@common.addImageIcon block.contentImage "blockIcon" block.title/>
		</#if>
		<div class="groupe_content">
			<@generateTitle block/>
			<div class="blockBody">
				<@generateBodyContent block/>
			</div>
		</div>
	</div>
</#macro>

<#macro imageRightTitleAndContentSubTemplate block>
	<div <@generateAnchor block/> <@generateCssClass block "imageRightTitleAndContentSubTemplate"/>>
		<div class="groupe_content">
			<@generateTitle block/>
			<div class="blockBody">
				<@generateBodyContent block/>
			</div>
		</div>
		<#if (block.contentImage)??>
				<@common.addImageIcon block.contentImage "blockIcon" block.title/>
		</#if>
	</div>
</#macro>

<#macro imageBeforeTitleSubTemplate block customCssStyle="">
	<div <@generateAnchor block/> <@generateCssClass block "imageBeforeTitleSubTemplate"/> <#if customCssStyle?has_content>style="${customCssStyle}"</#if>>
		<@generateTitle block true/>
		<div class="blockBody">
			<@generateBodyContent block/>
		</div>
	</div>
</#macro>

<#macro noImageSubTemplate block customCssStyle="">
	<div <@generateAnchor block/> <@generateCssClass block "noImageSubTemplate"/> <#if customCssStyle?has_content>style="${customCssStyle}"</#if>>
		<@generateTitle block/>
		<div class="blockBody">
			<@generateBodyContent block/>
		</div>
	</div>
</#macro>

<#macro backGroundImageCoverSubTemplate block>
	<#local customCssStyle = "background-image: url('"+common.buildRootPathAwareURL(block.contentImage)+"'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
	<@noImageSubTemplate block customCssStyle/>
</#macro>


<#macro backGroundImageContainSubTemplate block>
	<#local customCssStyle = "background-image: url('"+common.buildRootPathAwareURL(block.contentImage)+"'); background-repeat: no-repeat; background-size: contain;">
	<@noImageSubTemplate block customCssStyle/>
</#macro>

