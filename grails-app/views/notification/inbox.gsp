<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h5>Notifications</h5>
    </content>
    <content tag="boxContent">
        <div id="wrapper">
            <div class="mail-box-header">
                <h1>
                    Inbox
                </h1>
            </div>
            <div class="mail-box">
                <table class="table table-hover table-mail">
                    <g:each in="${notifications}">
                        <tr class="unread">
                            <td class="check-mail">
                                <input type="checkbox" class="i-checks">
                            </td>
                            <td class="mail-ontact"><a href="mail_detail.html">Apprentice</a></td>
                            <td class="mail-subject"><a href="mail_detail.html">${it.message}</a></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </content>
</g:applyLayout>