Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A166E4158C2
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbhIWHIl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239560AbhIWHIj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:39 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A2AC061757
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u15so14172767wru.6
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dhy9/QR4L3UcC/+5+wWB+hUZ0V3eL4h1DgQ/CLX1xJ0=;
        b=eeNb+O7m+K3bKw/yz9oaaxoTxxKLqkl1QJxdlb+5acSY1Efpz6BrzuEV1zEeBTOiuc
         waJmyVq8Iu5EnoLMtyNU1Ltim6cZ0Bnm6BBLtEFcTorpiZ9rDhiEnXB5bm+BVxS9/okQ
         iIJdiNRjPJuoBn0/dZSn2P2J2DHAGF6KBvZW7iXjyyZ8KIHsE6eIaPPhIa+zbK7IWZKi
         tyRHExWws5AYKmLSqwApKZ921IYqnnugJSuHX88z9UpMulmXB73nDrZUdQd3KqVIDnTt
         QfsnsU8NDeMkUiuNTcXiC01wEgy/E/pzgKQE3WmTjXshweBew7a7WE2U1uLSyPE4Rd7U
         Kg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dhy9/QR4L3UcC/+5+wWB+hUZ0V3eL4h1DgQ/CLX1xJ0=;
        b=s/bfoBOzVThPoQmDKmDNtM1IUWEXEjB0bHJ/l7vWskevIwKt3tXjaKD2YlBy2eBbid
         Gy5gAXxiestniSSp+OcxPKoPoqsJ7z4p/FQsXAnI4A8hsR9irfDo7gJNTxxzdsXWx/lG
         UbruD+JNzP26Zii9XTQhN8TIdrijjB3B4DZyUZvRWmNRXIGivNKImhGWXHO1MsnMuMkr
         x7lV6gn3xFgB3x/GXHmOr6qsXYVReqE08JOHCN/BOW4mC97/2YhHbrHQ7A0bB2XHVS1/
         nRBMg6hdmc0eOMJtDR9KMVxIPKSi0R7ft1rad5urmcl6tuy77TI3G116tabv/Z4SFAYz
         1h6A==
X-Gm-Message-State: AOAM533xG+p0PuJPLqa3Lgv8j8uBBOprfAqSjrhUVptUfBf10vbeKik0
        KnwUtS8NPffmWotgmqIES0LRtw==
X-Google-Smtp-Source: ABdhPJyc4wwekASLFc5/C6gQyqTnGmAKv0w/S3Te5s0VBUMBraqNQE9yNUXgzsjAxKpJ1Ekas7+LYA==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr3170799wrd.181.1632380827255;
        Thu, 23 Sep 2021 00:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 4/8] drm/omap: omap_plane: subclass drm_plane_state
Date:   Thu, 23 Sep 2021 09:06:57 +0200
Message-Id: <20210923070701.145377-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877; i=narmstrong@baylibre.com;
 h=from:subject; bh=Bv1MHMANvHxeV2t+37ZVGiGFuepdThzrdPx6MB8l2pU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchQiRBSVCNm38RVnltb/bJqf2t0Rf1ZP2TPPIV
 lyMe5JSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0SQCD/
 4gnL+7/g669cM6jktAXoRr5TNy8stFoUwRZKuRwpV3k0jCDsl1ZBnqtYyz9JntfQTK3CRprD9uvNbq
 OVC1TITYxg+cJgCUSzUujaDJGUPHHU0l39kJAtrifllLcfvNzex2UuV64Y3vBJLfuvPbh8WvY8YORg
 P9PB/ZJosDTh511B5SV1sXyPvoEmE5wjC6UCj/o2He1ulv5oliJM4sCrA2Jh6bo5qWk7W3uUUKjbje
 pyFu679Vtq7lZQ7oLXVVf6o3iZ4jeOpbl/LsFz2leJxRtwsAOAYHSmkw86mYMfJCU7SUXjMemePV4i
 8HTjADsYwgXgvQSBWweyXUrnPM3VQRgfMYAcrLmw04QTlWPcYBjMr1tGtxGvauQ/dDEzazJaaD3YKR
 aDNzo1vf+wm2gEZAvH5KbtwGD3KsonjkYSXLeThNI3fJht0GG3qH+2PfCX2lK40WhAxPPMU2us0JI5
 M1gFAVH2m8kzQngcxbhDcomRBhWRaLxeFpeG1MlYt1nTX/24ZCsRxw+m+nN8FhK0KfI7EhwD1i942S
 n+dorsMRwNQrZuW3RUdbiZD2Z9ElYXNj+i8zjIP+GUXJW8iWchsgo3CfnL1KslgaZWeShVVxWumrcu
 fDuJjT2QaUwjwOgX+OclLCyh+7NN6AGarh1UzFXfld1w+/TLiQDz6oqqGqqQ==
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
 drivers/gpu/drm/omapdrm/omap_plane.c | 38 +++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 0df5381cc015..bda794b4c915 100644
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
@@ -207,11 +214,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
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
@@ -222,6 +235,25 @@ static void omap_plane_reset(struct drm_plane *plane)
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
+static struct drm_plane_state *
+omap_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct omap_plane_state *state;
+	struct omap_plane_state *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = to_omap_plane_state(plane->state);
+	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (!copy)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
+
+	return &copy->base;
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -257,7 +289,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
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

