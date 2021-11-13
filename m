Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C3244F264
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 10:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhKMKA4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Nov 2021 05:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhKMKA4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 Nov 2021 05:00:56 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FC4C061766;
        Sat, 13 Nov 2021 01:58:04 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w1so48056950edd.10;
        Sat, 13 Nov 2021 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nrynwiCeWdaHpXECletT6FwPumuSm45Clt7o0BtK8fc=;
        b=Kore0jlL9avLHz7O4w8V6Veo1vRPpf7UH1WGcl19PZXrloaOHvRv0eacjNDY6MNLot
         kMsqykQxPy6zEvaWt2lBnTE+AFVZGtuHbVPejWp8qZvqSXKgwkZ8drgECxnvbgNlmsfG
         CaazO4KInTDMp1OB9VV+z4lUDntyXU+rGO2YHQO4sIZCdy+y9Rdly3WQ1qAMuTRLu2RY
         xpahBaFN7N5bR4Z608J/1W5BzWr5iGr2p+OqDtNQiTQIgaxvUpDCK52NVwfe3M8l4Yxz
         oWRbS/kf0kIlB0NAVJ2+ordURw2h/oa8VqhuYu56V0clZ3qbFSQzjVqStISBzD3Ntg8K
         +b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nrynwiCeWdaHpXECletT6FwPumuSm45Clt7o0BtK8fc=;
        b=l4MxvEw0xhGNYlwznIDORqf66utu+yS6MIFue2WlgUWPg84gU64hGy+tps/z3vFKh7
         3FGMEvD0Eflk0IIw32XEXYQ6g5tecdZYK3BVyzxcsPXhNKQ5U++WF9+e0lnt1ooZDYyI
         ocUGZqW+o0ypOlHsCgIKdY618NPCx997+6iDq3iWt99cEGCYv56h27wVc/p0iuKTl6JA
         2BnjtSQUKI7HrnzBcwAVU4g94XrL1tKLGj4GJY+Ndx1jFpRfmiJmUqYkfnA15/PTmc9C
         rr60JGCtE4uDOfhPYUtkkjYgT39t9zOqPH/EpTLSyDlG95iy2MgCREDeVshF7apbONeT
         a34A==
X-Gm-Message-State: AOAM5313v/squW3vvY+aadxYFAk76gz3xIXPT/40celRGO0nbvzx0EAa
        rk3/X7oH36hdvAtoMTWftd4=
X-Google-Smtp-Source: ABdhPJytYNBTcb5lwziN8rbvH8QrdZb1uXIJndaPBTVqMsEz1o6BM2WrkNzSu1hartbHDNJWwbwI6w==
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr27161897ejc.363.1636797482792;
        Sat, 13 Nov 2021 01:58:02 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
        by smtp.gmail.com with ESMTPSA id h10sm4094944edf.85.2021.11.13.01.58.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Nov 2021 01:58:02 -0800 (PST)
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To:     tomba@kernel.org
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER backed BOs
Date:   Sat, 13 Nov 2021 11:53:59 +0200
Message-Id: <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Memory of BOs backed by TILER is not contiguous, but omap_gem_map_dma_buf()
exports it like it is. This leads to (possibly) invalid memory accesses if
another device imports such a BO.

