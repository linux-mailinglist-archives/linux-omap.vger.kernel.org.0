Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEEF431F96
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 16:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhJRObK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 10:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhJRObD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 10:31:03 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44D3C061745
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:51 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g39so4802558wmp.3
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3/mSGxFbVm/a8ejyNuBiipxCQCzsxcsH9EjmVlYfMM0=;
        b=cRT8bLGi1e7toixIcZGCNmcJmQreo8+2YKbEN+BweXLqXrfkr+AvURhS4HeZ6xx9wd
         24+5wyItKG1Dx5BYwrlJ2iMC0Fng6suys/Kz+DavvLabeG8dzKd0qp1VqHBNIwVdqn7I
         VnZN75AdVaRZG4q3Ko76e1QWfB86wJrCfKZNGT1o2z+k9SYKQIBYPoEeLxg4+RnX8ayl
         Ypy5Bo9gyFArS3F1KFUJT7KMqo1pqASZPwi/MzUy5Hoym14LbsMhL4Nx7gSv68NBSLxl
         C+xHDtbP41c41lbhHDJzlOH08R+ryfTb0YQoS/WuCt5MvdRujI7tKYp9fVN7z5lS0vQj
         I68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3/mSGxFbVm/a8ejyNuBiipxCQCzsxcsH9EjmVlYfMM0=;
        b=OchaXr3fyx6obBse87Dq2rxlzWkuyL+IDbrmI+8cmdIRNfbOvTPgzu+jSoOi1Gzqar
         LW7bytFF4xwP532MJQObSTXlZTXcQA4rvFYzzF/yV2nX6xMVec3vMF076Xz/kNneJV0M
         S/SvucsUi7ehm2rzW3rKRDrFd1+qaL19r2HkuWuraDy62mDvvVuidQp3oAugL772Auqf
         hJW0HIkdZNzblHStQ/YnpBNO8Mu/WdfMuhTIQiYgh93S59QUNzA2SJKJU77vp6wbNuFI
         YwmJ41J4hKssUcPHnrTVHu/qDH1MCUn8veOGX3wE0IqfL1lYDnyz4EF6sPRBUgmZYw/F
         mNRQ==
X-Gm-Message-State: AOAM530CZFjrmY6bJkjVgVCpaD7jnUpQgOqpP81CpNSovg+3o+/Q7PTo
        AvDaKjZcx0C7TPn6uUr8isEUPA==
X-Google-Smtp-Source: ABdhPJyUhYqBjS5v/ZumIUOb8o7m7B3hz8jQP2s5SnSfcy3W2GIyQZ4PfRFJH/nsCBjvQqjlxOI+wA==
X-Received: by 2002:a7b:c14b:: with SMTP id z11mr44719659wmi.67.1634567330357;
        Mon, 18 Oct 2021 07:28:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
        by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:28:49 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 5/9] drm/omap: omap_plane: subclass drm_plane_state
Date:   Mon, 18 Oct 2021 16:28:38 +0200
Message-Id: <20211018142842.2511200-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794; i=narmstrong@baylibre.com;
 h=from:subject; bh=3BRMktYPv4ZG5ydHxi5L83LOPhqyPSOpuiBJIqTcuhg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSFehgxAvXwgTbPHgdb0WuZCU56tJWRQfNz3yjB
 /lA4aN+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0fUpD/
 wJDK9FZARCijfdQxvyOp1GU7LcX7mBsUmJ4rS5HAezqR+YttHooAaWJXgJx4EDViSfT8Sj7z/l5Gyn
 Tj/7Lvgo9qEa5/jfSXQonuuWTZR401Emz4bqNizL55/f43abHvyya44vbS/zi4Z91t8UHLbL3ZGGXs
 FG7gTzLha8LyH1/4yzuS3iRtWWOlgmkrSrWu7T5WDw1p5xrLDUYX1ELRDz/wxrMyzu4AWrx1AFLLpp
 2DZ3e4W0+Z3HfOu18AK1DF7WDJ6lqv06MLn3M7Opc53iW31VWZ8F3w3L0HRFWtwRuxy/JHH8IJXqeB
 uiHRplYt8xdKDkqoAKIHwA7Qzanid9WcrGzf3JvLiIUuZuBTM3oyLNFl8aq0p5BRlW7nvI+7qJTDCc
 JeloAXjUdJastZpSL8AOmyTdmz6OITHRo+trWYphYLmt2w7QCYWm7swOSyylhq9R2PJuj5HrIXXdfP
 lrnD+AgUn2RSWtTMFaAHntYTwi89u8BqxzWbntmvf9LIjwUWKzy7A+VHdHUodfICUOL1FtfejdbZQX
 vB2AchZV91RO6zYb7LNYgZ51EYpmLAoZJLBS0Gp3xpbifoBxHzq6tIi2GFoKedpyieYXaSMbq372xD
 afaGWf7mpTalguy3qyTipCoxZ7K18HQtnHx4h5CwuAzmTObs8mdXicPkshBg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

In preparation to add omap plane state specific extensions we need to
subclass drm_plane_state and add the relevant helpers.

The addition of specific extension will be done separately.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 36 +++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 8cc2b899f20c..72d5adbbadfa 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -16,6 +16,13 @@
  * plane funcs
  */
 
+#define to_omap_plane_state(x) container_of(x, struct omap_plane_state, base)
+
+struct omap_plane_state {
+	/* Must be first. */
+	struct drm_plane_state base;
+};
+
 #define to_omap_plane(x) container_of(x, struct omap_plane, base)
 
 struct omap_plane {
@@ -221,11 +228,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
 static void omap_plane_reset(struct drm_plane *plane)
 {
 	struct omap_plane *omap_plane = to_omap_plane(plane);
+	struct omap_plane_state *omap_state;
 
-	drm_atomic_helper_plane_reset(plane);
-	if (!plane->state)
+	if (plane->state)
+		drm_atomic_helper_plane_destroy_state(plane, plane->state);
+
+	omap_state = kzalloc(sizeof(*omap_state), GFP_KERNEL);
+	if (!omap_state)
 		return;
 
+	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
+
 	/*
 	 * Set the zpos default depending on whether we are a primary or overlay
 	 * plane.
@@ -236,6 +249,23 @@ static void omap_plane_reset(struct drm_plane *plane)
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
+static struct drm_plane_state *
+omap_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct omap_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	return &state->base;
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -271,7 +301,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = omap_plane_reset,
 	.destroy = omap_plane_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_duplicate_state = omap_plane_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
-- 
2.25.1

