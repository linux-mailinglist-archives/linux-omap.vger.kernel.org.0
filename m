Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5B545486D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238427AbhKQOW7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238385AbhKQOWn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:22:43 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D03C06120A
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:34 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u1so4984791wru.13
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ybygRqz89X6PWHUm5yVoNp/ouF0lEkQ3IO8ZQyZIpmw=;
        b=6A/IHLLB6/oQZkGwdVYvRX0+wArc2hL3/y8nPki86c+4dU8T7I50askZ82FWCnEmsS
         qyyvwjQhCHnDiu+tgb/XnhyIVZLR8UR7TJ6z1SutLU//aHzEXDBaApAGOQtplQNDDU/9
         NKB+Ed37syi/YU6XehLpKgu366RAL8YPBozm1LGaLDrmKyY19WUy3IwxVaSzsWxZSAso
         giT8YIGO1RoPwwZcRt0a/1jCP6l1merJdQd9aAy34obaSgxnYkGG0Ea2QPshWVpwPNA6
         WOy5SMaUiwIXoGB0Oydb44ej87rqFyVQdJBfSgNbn/p9xJYv6rSuuo0sT1cGuOIitZ2H
         /l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ybygRqz89X6PWHUm5yVoNp/ouF0lEkQ3IO8ZQyZIpmw=;
        b=MHEcq6zLVmWDOExEmAG6uMCOUJJ8AiMWOrDuGw4svZp44h8TCllB6fK3gyTD1LwvSc
         usPa4Ljkk+BaTCV8oMCIBXGHtp0reLvZyjsZkI9jwvkp3j3XtoXwAeQkZGKhiWtvZ+EW
         JtWYdFFK4l1ByTKtab8shTiLl31EsrTo7Dfk7SZu3FH0vGFDs7b7TMb+jnWg2Qy2C7Nu
         iqcWyCfdalEZB0feznJOQVFqx5bZFkTVjwhsiw34XzPqpRRPHojJrhTonG2vMNcDJ2i8
         8a7VUOXrAtwtkz7naUOpCY+UX/tmlzVWtw10c9cwi7Sd3bD1BQi9pEBlDrb/gO5PiBLr
         mMfA==
X-Gm-Message-State: AOAM531zecKSuRZr6dFScQhJOr9XCNpuPlD17hZ9KiWjLQIDYhqDiuS/
        2i047XpVSmnJVq5TSKwJ6sTYeMVnWz2uKF0w
X-Google-Smtp-Source: ABdhPJyGYg9Z2tde6LZd6N3n1S6Xjr7QCyaRmF3v5j14j0oLqwEn0zizDO/pf+hpuGrawjr3nMH3uw==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr19710700wrf.383.1637158773387;
        Wed, 17 Nov 2021 06:19:33 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:32 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 1/9] drm/omap: add sanity plane state check
Date:   Wed, 17 Nov 2021 15:19:20 +0100
Message-Id: <20211117141928.771082-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; h=from:subject; bh=fRkx/RPkFxPenXM1+XojYlY6DoZHNd/vTOwe0D2eHgI=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9LcfQR81+VKXldrcyliXmf4wAP1+2GSxnSWUvK iH4ZMFaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPSwAKCRB33NvayMhJ0c0REA Ck1IPmCiheHrRrGeQ9Rsgt9sOU1sUsI4o8CIeVTG2Tp2iBf9DrA9Dc6A9OVkpfHkG4eaaqPvycyX0N ucX+m58NAKu89/S7Pp+Aa4Pekj8qnwae3shxOq9Lbk/SaEqqpUTYQhoSYpG1pp14LJxM07pmjQ/xgU AKusu1twKCUaWR/2LHtF+kb71frnhnvwepacO4o7UZFP0XNGd7OIbUBrBaUdtoJHrpYuxqc1TAenYq 5ApLS6cLdZ6rdo2kqXbyqtUdrUr/Ol8Hpepz+V1tUFUqkF2voOalYEngbO5jLFIoOIc7DKXi5/VSYx beo9lPw1z3gZcTLqQdQzf4aL+txhac3IfXFTM/CJTHpI+qSBtq5UZgDv5uOAiUfU3RVKr9vRrnk9ju OtNM6xGjVk22CO0NKqJW+OIE5rAvSLKtiRaR5+CzJEivfcb5Cr959TkDTawwy8Ut0j3njHyLcSIJeo wKVoMhjcCNKXfSG3QyTXly4uFYId4pgUHWZGupLtPAt1JtuTKcYO9KAR4r3rlvuC5UOw6cXBj+9GlF LQDcn7Q8fpcOFx9IxXtzpereG1wPxpfLxiUVhBf4p2j1LSORGpJC47h2C4bCvJnj8ZNaZm+S+B+qha A+dv5cgMRRwZJzBQMo8NzuDkhNwmtP4AVTh6E5J9gRGwFYehgpF+0VVRTg6A==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Call drm_atomic_helper_check_plane_state() from the plane
atomic_check() callback in order to add plane state sanity
checking.

It will permit filtering out totally bad scaling factors, even
if the real check are done later in the atomic commit.

Calling drm_atomic_helper_check_plane_state() also sets
plane_state->visible which will be useful when dynamically
assigning hw overlays to planes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 512af976b7e9..c3de4f339387 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -104,12 +104,15 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
 }
 
+#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
+
 static int omap_plane_atomic_check(struct drm_plane *plane,
 				   struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
 	if (!new_plane_state->fb)
 		return 0;
@@ -127,6 +130,18 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc_state->enable)
 		return 0;
 
+	/*
+	 * Note: these are just sanity checks to filter out totally bad scaling
+	 * factors. The real limits must be calculated case by case, and
+	 * unfortunately we currently do those checks only at the commit
+	 * phase in dispc.
+	 */
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  FRAC_16_16(1, 8), FRAC_16_16(8, 1),
+						  true, true);
+	if (ret)
+		return ret;
+
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
 		return -EINVAL;
 
-- 
2.25.1

