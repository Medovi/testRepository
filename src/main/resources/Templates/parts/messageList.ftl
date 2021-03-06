<#include "security.ftl">

<div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" style="width: 354px; height: 350px">
            </#if>
            <div class="m-2">
                <strong>${message.tag}</strong>
                    <br/>
                <span>${message.text}</span><br/>
                <br/>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>