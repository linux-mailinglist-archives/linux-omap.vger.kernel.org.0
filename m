Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71E055690
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 20:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732611AbfFYR76 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 13:59:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40664 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731655AbfFYR74 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 13:59:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so17163812ljh.7
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QmxO/9gVmXF4taLxfCWA/1fSMjzT1beTSts3uWmQX/c=;
        b=vpflNEPdlpmtF6ppcO+wcXweztt2Qm5bdsrxQRDQhamf0eRJO3Qogs94Fusq6ilfk7
         8Yv+qjO4wUO2UeffXgyThzWBE5gKb5/Ds2EuvvI9tdPYrpT0RH7JRc7eLH9bVpBlmaCw
         lBbMlmDWfRysM555kgVKaozbbGxl2M5NHQ3b4g+bgxrXWs2d/ozTRi6v4ACMW+FFHqJx
         cQtIphyePbaGJxQr1YLejndiS5yg4f2KDd4TXXh0QaZFhM2RFdgxeSslwtZBcTPK1VOc
         mykNN9euAXUjlTXC3xoF2PsYzhhKGuX83I6jzot/y3ZoxT3WN3fXHBY92ZotgSt8kLhB
         cWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QmxO/9gVmXF4taLxfCWA/1fSMjzT1beTSts3uWmQX/c=;
        b=MwABMVkc3E0n+Z7v1N3mp4V+jdpsx/ixKVy/UDT2mMRNW1cSkPC+UmgHY+QT8oqRAO
         /mGZikZJvO8WkBtt5FaUv+KUevMjRsoWLl4jfgjhUHUrYYTfrSjALF6ZMiBKT+AWR0Xz
         oiLLYx8ObHJSCbhUsLjqH3M3Lt6d5h4XPh189++GJvqAPDuPrJVb+pFWExMqVd5eNsT0
         YfNbHnUqrhdbHGubsjWl13uE21c9nvIlkIQyMGtha1oLGSYTZSrrmmjWkk9YNwz0rj9J
         3n/830ambW9n4c/rSGq2RGdcSzxmXkVDfmHKsKbvYnTSw97t9uK8j2499UW9yeYK1ajT
         3WAw==
X-Gm-Message-State: APjAAAXde0lRpjLxAabTNs0NO8jjj2u60FGp5CkR75AQAFOcAC3Vt0zg
        aS5eI7ggqn+CCLcEHhI/A3rgFw==
X-Google-Smtp-Source: APXvYqzRrMmxMBDcTx6O99abQnVIATR0rqbY1dWjGz3KfpZrMapxfflSERdYFfXUHs3sjN+JLLx1fA==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr67283361ljq.184.1561485593465;
        Tue, 25 Jun 2019 10:59:53 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g76sm2367597lje.43.2019.06.25.10.59.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 10:59:53 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com, hawk@kernel.org,
        brouer@redhat.com, saeedm@mellanox.com, leon@kernel.org
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 1/4] net: core: page_pool: add user cnt preventing pool deletion
Date:   Tue, 25 Jun 2019 20:59:45 +0300
Message-Id: <20190625175948.24771-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org>
References: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add user counter allowing to delete pool only when no users.
It doesn't prevent pool from flush, only prevents freeing the
pool instance. Helps when no need to delete the pool and now
it's user responsibility to free it by calling page_pool_free()
while destroying procedure. It also makes to use page_pool_free()
explicitly, not fully hidden in xdp unreg, which looks more
correct after page pool "create" routine.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 8 +++++---
 include/net/page_pool.h                           | 7 +++++++
 net/core/page_pool.c                              | 7 +++++++
 net/core/xdp.c                                    | 3 +++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 5e40db8f92e6..cb028de64a1d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -545,10 +545,8 @@ static int mlx5e_alloc_rq(struct mlx5e_channel *c,
 	}
 	err = xdp_rxq_info_reg_mem_model(&rq->xdp_rxq,
 					 MEM_TYPE_PAGE_POOL, rq->page_pool);
-	if (err) {
-		page_pool_free(rq->page_pool);
+	if (err)
 		goto err_free;
-	}
 
 	for (i = 0; i < wq_sz; i++) {
 		if (rq->wq_type == MLX5_WQ_TYPE_LINKED_LIST_STRIDING_RQ) {
@@ -613,6 +611,8 @@ static int mlx5e_alloc_rq(struct mlx5e_channel *c,
 	if (rq->xdp_prog)
 		bpf_prog_put(rq->xdp_prog);
 	xdp_rxq_info_unreg(&rq->xdp_rxq);
+	if (rq->page_pool)
+		page_pool_free(rq->page_pool);
 	mlx5_wq_destroy(&rq->wq_ctrl);
 
 	return err;
@@ -643,6 +643,8 @@ static void mlx5e_free_rq(struct mlx5e_rq *rq)
 	}
 
 	xdp_rxq_info_unreg(&rq->xdp_rxq);
+	if (rq->page_pool)
+		page_pool_free(rq->page_pool);
 	mlx5_wq_destroy(&rq->wq_ctrl);
 }
 
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index f07c518ef8a5..1ec838e9927e 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -101,6 +101,7 @@ struct page_pool {
 	struct ptr_ring ring;
 
 	atomic_t pages_state_release_cnt;
+	atomic_t user_cnt;
 };
 
 struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp);
@@ -183,6 +184,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 	return page->dma_addr;
 }
 
+/* used to prevent pool from deallocation */
+static inline void page_pool_get(struct page_pool *pool)
+{
+	atomic_inc(&pool->user_cnt);
+}
+
 static inline bool is_page_pool_compiled_in(void)
 {
 #ifdef CONFIG_PAGE_POOL
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index b366f59885c1..169b0e3c870e 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -48,6 +48,7 @@ static int page_pool_init(struct page_pool *pool,
 		return -ENOMEM;
 
 	atomic_set(&pool->pages_state_release_cnt, 0);
+	atomic_set(&pool->user_cnt, 0);
 
 	if (pool->p.flags & PP_FLAG_DMA_MAP)
 		get_device(pool->p.dev);
@@ -70,6 +71,8 @@ struct page_pool *page_pool_create(const struct page_pool_params *params)
 		kfree(pool);
 		return ERR_PTR(err);
 	}
+
+	page_pool_get(pool);
 	return pool;
 }
 EXPORT_SYMBOL(page_pool_create);
@@ -356,6 +359,10 @@ static void __warn_in_flight(struct page_pool *pool)
 
 void __page_pool_free(struct page_pool *pool)
 {
+	/* free only if no users */
+	if (!atomic_dec_and_test(&pool->user_cnt))
+		return;
+
 	WARN(pool->alloc.count, "API usage violation");
 	WARN(!ptr_ring_empty(&pool->ring), "ptr_ring is not empty");
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 829377cc83db..04bdcd784d2e 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -372,6 +372,9 @@ int xdp_rxq_info_reg_mem_model(struct xdp_rxq_info *xdp_rxq,
 
 	mutex_unlock(&mem_id_lock);
 
+	if (type == MEM_TYPE_PAGE_POOL)
+		page_pool_get(xdp_alloc->page_pool);
+
 	trace_mem_connect(xdp_alloc, xdp_rxq);
 	return 0;
 err:
-- 
2.17.1

