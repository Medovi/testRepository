<#import "parts/common.ftl" as c>

<@c.page>
  <div class="form-row">
    <div class="form-group col-md-6">
      <form method="get" action="/main" class="form-inline">
        <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по категориям">
        <button type="submit" class="btn btn-primary ml-2">Поиск</button>
      </form>
    </div>
  </div>
<#--  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">-->
<#--    Добавить блюдо-->
<#--  </a>-->

  <#include "parts/security.ftl">

  <div class="card-columns">
    <#list messages as message>
      <div class="card my-3">
        <#if message.filename??>
          <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
          <span>${message.text}</span>
          <br/>
          <strong>${message.tag}</strong>
        </div>
        <div class="card-footer text-muted">
          <a href="/user-messages/${message.author.id}">${message.authorName}</a>
          <#if (message.author.id == currentUserId||isAdmin)>
            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
              Изменить
            </a>
            <a class="btn btn-warning" href="/del-user-messages/${message.author.id}?message=${message.id}">Удалить</a>
            <#include "parts/messageEdit.ftl">
          </#if>
        </div>
      </div>
    <#else>
      Нет блюд
    </#list>
  </div>
</@c.page>