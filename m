Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6719962B18
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 23:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405383AbfGHVfP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 17:35:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35216 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731921AbfGHVej (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 17:34:39 -0400
Received: by mail-lf1-f66.google.com with SMTP id p197so11935625lfa.2
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2019 14:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TtEMC/A+JhK+HQ0VPTIfb4ZXQAqVRYHsw4hUKce21to=;
        b=YSEv7rUonu0fSMJv1bvmY3wsBQPgbXIQKEuKbU69K2u4PKXKLUFQNCys92ak9xpxjy
         IXAX4aMAWUSx2ywf2UmCJlgJyAHfRnQGjJjtfoS53FsVEW2FDJanxhw3ozuZP6JWSZtC
         WNxHEB1LkkEvSPELZ8Dt3ajTUDsJLVKMkXGhraYtAJ/ZmLMVfykLzsdtanY0Glt9+/WC
         oihGOVG6XNojx85v11SHEWAj5NtOUJBJ8TJ4qQKWEnI7AHPuWUx5bKhpxgPPGTimYZAn
         A4qmWRNxJu9dLfecSulisXphrWak7gX9XQg8h7w4+FvlQJYAm2d+jBQ9Cdc2KtV5F2vv
         hT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TtEMC/A+JhK+HQ0VPTIfb4ZXQAqVRYHsw4hUKce21to=;
        b=NbUK0hKXSQ5bT/KGydmIRvEu6xOEG3sPYYBy8EJ5Rqy8Ej82s3EGjD/1gxYQFHe34/
         jgvk9t9nxiksbMFwNVkIs/1/GlKNCJ+EBFnriNyBTJGC+Oituxq9GQWHS61/xeJ3wvkB
         S6wNGLSSoq0qSxlD+5tW+TqreXlS05VVddqEWVT/5fw9daXJhArJMnWZUAV7nYncc7Tf
         OW6gf1m9yDXEM+txKhD1xUOFc6loXNdj3YcBiRAA/j5ddJe+cbnSAIQdpM7Yavvlr/39
         vK5ExtzYmxnCzdUG1pbJ4Ua74vQKXxun4uWazZ/vMssJ26jjgwjd+RjbpZGOAjd5boMj
         yVvw==
X-Gm-Message-State: APjAAAWVLPAb5GCTbDMrpOTmlQaiTCLtc+QCbjgnz+YEa/Dqv1ptJ2br
        geP7mGXEq+SmJ1fnyYt0ZaqiFg==
X-Google-Smtp-Source: APXvYqxjSaXDZpr3eURtgn5vUZodlIZD9bf+rlhACs6BAB1KLwHrQyVSoR0WaFmjP+Vdm4nOqh1vfg==
X-Received: by 2002:a19:a83:: with SMTP id 125mr10080929lfk.150.1562621677203;
        Mon, 08 Jul 2019 14:34:37 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id o24sm3883096ljg.6.2019.07.08.14.34.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:34:36 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [PATCH v9 net-next 1/5] net: core: page_pool: add user refcnt and reintroduce page_pool_destroy
Date:   Tue,  9 Jul 2019 00:34:28 +0300
Message-Id: <20190708213432.8525-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
References: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jesper recently removed page_pool_destroy() (from driver invocation)
and moved shutdown and free of page_pool into xdp_rxq_info_unreg(),
in-order to handle in-flight packets/pages. This created an asymmetry
in drivers create/destroy pairs.

This patch reintroduce page_pool_destroy and add page_pool user
refcnt. This serves the purpose to simplify drivers error handling as
driver now drivers always calls page_pool_destroy() and don't need to
track if xdp_rxq_info_reg_mem_model() was unsuccessful.

This could be used for a special cases where a single RX-queue (with a
single page_pool) provides packets for two net_device'es, and thus
needs to register the same page_pool twice with two xdp_rxq_info
structures.

This patch is primarily to ease API usage for drivers. The recently
merged netsec driver, actually have a bug in this area, which is
solved by this API change.

This patch is a modified version of Ivan Khoronzhuk's original patch.

Link: https://lore.kernel.org/netdev/20190625175948.24771-2-ivan.khoronzhuk@linaro.org/
Fixes: 5c67bf0ec4d0 ("net: netsec: Use page_pool API")
Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>
Reviewed-by: Saeed Mahameed <saeedm@mellanox.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  4 +--
 drivers/net/ethernet/socionext/netsec.c       |  8 ++----
 include/net/page_pool.h                       | 25 +++++++++++++++++++
 net/core/page_pool.c                          |  8 ++++++
 net/core/xdp.c                                |  3 +++
 5 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 83194d56434d..10efd69de7ef 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -577,8 +577,6 @@ static int mlx5e_alloc_rq(struct mlx5e_channel *c,
 		}
 		err = xdp_rxq_info_reg_mem_model(&rq->xdp_rxq,
 						 MEM_TYPE_PAGE_POOL, rq->page_pool);
-		if (err)
-			page_pool_free(rq->page_pool);
 	}
 	if (err)
 		goto err_free;
