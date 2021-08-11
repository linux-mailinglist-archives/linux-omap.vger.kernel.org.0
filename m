Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274973E86FE
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 02:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbhHKAGg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 20:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235664AbhHKAGg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 20:06:36 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32948C061765
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:06:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n12so758397edx.8
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 17:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kKZrKj1gK2JVjgpkPE9ohM228G2m2HBu952S74N44Vs=;
        b=Cux/gMvrRNO2HATdjnob6imt8mMVAGTQmT86dWANq4iTKsHzaVtKLDmmajLU8ikNDL
         KMdFWJ2GFrRGcmalqcthro7bxL2seNe88P6+mTkdyC8bmeVwCX6JjwgQGxZ1KaGwbwdW
         L+uZNCiNyYIbBdzfnznVirDH0NrrvdG3K3Q81cYBUFauLqmzG8yAMCIKYEgjmpU4QuQf
         Em/sPSslWDHyWKSaELyR5McDMutSBSVnlptlLFrID/ilzAxNm2NopzyvH+zieFCihu78
         BYUi6bxtjObr3uePU4rACZovdT7S12zycw/W/YPKtfIj8XGHvIUGo7wuR6JFqwakrisX
         SCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kKZrKj1gK2JVjgpkPE9ohM228G2m2HBu952S74N44Vs=;
        b=B5kQ9rVY3KJI7Q4mONweAPkpOGyP4/3d+2mouwy7nXW+fdwWJZIoOswZ6PrhlPduf2
         TB75ufZKWM9vwQdsrv/Y3H/Rc7bkJQMyMbIgwiNNN8TaHvCkW9M6tVWBnUxx3POap6c3
         l2nLCNcPXBr0GDivdrKb5uBmlCgpOG5nV/FZNLz1cdr4Aq0BxCCo3bh5q87q5DNl7kDn
         gq/EH94oqfdJebYo3OniLZPLb6W8b0AaODZnpzBcKHW/tnhI5ci/XIoktIShgAE/bzpK
         JLo0s4kwL0ifxr+nbvknVxuWM7+p30my+b+4FJ8B9X9284t22PQ3EGrxSWxh3LK/sgv6
         RmmA==
X-Gm-Message-State: AOAM5333GJ5ArEj8I7nRNEmyTuxQgjTJX6QCY/Crd0swhAlBS3bUtM0Z
        BVtpYKdsTi/YiQauFq85CxdYfg==
X-Google-Smtp-Source: ABdhPJz7HdfIddaOCIvK/ddHtTxrTrM+ZkjX/SBf9dxbShsEj3/D57ML44PxbJ/ZfWi4TfkRg5Gmpw==
X-Received: by 2002:aa7:cf98:: with SMTP id z24mr8140689edx.136.1628640371733;
        Tue, 10 Aug 2021 17:06:11 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id h19sm10369056edt.87.2021.08.10.17.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 17:06:11 -0700 (PDT)
Date:   Wed, 11 Aug 2021 02:06:09 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 2/2] crypto: omap - Fix inconsistent locking of device lists
Message-ID: <20210811000608.GC22095@cephalopod>
References: <20210811000333.GA22095@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811000333.GA22095@cephalopod>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

