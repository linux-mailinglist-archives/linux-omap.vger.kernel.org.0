Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B49410B09D
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0NwS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 08:52:18 -0500
Received: from mout.gmx.net ([212.227.15.18]:48967 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbfK0NwS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 Nov 2019 08:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1574862737;
        bh=RPTDT6syTQYYYHG1OKLmi7Oe4+fydbnErDZ/vfI+zJQ=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=MJnVobjl8ILATdyhQU/orqVJ0YYQJt9VYoQyy//lKN7VQn3p2cz1GmcRxFi4KTyIO
         PiH9m5+E1CXdX8Y2iCsfKzCC8+dqiqM8sA0r5oK40gxaVHOxMaAfNgVk3cXAqPEY+J
         ma9COG0pnJeR/TO+irqGfyU6UDzkfunw55KoysSU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.150.99.66] ([80.150.99.66]) by web-mail.gmx.net
 (3c-app-gmx-bs22.server.lan [172.19.170.74]) (via HTTP); Wed, 27 Nov 2019
 14:52:17 +0100
MIME-Version: 1.0
Message-ID: <trinity-3f97833c-0914-4f86-8e16-2bfb4ad6dab3-1574862737086@3c-app-gmx-bs22>
From:   deffo@gmx.de
To:     linux-omap@vger.kernel.org
Subject: twl: not initialized and twl6030_uv_to_vsel problems
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 27 Nov 2019 14:52:17 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:2lt/7e92lUlboGGg70Xkx7tGEy2AOWbBF8Hn18MzEG+nMB0oDZhcQpo9E8P60sfhZtrmw
 o11SkRtUbw+KKbta1CJL1hjKx6kxasUYFrpFeerJ51InytPnT0w0iAW0QcvoXHgqnw1tTYSqpqsY
 0Osx8EoiThnv7P6cg+s9Czx4GjBA8lM2vR8P8BSy/HxtyyWCADavB9akmTpoUf3fWMPtIxkzl4/m
 Rc2xdLrdBVdPd2yN3kxqfqPw1eHijgIXG7FIE02cwLo0l2nlCTP+9F1p9dBrZBzo6qzCu9iliJpA
 ww=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KG8s7TiBxuc=:7DpqkPFIw5cix11YkrAB1o
 tH1WrKZFzCArbsb9JT5lj4FhADSd82pB1xgFTjqsgWXNd99/wpg9aVZJvVDr4D3ehNmL3mDsg
 +6Q7Rj43Xiy6Cyrbd/AdqpLwBGXMIYIL0I9RM18IsiWbJSxvlQvWSOZuVa1khGzjLlVlk96JR
 mscX7uPa4VZkPW2BwMP9OEQlkNWkqryBuxk9E+XQeUICcTZC67diDtKmt+ndmBLt250KXVk8T
 lo/onbmlK0wpLa+J/T81hdHUJxG1CP2GwCM0unM+fR/0QQBEB+AgGWLaCxSYrsv32glk61csw
 ulb3JznQiOcHOqTlJzOvy8u8rjuWw3Sm2kgFauBpjyM+f9hTHjYGg/VL/TGboKNDxt6yosigD
 l7JdlfGdHqoY7CgZc1dsol9yoRXl2JH56Az6CneJ235R78OAPQiCz0397PGLs/ZA7aBFXPRzP
 M4Qds/jaQ1Uth+b/nTa3qDeyz39eWe5tUJWw7of6/1jSz71/XaR5vVAqzGC+TaDecp+A9RtyK
 pISNG9u9U5C0xQmBlthec9bpKL1pFk8A1y9l8xcif9Z/VDuS9LqvxLPgAw6DHHy7wivJNvGXz
 zuzW2bXEFQXISejDyqbFTlMt0IVdooJnWnlO4g+YFYbgJrs+exE7b5OlzjF1hsHJTBTb6B19i
 sWzJCeDjFlg/eLgdi0kdnp3ZcwGvPKRCNsr+7rNvE4zAuwA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

hi there!

i'm using the TI OMAP4460 (VAR-SOM-OM44) and i get several errors in dmesg on the latest for-next branch:

root@localhost:~# dmesg -l err
[    1.146026] twl: not initialized
[    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146179] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146209] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146270] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146301] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
[    1.146331] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1410000 Vs max 1316660
[    1.522979] omap_dm_timer_set_source: timer_sys_ck not found

which probably leads to the problem, that the cpu cannot run with more than 920 mhz. is this a known problem?

i need to run the cpus with 1.5 ghz, as it was possible with the v3.4 kernel, how is this possible?

best regards
