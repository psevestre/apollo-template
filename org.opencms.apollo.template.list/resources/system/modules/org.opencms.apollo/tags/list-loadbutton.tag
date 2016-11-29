<%@ tag display-name="list-loadbutton"
  trimDirectiveWhitespaces="true" 
  body-content="empty"
  description="Shows a load button for dynamic list pagination based on search results."%>

<%@ attribute name="search" type="org.opencms.jsp.search.result.I_CmsSearchResultWrapper" required="true" 
		description="The result of a previous search using the cms:search tag." %>
<%@ attribute name="label" type="java.lang.String" required="false" 
		description="The text shown on the load button." %>
<%@ attribute name="arialabel" type="java.lang.String" required="false" 
		description="The text used for the ARIA label of the button." %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${search.numFound > 0}">

	<%-- ####### Show load button if further entries exist ######## --%>

	<c:set var="pagination" value="${search.controller.pagination}" />
	<!-- show pagination if it should be given and if it's really necessary -->
	<c:if test="${not empty pagination && search.numPages > 1}">
		<c:set var="next">${ pagination.state.currentPage + 1}</c:set>
		<c:if test="${search.numPages+1 != next}">
			<div class="paginationWrapper pagination col-xs-12" data-dynamic="true">
				<c:set var="pages">${search.numPages}</c:set>
				<button
					class="loadMore btn ap-btn animated col-xs-12 mt-5 mb-20 ${pagination.state.currentPage >= search.numPages ? ' disabled' : ''}"
					aria-label='${arialabel}'
					data-load="${search.stateParameters.setPage[next]}"
					onclick="appendInnerList($(this).attr('data-load'), $(this).parents().find('.ap-list-content'));">
					<span aria-hidden="true">${label}</span>
				</button>
			</div>
		</c:if>
	</c:if>
	
</c:if>