lockdep complains that in omap-aes, the list_lock is taken both with
softirqs enabled at probe time, and also in softirq context, which
could lead to a deadlock:

    ================================
    WARNING: inconsistent lock state
    5.14.0-rc1-00035-gc836005b01c5-dirty #69 Not tainted
    --------------------------------
    inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
    ksoftirqd/0/7 [HC0[0]:SC1[3]:HE1:SE0] takes:
    bf00e014 (list_lock){+.?.}-{2:2}, at: omap_aes_find_dev+0x18/0x54 [omap_aes_driver]
    {SOFTIRQ-ON-W} state was registered at:
      _raw_spin_lock+0x40/0x50
      omap_aes_probe+0x1d4/0x664 [omap_aes_driver]
      platform_probe+0x58/0xb8
      really_probe+0xbc/0x314
      __driver_probe_device+0x80/0xe4
      driver_probe_device+0x30/0xc8
      __driver_attach+0x70/0xf4
      bus_for_each_dev+0x70/0xb4
      bus_add_driver+0xf0/0x1d4
      driver_register+0x74/0x108
      do_one_initcall+0x84/0x2e4
      do_init_module+0x5c/0x240
      load_module+0x221c/0x2584
      sys_finit_module+0xb0/0xec
      ret_fast_syscall+0x0/0x2c
      0xbed90b30
    irq event stamp: 111800
    hardirqs last  enabled at (111800): [<c02a21e4>] __kmalloc+0x484/0x5ec
    hardirqs last disabled at (111799): [<c02a21f0>] __kmalloc+0x490/0x5ec
    softirqs last  enabled at (111776): [<c01015f0>] __do_softirq+0x2b8/0x4d0
    softirqs last disabled at (111781): [<c0135948>] run_ksoftirqd+0x34/0x50

    other info that might help us debug this:
     Possible unsafe locking scenario:

           CPU0
           ----
      lock(list_lock);
      <Interrupt>
        lock(list_lock);

     *** DEADLOCK ***

    2 locks held by ksoftirqd/0/7:
     #0: c0f5e8c8 (rcu_read_lock){....}-{1:2}, at: netif_receive_skb+0x6c/0x260
     #1: c0f5e8c8 (rcu_read_lock){....}-{1:2}, at: ip_local_deliver_finish+0x2c/0xdc

    stack backtrace:
    CPU: 0 PID: 7 Comm: ksoftirqd/0 Not tainted 5.14.0-rc1-00035-gc836005b01c5-dirty #69
    Hardware name: Generic AM43 (Flattened Device Tree)
    [<c010e6e0>] (unwind_backtrace) from [<c010b9d0>] (show_stack+0x10/0x14)
    [<c010b9d0>] (show_stack) from [<c017c640>] (mark_lock.part.17+0x5bc/0xd04)
    [<c017c640>] (mark_lock.part.17) from [<c017d9e4>] (__lock_acquire+0x960/0x2fa4)
    [<c017d9e4>] (__lock_acquire) from [<c0180980>] (lock_acquire+0x10c/0x358)
    [<c0180980>] (lock_acquire) from [<c093d324>] (_raw_spin_lock_bh+0x44/0x58)
    [<c093d324>] (_raw_spin_lock_bh) from [<bf00b258>] (omap_aes_find_dev+0x18/0x54 [omap_aes_driver])
    [<bf00b258>] (omap_aes_find_dev [omap_aes_driver]) from [<bf00b328>] (omap_aes_crypt+0x94/0xd4 [omap_aes_driver])
    [<bf00b328>] (omap_aes_crypt [omap_aes_driver]) from [<c08ac6d0>] (esp_input+0x1b0/0x2c8)
    [<c08ac6d0>] (esp_input) from [<c08c9e90>] (xfrm_input+0x410/0x1290)
    [<c08c9e90>] (xfrm_input) from [<c08b6374>] (xfrm4_esp_rcv+0x54/0x11c)
    [<c08b6374>] (xfrm4_esp_rcv) from [<c0838840>] (ip_protocol_deliver_rcu+0x48/0x3bc)
    [<c0838840>] (ip_protocol_deliver_rcu) from [<c0838c50>] (ip_local_deliver_finish+0x9c/0xdc)
    [<c0838c50>] (ip_local_deliver_finish) from [<c0838dd8>] (ip_local_deliver+0x148/0x1b0)
    [<c0838dd8>] (ip_local_deliver) from [<c0838f5c>] (ip_rcv+0x11c/0x180)
    [<c0838f5c>] (ip_rcv) from [<c077e3a4>] (__netif_receive_skb_one_core+0x54/0x74)
    [<c077e3a4>] (__netif_receive_skb_one_core) from [<c077e588>] (netif_receive_skb+0xa8/0x260)
    [<c077e588>] (netif_receive_skb) from [<c068d6d4>] (cpsw_rx_handler+0x224/0x2fc)
    [<c068d6d4>] (cpsw_rx_handler) from [<c0688ccc>] (__cpdma_chan_process+0xf4/0x188)
    [<c0688ccc>] (__cpdma_chan_process) from [<c068a0c0>] (cpdma_chan_process+0x3c/0x5c)
    [<c068a0c0>] (cpdma_chan_process) from [<c0690e14>] (cpsw_rx_mq_poll+0x44/0x98)
    [<c0690e14>] (cpsw_rx_mq_poll) from [<c0780810>] (__napi_poll+0x28/0x268)
    [<c0780810>] (__napi_poll) from [<c0780c64>] (net_rx_action+0xcc/0x204)
    [<c0780c64>] (net_rx_action) from [<c0101478>] (__do_softirq+0x140/0x4d0)
    [<c0101478>] (__do_softirq) from [<c0135948>] (run_ksoftirqd+0x34/0x50)
    [<c0135948>] (run_ksoftirqd) from [<c01583b8>] (smpboot_thread_fn+0xf4/0x1d8)
    [<c01583b8>] (smpboot_thread_fn) from [<c01546dc>] (kthread+0x14c/0x174)
    [<c01546dc>] (kthread) from [<c010013c>] (ret_from_fork+0x14/0x38)
    ...

