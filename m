Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91AF441C28
	for <lists+linux-omap@lfdr.de>; Mon,  1 Nov 2021 15:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhKAOHK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Nov 2021 10:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhKAOHJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Nov 2021 10:07:09 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90643C061766
        for <linux-omap@vger.kernel.org>; Mon,  1 Nov 2021 07:04:36 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id u33so4410520pfg.8
        for <linux-omap@vger.kernel.org>; Mon, 01 Nov 2021 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=o1NeXDfxd5eFMhMhBXrMUaHR3VNkybzQjzcF7o4n7Iw=;
        b=P3plmEuDWMo2nq/h5T8NOdkpbcI1Ib9EuhLtYW9+eoq3vDif/zLQTH8pYaxep8GqCv
         NhELriIn0Mj/fzE7KAwelvfD27lY8j5VB0+oRpfJNfdrhQVUgmH8sZRpMCOlhgURToJ3
         cGp/dVchNIsy7uuzvdDho5e7M+OGSsUnp1+vFFuaHOYbMjrTX7vwQR2lZqq4oyLeUHKS
         rEZtND/K0jCrB30eNqdYBzq19KcJX9iYdyZTs3zAz5lla7Mgskc6efTNBQoj05FX6Qce
         zoEMUs627s4KK/fPxG+RR4vkCL2fWCocj5O7eP0CMJGXeE/zCC4Pf9fARX68eXPgZJng
         tT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=o1NeXDfxd5eFMhMhBXrMUaHR3VNkybzQjzcF7o4n7Iw=;
        b=oDPxn9mGUJIUIQ72nw15X9xIxBFI+DRjhThnc1J/lBSttbSH60oW8rJTD7nhQvjVZz
         jsllw+VtIoG6k5/7hfAMGgufqiOGZdJJcWXSXeTmxsLBVVx8hL3iIOIy2g5l0iphrd3E
         LTYIu7W44YJv8FbEPXWQi66sRzOIlX2LuWi40e91yGj/Iys71n4khtCyM+h/offykKVI
         /ScXCZkgHebAcwrPInya/OehecjcNAYfslwKTGjd57VuzwWL0dQ8hF6KSn3/lCyo3rsI
         DMUkFYYokiREpsplg5v6SsY1LP6qJiq866bY3rCj4v4RgvPVcz6Ol5HaVaOJtP3eLMRA
         duow==
X-Gm-Message-State: AOAM530mEbhpKrBhn/Pi1qJoy70o2oyGjTCYutSHh7MrwVkeuTXIZII2
        fEtLzUiiN8s3qmNNnqr6V0gsMMADU6nqI3EoP+0=
X-Received: by 2002:a05:6a00:2390:b0:44d:bccd:7bc with SMTP id
 f16-20020a056a00239000b0044dbccd07bcmt22346102pfc.4.1635775476110; Mon, 01
 Nov 2021 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211101092134.3357661-1-bigunclemax@gmail.com>
In-Reply-To: <20211101092134.3357661-1-bigunclemax@gmail.com>
From:   Maxim Kiselev <bigunclemax@gmail.com>
Date:   Mon, 1 Nov 2021 17:03:56 +0300
Message-ID: <CALHCpMjqL2i8rJBR1vVnW1orrY1Y6rSdmKGnL6uNE6tSa6jNYQ@mail.gmail.com>
Subject: Re: [PATCH] net: davinci_emac: Fix interrupt pacing disable
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Colin Ian King <colin.king@canonical.com>,
        Yufeng Mo <moyufeng@huawei.com>,
        Michael Walle <michael@walle.cc>, Sriram <srk@ti.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From ca26bf62366f249a2ed360b00c1883652848bfdc Mon Sep 17 00:00:00 2001
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 1 Nov 2021 16:37:12 +0300
Subject: [PATCH v2] net: davinci_emac: Fix interrupt pacing disable

This patch allows to use 0 for `coal->rx_coalesce_usecs` param to
disable rx irq coalescing.

Previously we could enable rx irq coalescing via ethtool
(For ex: `ethtool -C eth0 rx-usecs 2000`) but we couldn't disable
it because this part rejects 0 value:

       if (!coal->rx_coalesce_usecs)
               return -EINVAL;

Fixes: 84da2658a619 ("TI DaVinci EMAC : Implement interrupt pacing
functionality.")

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
Changes v1 -> v2 (after review of Grygorii Strashko):

 - Simplify !coal->rx_coalesce_usecs handler

---
 drivers/net/ethernet/ti/davinci_emac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c
b/drivers/net/ethernet/ti/davinci_emac.c
index e8291d8488391..d243ca5dfde00 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -420,8 +420,20 @@ static int emac_set_coalesce(struct net_device *ndev,
        u32 int_ctrl, num_interrupts = 0;
        u32 prescale = 0, addnl_dvdr = 1, coal_intvl = 0;

-       if (!coal->rx_coalesce_usecs)
-               return -EINVAL;
+       if (!coal->rx_coalesce_usecs) {
+               priv->coal_intvl = 0;
+
+               switch (priv->version) {
+               case EMAC_VERSION_2:
+                       emac_ctrl_write(EMAC_DM646X_CMINTCTRL, 0);
+                       break;
+               default:
+                       emac_ctrl_write(EMAC_CTRL_EWINTTCNT, 0);
+                       break;
+               }
+
+               return 0;
+       }

        coal_intvl = coal->rx_coalesce_usecs;

-- 
2.30.2