@@ -646,6 +644,7 @@ static int mlx5e_alloc_rq(struct mlx5e_channel *c,
 	if (rq->xdp_prog)
 		bpf_prog_put(rq->xdp_prog);
 	xdp_rxq_info_unreg(&rq->xdp_rxq);
+	page_pool_destroy(rq->page_pool);
 	mlx5_wq_destroy(&rq->wq_ctrl);
 
 	return err;
@@ -680,6 +679,7 @@ static void mlx5e_free_rq(struct mlx5e_rq *rq)
 	}
 
 	xdp_rxq_info_unreg(&rq->xdp_rxq);
+	page_pool_destroy(rq->page_pool);
 	mlx5_wq_destroy(&rq->wq_ctrl);
 }
 
diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index 460777449cd9..d7307ab90d74 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -1212,15 +1212,11 @@ static void netsec_uninit_pkt_dring(struct netsec_priv *priv, int id)
 		}
 	}
 
-	/* Rx is currently using page_pool
-	 * since the pool is created during netsec_setup_rx_dring(), we need to
-	 * free the pool manually if the registration failed
-	 */
+	/* Rx is currently using page_pool */
 	if (id == NETSEC_RING_RX) {
 		if (xdp_rxq_info_is_reg(&dring->xdp_rxq))
 			xdp_rxq_info_unreg(&dring->xdp_rxq);
-		else
-			page_pool_free(dring->page_pool);
+		page_pool_destroy(dring->page_pool);
 	}
 
 	memset(dring->desc, 0, sizeof(struct netsec_desc) * DESC_NUM);
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index ee9c871d2043..2cbcdbdec254 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -101,6 +101,12 @@ struct page_pool {
 	struct ptr_ring ring;
 
 	atomic_t pages_state_release_cnt;
+
+	/* A page_pool is strictly tied to a single RX-queue being
+	 * protected by NAPI, due to above pp_alloc_cache. This
+	 * refcnt serves purpose is to simplify drivers error handling.
+	 */
+	refcount_t user_cnt;
 };
 
 struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp);
@@ -134,6 +140,15 @@ static inline void page_pool_free(struct page_pool *pool)
 #endif
 }
 
+/* Drivers use this instead of page_pool_free */
+static inline void page_pool_destroy(struct page_pool *pool)
+{
+	if (!pool)
+		return;
+
+	page_pool_free(pool);
+}
+
 /* Never call this directly, use helpers below */
 void __page_pool_put_page(struct page_pool *pool,
 			  struct page *page, bool allow_direct);
@@ -201,4 +216,14 @@ static inline bool is_page_pool_compiled_in(void)
 #endif
 }
 
+static inline void page_pool_get(struct page_pool *pool)
+{
+	refcount_inc(&pool->user_cnt);
+}
+
+static inline bool page_pool_put(struct page_pool *pool)
+{
+	return refcount_dec_and_test(&pool->user_cnt);
+}
+
 #endif /* _NET_PAGE_POOL_H */
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index b366f59885c1..3272dc7a8c81 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -49,6 +49,9 @@ static int page_pool_init(struct page_pool *pool,
 
 	atomic_set(&pool->pages_state_release_cnt, 0);
 
+	/* Driver calling page_pool_create() also call page_pool_destroy() */
+	refcount_set(&pool->user_cnt, 1);
+
 	if (pool->p.flags & PP_FLAG_DMA_MAP)
 		get_device(pool->p.dev);
 
@@ -70,6 +73,7 @@ struct page_pool *page_pool_create(const struct page_pool_params *params)
 		kfree(pool);
 		return ERR_PTR(err);
 	}
+
 	return pool;
 }
 EXPORT_SYMBOL(page_pool_create);
@@ -356,6 +360,10 @@ static void __warn_in_flight(struct page_pool *pool)
 
 void __page_pool_free(struct page_pool *pool)
 {
+	/* Only last user actually free/release resources */
+	if (!page_pool_put(pool))
+		return;
+
 	WARN(pool->alloc.count, "API usage violation");
 	WARN(!ptr_ring_empty(&pool->ring), "ptr_ring is not empty");
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 829377cc83db..d7bf62ffbb5e 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -370,6 +370,9 @@ int xdp_rxq_info_reg_mem_model(struct xdp_rxq_info *xdp_rxq,
 		goto err;
 	}
 
+	if (type == MEM_TYPE_PAGE_POOL)
+		page_pool_get(xdp_alloc->page_pool);
+
 	mutex_unlock(&mem_id_lock);
 
 	trace_mem_connect(xdp_alloc, xdp_rxq);
-- 
2.17.1

