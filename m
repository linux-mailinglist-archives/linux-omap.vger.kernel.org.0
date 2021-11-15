Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2412451576
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 21:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbhKOUjK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 15:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345342AbhKOT2G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 14:28:06 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A9BC055369;
        Mon, 15 Nov 2021 10:50:19 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z10so49763713edc.11;
        Mon, 15 Nov 2021 10:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Gn7jXM01WcfaWXjLEWMjsDlPibi8krKRinvyDSpZnFA=;
        b=K9fwfdf3q/Fq0L8Y1OUKCiuYmyYH8FcsXstw9vDNpYO+hB15Pv0KndCy7hi4KpfBj6
         pGjH54IRIVxlrxlO64ZtSTS0qgVIOb2cREgAuVqUjvDtX/1GAXk9OhoGJBt6sRU6XSXW
         ih3o8+N5oravrHbfgO/fUNpoTPorkcSonVJztLWo1YDb9ki3VNkLiOwTvXRebxHIl/nG
         TLEMLyUPdMbNPxuFL8EppdhXBUSkFQeauFhgKBgRgSwyABChk6/c4u6Onf9QxEklkM+E
         VJoOJr0ysuVwhotJnFgeOjsEdP/RwPz9XvbZrPMCFw5izJrYKGvYkES7uTc9eh961J4l
         2zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Gn7jXM01WcfaWXjLEWMjsDlPibi8krKRinvyDSpZnFA=;
        b=Rk4rPZA9NzFYwcCBu4fNYj7u0WFBM/otE+00SuuDGHe1DfS7nb8NWlL7uDLsEKFS0Z
         Wi0g3m2wpMsicc2q/2A1SbzXl3RpHi1D+7N8QOA4YUauLzW7mDxty7kXtugN/pqQ41wL
         K9axOvUF+QZgvKD4sCXUPPRAgMJzy2yXF5bBesQKqAW3yAIqVRnE0bc02J2WI6yhal9D
         t7WiSD/F3UPe+rdAOuM7i1AfcK3HXVZavnSDE8CAVwUZm8IsrkpB+GRJaEekvGUS+QXY
         cb6FxlcyI3VRSMwHASHgEaIWM3p6+MCj0cX83nGAxTkKt4Bw7xH8/trtNpe/bO9QiLb/
         6Rzg==
X-Gm-Message-State: AOAM530Afq4Cm83sMqaY6b4/qmNx7S1wXumsAikMLOvf5qAe2IBDdV/3
        8AaO6HAvaAtdxpMVG/y4ryM=
X-Google-Smtp-Source: ABdhPJyhKaz9mQ1BRMe4H1E6wkaXWCjD7Oa5jrIA3y0X3VWGJZF6rD0vhZJ66lc45u4MQOTUPpZPiQ==
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr1240652edd.291.1637002218552;
        Mon, 15 Nov 2021 10:50:18 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
        by smtp.gmail.com with ESMTPSA id og14sm6866287ejc.107.2021.11.15.10.50.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Nov 2021 10:50:18 -0800 (PST)
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To:     tomba@kernel.org
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        merlijn@wizzup.org, philipp@uvos.xyz,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v3] drm: omapdrm: Export correct scatterlist for TILER backed BOs
Date:   Mon, 15 Nov 2021 20:45:56 +0200
Message-Id: <1637001956-4928-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
References: <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Memory of BOs backed by TILER is not contiguous, but omap_gem_map_dma_buf()
exports it like it is. This leads to (possibly) invalid memory accesses if
another device imports such a BO.

Fix that by providing a sg that correctly describes TILER memory layout.
Also, make sure to destroy it on unpin, as it is no longer valid.

Suggested-by: Matthijs van Duin <matthijsvanduin@gmail.com>
Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c        | 77 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_gem.h        |  2 +
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
 3 files changed, 83 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 97e5fe6..cd4a31c 100644
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
@@ -974,6 +979,78 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
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
+	if (!sgt) {
+		ret = -ENOMEM;
+		goto err_unpin;
+	}
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
+		goto err_free;
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
+err_free:
+	kfree(sgt);
+err_unpin:
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
index eda9b48..19209e3 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -82,5 +82,7 @@ int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
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

