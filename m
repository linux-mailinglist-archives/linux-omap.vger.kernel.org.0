Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1260444F250
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 10:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbhKMJrP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Nov 2021 04:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbhKMJrO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 Nov 2021 04:47:14 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A1FC061766;
        Sat, 13 Nov 2021 01:44:22 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id v11so47889535edc.9;
        Sat, 13 Nov 2021 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=R/uUy8GAwlxjZHd5CCq2ZjvYvkMuCeoGLcIKO4xLb/Y=;
        b=RDJmO60C9SyYk5kMZ3Ta4dnzELRVVPydD5Thxex0W92uV0JZ4Qngfvb2m/JCsvjmCh
         qZ+Nx4Fv+XH0KZ4GNEEHVRy5JJP6EooDMJVl8XeWeWaUn0GxaBw6GQMncuTigchnvpaT
         /aUgsF88ibRV3XpNBb6U6jhIYIROl5wOF5yWrE9771dQqt/lazHz49dYnWrz9DoO45/M
         iSAPWeqEGAxFiA9UKoYr1esLp5caDrnZ26iinJuL1QymEnpep/QdL3UVPF6ym/NxYPn7
         FQ8xmjiESm2/IU+czSO+/3qPXmxp244EyTXMn/oLyJbujebYDtei+sxFcQl3AmBufmqF
         cuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R/uUy8GAwlxjZHd5CCq2ZjvYvkMuCeoGLcIKO4xLb/Y=;
        b=M2NWHyFYv3IhsznFdZldnV71ltsl4UdSVc/8FQiflSde1tQSS52T3TeYtG2fwvK+qd
         QEqYxzTlBHx94Roian9LXugP0EQQDYcRrzXlZ8JeGWzEzCljJK/YIRjXdUAnSaCzMlFC
         qm4Yhf2cScqRhk4jiqu3el01NSb0QbNmDsI17US9D2y/QTvLGtN6+xx2sTKGxdc8EFj8
         u5HnveiGjbelI0wFwBeiwGH66q+R+Rd4zSEzIz1RwQQfxFFDp4VePCJDEF6kYymLnL0C
         OZmWtdHXqAYX0ttFWxZyvdKSj94pASc/0svNFBrcz2cpZnl0eiFvLYFbWHIacJXWatEV
         raPQ==
X-Gm-Message-State: AOAM533AqM18aIgW7Jl8m+cqTMuv2daov4/L8/lgzfmZMu9JaKJhnir1
        dtwe5I2ruex9Q40pQ6hj2BYBZUV0Zi8=
X-Google-Smtp-Source: ABdhPJyvJ7GxIaYOylNmiNYn/R+0EPcNaHgdpN7QuLpMrruaePZXDAtSMrJ5Q3O5w+MP1ZZcRgB8MA==
X-Received: by 2002:a17:906:8c3:: with SMTP id o3mr23041470eje.10.1636796661082;
        Sat, 13 Nov 2021 01:44:21 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
        by smtp.gmail.com with ESMTPSA id gb2sm3609926ejc.52.2021.11.13.01.44.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Nov 2021 01:44:20 -0800 (PST)
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To:     tomba@kernel.org
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] drm: omapdrm: Export correct scatterlist for TILER backed BOs
Date:   Sat, 13 Nov 2021 11:40:17 +0200
Message-Id: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
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
 drivers/gpu/drm/omapdrm/omap_gem.c        | 78 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_gem.h        |  3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 32 ++-----------
 3 files changed, 83 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 97e5fe6..a1a18bb 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -48,7 +48,7 @@ struct omap_gem_object {
 	 *   OMAP_BO_MEM_DMA_API flag set)
 	 *
 	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
-	 *   if they are physically contiguous (when sgt->orig_nents == 1)
+	 *   if they are physically contiguous (when sgt->nents == 1)
 	 *
 	 * - buffers mapped through the TILER when dma_addr_cnt is not zero, in
 	 *   which case the DMA address points to the TILER aperture
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

