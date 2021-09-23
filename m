Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806824158C8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhIWHIn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239587AbhIWHIm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:42 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FF5C061756
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t8so14229557wrq.4
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spYtq8N9tOYZ3bDuoIAir81jdpnT4AkNUpr6oHbfic8=;
        b=1RO5ZobrgG5++dYNnzrLOUv0cRpwUlemb5+o+u9Q1gPopjjnubyP6BaIGORmEeuxjc
         yffM2Byy9QsuWh99hcBLQq6ysJ3yXdTTN3qpeHAJOg1aalCqgUFe6CniN8igzwuf/C6e
         SjIt+PTPnJOsC2Ak2ovuUFcQNMqlLONXy6IRbzmKVOXNHsE5QRoJNXBuSSrt5/4DwNBY
         OPIVZiLphjhEQRwfHr3GwaN/PLuDB0bvvq9uSuF4UXRJ0NSCdSO8/ZZYfcj3K+gVIlFY
         u2git7nzI6k2XQCguwxQcuadg10sqm18637IU7kKeGuCgfZjr/IKe3wK+4Q9Z8zRWeAM
         qgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spYtq8N9tOYZ3bDuoIAir81jdpnT4AkNUpr6oHbfic8=;
        b=T0+OhAOlEGWo41KkE8M4Bw5pe3wsvsKOzjZ7mIGBpEFMY5LXPbPox4qrqiC+7VzBTa
         RnoqHCs2I03NkbZTmMvP45ddtZHVtW+z6HySeKrB++e5ZsYsbo8ilTRkRi5ePC+ZGywJ
         hANIGLurnC6OLDBk/vpHF3z1HKgjrmk6sBcJ2St4YoUqHmIb1VqXwJg2FDb/gdesZhXy
         f/liyn+xgGsJfCWed5QreEKR9IsSdpd9nC9TkGwG1Uhf+hm7Xx+fTDdZn1q5Ew1lGzBy
         Eke/oxkYDgr8BSm1Q2A9x4aJ6cPhlklUgatQJZDDsGtsaplzZx3OnfLcSLBcU1BhYc6U
         5O9w==
X-Gm-Message-State: AOAM5322tea0K7a6GFHnhgfdE18QCo1GRRlqYtlEEz1TBStUU3K36xrg
        aociEL5eAd6b/q8qTcwNPOeukw==
X-Google-Smtp-Source: ABdhPJwOv7McjYGzFwHzxGJAV+ts3fm09N336sM14adogDpXQRV9SjPwiwhmsdpZNlzYLAKpJMKXmw==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr3030473wri.391.1632380830122;
        Thu, 23 Sep 2021 00:07:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:09 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 7/8] drm/omap: add plane_atomic_print_state support
Date:   Thu, 23 Sep 2021 09:07:00 +0200
Message-Id: <20210923070701.145377-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=narmstrong@baylibre.com;
 h=from:subject; bh=ut7MrM2quhUltiKLTR0Hvs3i6r3x/VqxCeFv4yQK71M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchINs7VR8suG1q30wHKBeLlE92EeTR8kdg4y/a
 rQCD7P+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0WPUEA
 CWqjItqPiNBCOoAuFwrxfJbSdx2CgxQO1mppCAJWVfvDExE5YGcNJubbARXWHCab8y99LGzTImdTil
 LY1hKI8xDTwoq2c1EA+g36lWk+7cn7NFQHWAW01tgiTWo2sWh4ZJP4ZspXo5QH8UHBfMsmasgurlfs
 5/e3UIagRfBX/k7J6fdkwe2RYGGveaeVut60rTB1lpk7n7WmHUs6hTGuk5e2MwUSnS6TgC+uD+RWTS
 kiKKsALVsXJsted3MhasB2N/V/weowNXc92xb6q5OUOjhuBM2QBNJmtPO0jHB1bSK8N83YHok6O+H9
 g81/5TFMd0ZoTGI7MnenlM+FZFQNjn9dwr/I+e+DLCbQohvjfSlHaRU1bUmcbg/vVeWgJbc2Q9qxxd
 FqYS+V5R3yEJxBrbD1kPdL5d1gRyM/qDgj41nUYCDmN+eDaThAGlWDHvPTiI0QA6bpswfEzDpfDj3z
 oXu6n2U3GcoJs9eKvXPbGEmaBFPDffD780mkc0CvwRZviEDm15OBWMEh/62y1OfEoF5/w4YPdAujGf
 kSsFcEaH+XzICDbuUFU1EuVMMdJF5D0ZfVQgsPVoKY9KNy1aX1FWTCdU7ROUuJKtEPm30/qU7fyCeq
 tt5vsHeOOo1f8gkReDboK7QuK8z6jUJzhLaU6jW34LcVm5wEEoEWHzW1Fifg==
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
 drivers/gpu/drm/omapdrm/omap_plane.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 4b400a8bfe9e..badbafeb3402 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -355,6 +355,23 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	return &copy->base;
 }
 
+static void omap_plane_atomic_print_state(struct drm_printer *p,
+					  const struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	drm_printf(p, "\toverlay=%s\n", omap_state->overlay ?
+					omap_state->overlay->name : "(null)");
+	if (omap_state->overlay) {
+		drm_printf(p, "\t\tidx=%d\n", omap_state->overlay->idx);
+		drm_printf(p, "\t\toverlay_id=%d\n",
+			   omap_state->overlay->overlay_id);
+		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
+		drm_printf(p, "\t\tpossible_crtcs=0x%x\n",
+			   omap_state->overlay->possible_crtcs);
+	}
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -394,6 +411,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
+	.atomic_print_state = omap_plane_atomic_print_state,
 };
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
-- 
2.25.1

