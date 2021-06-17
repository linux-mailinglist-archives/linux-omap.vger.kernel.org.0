Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1083ABE0E
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 23:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhFQVaQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 17:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29583 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233070AbhFQVaN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 17:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623965284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=URoBjUEpro9U64xROBMZeKvvFlHbDEw9khuYvYfphMY=;
        b=OCfiPrSpkjdBK1L4Ao3s928FwmsIZVCdW9AO5EhBIKy6GmqNMUSm8PeyjqWZEI2hAUAzOZ
        MR2gtbONZjk9txF7CYtNuZ3MwK3WALyMtnsiGGo/N8peUTiXcurGK98FifEnxoEGYQEhbB
        YdecEcgyJZnlV92uxvTk1ZNV9xPSvr4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-P_7fGGOrNkGyPPD640jgkg-1; Thu, 17 Jun 2021 17:28:02 -0400
X-MC-Unique: P_7fGGOrNkGyPPD640jgkg-1
Received: by mail-ej1-f72.google.com with SMTP id gv42-20020a1709072beab02903eab8e33118so3009682ejc.19
        for <linux-omap@vger.kernel.org>; Thu, 17 Jun 2021 14:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URoBjUEpro9U64xROBMZeKvvFlHbDEw9khuYvYfphMY=;
        b=CVlXXtWmnLhSz9oamzS77l+FDgYuMXN3kE5hZj/OY5agGotTJMC2ngw61C7H+KxufM
         O39Ac144osAOxGA2433XM/GXZ8TH++sZcJcA/MlEd/d1h1KgqVD8eRtmnRDoE5P1D2FM
         Fuygwq9vjoCp+0Znao/OBFlA0itP3vXbSbejkNPTUGTaOSwjA9EMiHxSJvjczrkcLM17
         hLrkJD+X9GR+4zX+szy4CdC4DrSJ3/DuXz+H4uMXa4ltf4XpEKWJKnQH77hzxZzx2Elo
         InAfx2nJyOZ2fl4d2mOYogf15wE2R9xW7IkTGCDCod5/9B+QDcNHI/Dutiu9YruirzFm
         Yfig==
X-Gm-Message-State: AOAM533bv04beJaQh6iTNUlGTbOqcsZpPlyl8O8bXLExiRi7TKIFMPLg
        nqMcd9QxCcUpZq6fT6NoQnB70LZnzbKUzsu5FCRXkWvZrOxYYB7wqVkuV8/Zj3BPz/vGsjKZRl1
        DcrOf8CHGKkTNYX9MXgW82g==
X-Received: by 2002:a17:906:1c4e:: with SMTP id l14mr7493122ejg.172.1623965281349;
        Thu, 17 Jun 2021 14:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBED07LUChvl53lkxSTodZZSwtVeK7ggiDn0AD9irgpsF1jIRBNNK0HPoUFkO1vHM4IXH08A==
X-Received: by 2002:a17:906:1c4e:: with SMTP id l14mr7493097ejg.172.1623965281090;
        Thu, 17 Jun 2021 14:28:01 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id og6sm94201ejc.108.2021.06.17.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:27:59 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E3BD4180739; Thu, 17 Jun 2021 23:27:54 +0200 (CEST)
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
Subject: [PATCH bpf-next v3 16/16] net: ti: remove rcu_read_lock() around XDP program invocation
Date:   Thu, 17 Jun 2021 23:27:48 +0200
Message-Id: <20210617212748.32456-17-toke@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617212748.32456-1-toke@redhat.com>
References: <20210617212748.32456-1-toke@redhat.com>
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
2.32.0

