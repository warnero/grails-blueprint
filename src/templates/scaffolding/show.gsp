<% import grails.persistence.Event %>
<%=packageName%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="span-24">
  <a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
  <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
</div>
<div class="span-12 append-12">
  <g:if test="\${flash.message}">
    <div class="notice">\${flash.message}</div>
  </g:if>
  <div class="span-12 append-12">

    <fieldset>
      <legend><g:message code="default.show.label" args="[entityName]"/></legend>
      <div class="span-10">
        <% excludedProps = Event.allEvents.toList() << 'version'
        props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.each {p -> %>
        <p><strong><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></strong>:&nbsp;
        <% if (p.isEnum()) { %>
        \${${propertyName}?.${p.name}?.encodeAsHTML()}
        <% } else if (p.oneToMany || p.manyToMany) { %>

        <ul>
          <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
            <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
          </g:each>
        </ul>
        <% } else if (p.manyToOne || p.oneToOne) { %>
        <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
        <% } else if (p.type == Boolean.class || p.type == boolean.class) { %>
        <g:formatBoolean boolean="\${${propertyName}?.${p.name}}"/>
        <% } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
        <g:formatDate date="\${${propertyName}?.${p.name}}"/>
        <% } else { %>
        \${fieldValue(bean: ${propertyName}, field: "${p.name}")}
        <% } %>
      </p>
        <% } %>
      </div>
      <g:form>
        <g:hiddenField name="id" value="\${${propertyName}?.id}"/>
        <div class="span-9 first">
          <button type="submit" name="_action_delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
            \${message(code: 'default.button.delete.label', default: 'Delete')}
            </button>
          <button type="submit" name="_action_edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}">
            \${message(code: 'default.button.edit.label', default: 'Edit')}
            </button>
        </div>
      </g:form>
    </fieldset>
  </div>
</div>
</body>
</html>
