Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA047454874
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238474AbhKQOXI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238437AbhKQOXB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:23:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7100C061766
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:42 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b12so5036637wrh.4
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MFbb3rRC6CkwVaBmsFg7w37a3G8MDFjwzQkPk2t8wc8=;
        b=YoYvZVkCpOMlpNMu5GRBDUNDrcw27KAAW2A7PQ5i0wTQqeqlh/J9aUvAT4Gi1raMOs
         DaUNZWVtcIiIIg/XawEzUd5FVumlENuQiNNgtyrRqfNNB6wCWoIr7vZ7ab+iTN7TRnf1
         00oYjUpCCX9hwJdtSqoZvJBtf4+R+2OYWHhWU+/7OV0erZN8zm82SGt3JD53Myw+OkCr
         YfEg/RtEXdA6mu53N5/Ksu6uYg6wcy13Vu0l0ONyyO09tSbhCgKcHc2HrY01Y9EsMi0z
         Ge+BeWOaKkTbus1xr1UtWg0P9wRzINmiFVMd1xG7QOLgo6u4wj2RQ0nz/kw10Q5zhox5
         VzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MFbb3rRC6CkwVaBmsFg7w37a3G8MDFjwzQkPk2t8wc8=;
        b=qP3/+W6VnSiai1tZ55HUCdIZrea2aaXjg9tiHl9pa811B4lsMnN3q5rWMkufY0ljZ+
         f4uaVSwosOee5h678/W7O/j5uvbsGtVoBRk8bAvI1SQgKJiaPILPx6A6cb9u8GZZaQlM
         WHdfO8swz4I5z2hhFFFdthotO5J7XYUl3hOBOF6ifmHJuKyuvl3s2w5WCBT3C5u2tW+C
         YuMw5LW6GHt0okTUVbaWVguSvaazn1YfXw7lzny1627K5D13JxkzunOt+C5FyYsLi5L8
         Xk6T2IsF6WnPOty+3Bg151LAzNzQ6GbPVohWw+CwpsXYvlGIGb3rPqQcbXmTbACGJurB
         i+9A==
X-Gm-Message-State: AOAM530F+ksUwZLJRZXD94WPm0iOHYUUmV4dJyUu4aB6wdv4H+hql+L+
        uN2OJ95VcwmqCzcd4G0rs5ohcA==
X-Google-Smtp-Source: ABdhPJw7uxvrrCV1Yon1GxDh+Ova8AePIueSwHwgQnyuE7lmYJXI+VqBKsWNufu80QQ4VIQ0XeUgyg==
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr20330832wri.251.1637158781261;
        Wed, 17 Nov 2021 06:19:41 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:40 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v7 8/9] drm/omap: add plane_atomic_print_state support
Date:   Wed, 17 Nov 2021 15:19:27 +0100
Message-Id: <20211117141928.771082-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=narmstrong@baylibre.com;
 h=from:subject; bh=Pda2Ac0adRphf+l3IU8dWodFMXXAu4U1eOV5bDdRzdI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MvHDhUMYwMTVhslq4itOuJ9Xjr7S6DtjCpGiK
 xEPJ8FGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0UBNEA
 CBoe3cUZs6+knh7KLHllThJ7FU3smJZ+1KASHRlcUFjtnCNR9FNuyGuFFMjG9t48pJ/bYrXMxMIlnO
 jjteeYLSIjfXi1XM4f765+FhL5VlmqmTITWZYE0ckovQeJ2bQRIXQUiylYqGhOcKHXp59HYAq+ck5b
 iw2hn4CvicvlAm3pg5dZYLgb9/vaVCr8e1oML1LxczgOGA/gXa3M8ADX7Itq8woKm9mOe57anXkdRY
 eFAEk4zObIzN7YLY9vigoYIUpQ7JxTsWjcdI4gejzafPGIsnerE2nbmqKmsVG6Qy4exm/g6amTduNR
 9JD40sfdlSHGN/N26FmYKpG59LsPkmoLxi4PlVXiOL05vO1wzU51LiU4TLWYw0Fqc4J6C/WswyKHBq
 FuH9gUuEVSsf6oUkPK5/phA4vCeL0kxmJx0m5lg0xHkqgtQeULa1lsxZrccbdbXD1klOOQ8O+4fk+5
 nmRRYVbX6Aws4ci46H2VhhJsB3/bQmDE7t6DXfM/V7gnM+jz4tzCn5G9WVPfnzyO0Xl27Wh6q1j+4Q
 YwktfnN4GtZ+sZoRssYxT8QHZC2rq7dOCk8ZAa9LHy1MsaGgOo+0qoRMTer6ioHUxvNxBVw4R1XfTa
 jNhUZDwmjZdMYibtVrlc7pKKmLR/V0eYmWrJURctYWdTAOQXBGNzLik8vFBw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Now that we added specific item to our subclassed drm_plane_state
we can add omap_plane_atomic_print_state() helper to dump out our own
driver specific plane state.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ce5ed45401fb..23b752d837a4 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -348,6 +348,19 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	return &state->base;
 }
 
+static void omap_plane_atomic_print_state(struct drm_printer *p,
+					  const struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	if (omap_state->overlay)
+		drm_printf(p, "\toverlay=%s (caps=0x%x)\n",
+			   omap_state->overlay->name,
+			   omap_state->overlay->caps);
+	else
+		drm_printf(p, "\toverlay=None\n");
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -387,6 +400,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
+	.atomic_print_state = omap_plane_atomic_print_state,
 };
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
-- 
2.25.1