The omap-des and omap-sham drivers appear to have a similar issue.

Fix this by using spin_{,un}lock_bh() around device list access in all
the probe and remove functions.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 drivers/crypto/omap-aes.c  |  8 ++++----
 drivers/crypto/omap-des.c  |  8 ++++----
 drivers/crypto/omap-sham.c | 12 ++++++------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 0dd4c6b157de..9b968ac4ee7b 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1175,9 +1175,9 @@ static int omap_aes_probe(struct platform_device *pdev)
 	spin_lock_init(&dd->lock);
 
 	INIT_LIST_HEAD(&dd->list);
-	spin_lock(&list_lock);
+	spin_lock_bh(&list_lock);
 	list_add_tail(&dd->list, &dev_list);
-	spin_unlock(&list_lock);
+	spin_unlock_bh(&list_lock);
 
 	/* Initialize crypto engine */
 	dd->engine = crypto_engine_alloc_init(dev, 1);
@@ -1264,9 +1264,9 @@ static int omap_aes_remove(struct platform_device *pdev)
 	if (!dd)
 		return -ENODEV;
 
-	spin_lock(&list_lock);
+	spin_lock_bh(&list_lock);
 	list_del(&dd->list);
-	spin_unlock(&list_lock);
+	spin_unlock_bh(&list_lock);
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--) {
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index bc8631363d72..be77656864e3 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -1033,9 +1033,9 @@ static int omap_des_probe(struct platform_device *pdev)
 
 
 	INIT_LIST_HEAD(&dd->list);
-	spin_lock(&list_lock);
+	spin_lock_bh(&list_lock);
 	list_add_tail(&dd->list, &dev_list);
-	spin_unlock(&list_lock);
+	spin_unlock_bh(&list_lock);
 
 	/* Initialize des crypto engine */
 	dd->engine = crypto_engine_alloc_init(dev, 1);
@@ -1094,9 +1094,9 @@ static int omap_des_remove(struct platform_device *pdev)
 	if (!dd)
 		return -ENODEV;
 
-	spin_lock(&list_lock);
+	spin_lock_bh(&list_lock);
 	list_del(&dd->list);
-	spin_unlock(&list_lock);
+	spin_unlock_bh(&list_lock);
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 735abd8f68d6..f6bf53c00b61 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2127,9 +2127,9 @@ static int omap_sham_probe(struct platform_device *pdev)
 		(rev & dd->pdata->major_mask) >> dd->pdata->major_shift,
 		(rev & dd->pdata->minor_mask) >> dd->pdata->minor_shift);
 
-	spin_lock(&sham.lock);
+	spin_lock_bh(&sham.lock);
 	list_add_tail(&dd->list, &sham.dev_list);
-	spin_unlock(&sham.lock);
+	spin_unlock_bh(&sham.lock);
 
 	dd->engine = crypto_engine_alloc_init(dev, 1);
 	if (!dd->engine) {
@@ -2177,9 +2177,9 @@ static int omap_sham_probe(struct platform_device *pdev)
 err_engine_start:
 	crypto_engine_exit(dd->engine);
 err_engine:
-	spin_lock(&sham.lock);
+	spin_lock_bh(&sham.lock);
 	list_del(&dd->list);
-	spin_unlock(&sham.lock);
+	spin_unlock_bh(&sham.lock);
 err_pm:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
@@ -2199,9 +2199,9 @@ static int omap_sham_remove(struct platform_device *pdev)
 	dd = platform_get_drvdata(pdev);
 	if (!dd)
 		return -ENODEV;
-	spin_lock(&sham.lock);
+	spin_lock_bh(&sham.lock);
 	list_del(&dd->list);
-	spin_unlock(&sham.lock);
+	spin_unlock_bh(&sham.lock);
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--) {
 			crypto_unregister_ahash(
-- 
2.20.1
