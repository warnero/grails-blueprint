<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.plugins.PluginManagerHolder %>
<%=packageName%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<div class="span-24">
  <a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
</div>
<div class="span-24">
  <div class="span-12 append-12">
    <g:if test="\${flash.message}">
      <div class="success">\${flash.message}</div>
    </g:if>
    <g:hasErrors bean="\${${propertyName}}">
      <div class="error">
        <g:renderErrors bean="\${${propertyName}}" as="list"/>
      </div>
    </g:hasErrors>
  </div>

  <div class="span-12 append-12">
    <g:form action="save" method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
      <fieldset>
        <legend><g:message code="default.create.label" args="[entityName]"/></legend>
        <div class="span-10 append-2">
          <% excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
          props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
          Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
          display = true
          boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
          props.each {p ->
            if (!Collection.class.isAssignableFrom(p.type)) {
              if (hasHibernate) {
                cp = domainClass.constrainedProperties[p.name]
                display = (cp ? cp.display : true)
              }
              if (display) { %>
          <p><label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></label>
            ${renderEditor(p)}</p>


          <% }
          }
          } %>
        </div>
        <div class="span-9 first">
          <button type="submit" name="create" id="create" value="\${message(code: 'default.button.create.label', default: 'Create')}">
            \${message(code: 'default.button.create.label', default: 'Create')}
            </button>

        </div>

      </fieldset>
    </g:form>
  </div>
</div>
</body>
</html>
