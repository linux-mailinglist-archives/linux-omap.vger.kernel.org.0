Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F89B3A8360
	for <lists+linux-omap@lfdr.de>; Tue, 15 Jun 2021 16:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhFOO5W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Jun 2021 10:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32382 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhFOO5R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 15 Jun 2021 10:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623768912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7zXHSL7RwyAJWnz3yfpZ7/QXhLd143qN0GShu6MwfqY=;
        b=LPswY7UYynegOESnKAbFuPpsILOcZgOA8gFR0cfxhWy3/NSlVmoIzZMpPPI3dkSCvgnoiz
        q8+3V3Fy8YJfeg5xP+ZZWlXin85Tw1EeTPIqcoyW8doVRlC0QRQVSkEAOazuB1wHMZWlmu
        aHcxAHrA/d2dgI2mdRZwGZ29yYX5pKA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-XFdZ41mZM-qZ-Ojx4R0mDw-1; Tue, 15 Jun 2021 10:55:09 -0400
X-MC-Unique: XFdZ41mZM-qZ-Ojx4R0mDw-1
Received: by mail-ed1-f69.google.com with SMTP id g13-20020a056402090db02903935a4cb74fso16619035edz.1
        for <linux-omap@vger.kernel.org>; Tue, 15 Jun 2021 07:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7zXHSL7RwyAJWnz3yfpZ7/QXhLd143qN0GShu6MwfqY=;
        b=hXlLhhW0EXPt47Rc/9vEOpFzuWoo70MjBoZxXLAuihGVOJISLL8YN+5A2+0i/Obaym
         niKMy1FI44WUhhKX6F/5POL8O0t+kUiakZC5AaF3Ccl/RcX+yOg9GgWptlpm/+YtNA/z
         BxMaDJoA6QK78oUM/bakLMi2n1QODDPmHQ19rgntqlagNHp2GXAgLcmkP93s/Npmk/Ud
         wmkQrNg7DWOWpvl5ajG7ZzTvZwT+3pXNavrFVBSAvSR93YkcqEftLi1A9oxQBa3THQKW
         RF1wiSdKAm3+MyIDN87N4/T/t6QePJwJyU63dx2JOJwYrx3W2wvzpZiQ3JTeSVKQERy7
         CKqA==
X-Gm-Message-State: AOAM531Fl7lN65XdFsokTlR9Gff4zLzxvaUznbMsORcThe7VX8G39tY+
        gMXHhsVFW49HZ1oqegmF7uHhlVzTMG1SqIMdUyI6bmDctCqj/e9Zj6FchUkSat3s3X7zO5SSzto
        v7unrCUeRDP5o5yvuDx1QKQ==
X-Received: by 2002:a05:6402:1652:: with SMTP id s18mr23048016edx.131.1623768908124;
        Tue, 15 Jun 2021 07:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAy/n5Es33Uj8+GjOWq3YRmuEbjhuD5rzEEzzfpqUH7cASDVtLd3bVhCfFDT4UAd0JjxkZnQ==
X-Received: by 2002:a05:6402:1652:: with SMTP id s18mr23047988edx.131.1623768907804;
        Tue, 15 Jun 2021 07:55:07 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id f8sm9985632ejw.75.2021.06.15.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 07:55:05 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 354DC180739; Tue, 15 Jun 2021 16:54:59 +0200 (CEST)
From:   =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     bpf@vger.kernel.org, netdev@vger.kernel.org
Cc:     Martin KaFai Lau <kafai@fb.com>,
        Hangbin Liu <liuhangbin@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH bpf-next v2 16/16] net: ti: remove rcu_read_lock() around XDP program invocation
Date:   Tue, 15 Jun 2021 16:54:55 +0200
Message-Id: <20210615145455.564037-17-toke@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615145455.564037-1-toke@redhat.com>
References: <20210615145455.564037-1-toke@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cpsw driver has rcu_read_lock()/rcu_read_unlock() pairs around XDP
program invocations. However, the actual lifetime of the objects referred
by the XDP program invocation is longer, all the way through to the call to
xdp_do_flush(), making the scope of the rcu_read_lock() too small. This
turns out to be harmless because it all happens in a single NAPI poll
cycle (and thus under local_bh_disable()), but it makes the rcu_read_lock()
misleading.

Rather than extend the scope of the rcu_read_lock(), just get rid of it
entirely. With the addition of RCU annotations to the XDP_REDIRECT map
types that take bh execution into account, lockdep even understands this to
be safe, so there's really no reason to keep it around.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-omap@vger.kernel.org
Tested-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 drivers/net/ethernet/ti/cpsw_priv.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 5862f0a4a975..25fa7304a542 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -1328,14 +1328,13 @@ int cpsw_run_xdp(struct cpsw_priv *priv, int ch, struct xdp_buff *xdp,
 	struct bpf_prog *prog;
 	u32 act;
 
-	rcu_read_lock();
-
 	prog = READ_ONCE(priv->xdp_prog);
-	if (!prog) {
-		ret = CPSW_XDP_PASS;
-		goto out;
-	}
+	if (!prog)
+		return CPSW_XDP_PASS;
 
+	/* This code is invoked within a single NAPI poll cycle and thus under
+	 * local_bh_disable(), which provides the needed RCU protection.
+	 */
 	act = bpf_prog_run_xdp(prog, xdp);
 	/* XDP prog might have changed packet data and boundaries */
 	*len = xdp->data_end - xdp->data;
@@ -1378,10 +1377,8 @@ int cpsw_run_xdp(struct cpsw_priv *priv, int ch, struct xdp_buff *xdp,
 	ndev->stats.rx_bytes += *len;
 	ndev->stats.rx_packets++;
 out:
-	rcu_read_unlock();
 	return ret;
 drop:
-	rcu_read_unlock();
 	page_pool_recycle_direct(cpsw->page_pool[ch], page);
 	return ret;
 }
-- 
2.31.1