Fix that by providing a scatterlist that correctly describes TILER memory
layout.

Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c        | 76 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_gem.h        |  3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
 3 files changed, 82 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 97e5fe6..2ffcc37 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -862,6 +862,11 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
 		return;
 
 	if (refcount_dec_and_test(&omap_obj->dma_addr_cnt)) {
+		if (omap_obj->sgt) {
+			sg_free_table(omap_obj->sgt);
+			kfree(omap_obj->sgt);
+			omap_obj->sgt = NULL;
+		}
 		ret = tiler_unpin(omap_obj->block);
 		if (ret) {
 			dev_err(obj->dev->dev,
@@ -974,6 +979,77 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
 	return 0;
 }
 
+struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj)
+{
+	struct omap_gem_object *omap_obj = to_omap_bo(obj);
+	dma_addr_t addr;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int count, len, stride, i;
+	int ret;
+
+	ret = omap_gem_pin(obj, &addr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	mutex_lock(&omap_obj->lock);
+
+	sgt = omap_obj->sgt;
+	if (sgt)
+		goto out;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	ret = -ENOMEM;
+	if (!sgt)
+		goto out_unpin;
+
+	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
+		enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
+
+		len = omap_obj->width << (int)fmt;
+		count = omap_obj->height;
+		stride = tiler_stride(fmt, 0);
+	} else {
+		len = obj->size;
+		count = 1;
+		stride = 0;
+	}
+
+	ret = sg_alloc_table(sgt, count, GFP_KERNEL);
+	if (ret)
+		goto out_free;
+
+	for_each_sg(sgt->sgl, sg, count, i) {
+		sg_set_page(sg, phys_to_page(addr), len, offset_in_page(addr));
+		sg_dma_address(sg) = addr;
+		sg_dma_len(sg) = len;
+
+		addr += stride;
+	}
+
+	omap_obj->sgt = sgt;
+out:
+	mutex_unlock(&omap_obj->lock);
+	return sgt;
+
+out_free:
+	kfree(sgt);
+out_unpin:
+	mutex_unlock(&omap_obj->lock);
+	omap_gem_unpin(obj);
+	return ERR_PTR(ret);
+}
+
+void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt)
+{
+	struct omap_gem_object *omap_obj = to_omap_bo(obj);
+
+	if (WARN_ON(omap_obj->sgt != sgt))
+		return;
+
+	omap_gem_unpin(obj);
+}
+
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 /*
  * Get kernel virtual address for CPU access.. this more or less only
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index eda9b48..3b61cfc 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -77,10 +77,11 @@ void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,
 int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
 		bool remap);
 int omap_gem_put_pages(struct drm_gem_object *obj);
-
 u32 omap_gem_flags(struct drm_gem_object *obj);
 int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
 		int x, int y, dma_addr_t *dma_addr);
 int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient);
+struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj);
+void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt);
 
 #endif /* __OMAPDRM_GEM_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index f4cde3a..9650416 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -21,45 +21,21 @@ static struct sg_table *omap_gem_map_dma_buf(
 {
 	struct drm_gem_object *obj = attachment->dmabuf->priv;
 	struct sg_table *sg;
-	dma_addr_t dma_addr;
-	int ret;
-
-	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
-	if (!sg)
-		return ERR_PTR(-ENOMEM);
-
-	/* camera, etc, need physically contiguous.. but we need a
-	 * better way to know this..
-	 */
-	ret = omap_gem_pin(obj, &dma_addr);
-	if (ret)
-		goto out;
-
-	ret = sg_alloc_table(sg, 1, GFP_KERNEL);
-	if (ret)
-		goto out;
-
-	sg_init_table(sg->sgl, 1);
-	sg_dma_len(sg->sgl) = obj->size;
-	sg_set_page(sg->sgl, pfn_to_page(PFN_DOWN(dma_addr)), obj->size, 0);
-	sg_dma_address(sg->sgl) = dma_addr;
+	sg = omap_gem_get_sg(obj);
+	if (IS_ERR(sg))
+		return sg;
 
 	/* this must be after omap_gem_pin() to ensure we have pages attached */
 	omap_gem_dma_sync_buffer(obj, dir);
 
 	return sg;
-out:
-	kfree(sg);
-	return ERR_PTR(ret);
 }
 
 static void omap_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 		struct sg_table *sg, enum dma_data_direction dir)
 {
 	struct drm_gem_object *obj = attachment->dmabuf->priv;
-	omap_gem_unpin(obj);
-	sg_free_table(sg);
-	kfree(sg);
+	omap_gem_put_sg(obj, sg);
 }
 
 static int omap_gem_dmabuf_begin_cpu_access(struct dma_buf *buffer,
-- 
1.9.1

