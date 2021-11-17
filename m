Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0973454873
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbhKQOXH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238413AbhKQOW7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:22:59 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEC6C061226
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a9so5018288wrr.8
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gb6rdR8r5bxnCwwvMcUXuUQs475rnlgLqYUIOtwuUmQ=;
        b=EHUzwvR6NodJpEIVTgFemNR6loQk8F9zIj8MfM5yI13PXt46bs4FyIhma5+6l557HB
         Jq7L5BhdtQ+ak31/tUsbIYTlxXdnLVyHuabArY0aGeEmUogogueidx/53wN215avv3ht
         8yhwNw1YXJ6ktot9PMbt8OS3AOH2gm8CJ6B3IMlq1Zbzly0HGhNHmCeqD3pZwMApxNm5
         GH/eQKxA/LVctq459zR+9Ewk07TROBAeXvUJjvh0h7kLGD9QmplEu/GhpFgKsgJMXMrs
         cXeFOMbqUMKB0Fv0GoMCoo577xOZ23ANGN7sVgP3lTqeV/5orkouAE12UZMr1edUNoEs
         hdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gb6rdR8r5bxnCwwvMcUXuUQs475rnlgLqYUIOtwuUmQ=;
        b=AdqTOUrL8i8a3617Unh/xtzJVVjbRVSygNkgAWr9/fDal9wJGXm+/68VTjU2CzIksB
         5zA7p8tAje6rFriO0kYPEvntqXxZ8NyPUxLekOoyTBOABJ7Ii3GzQhhOtgDZOjPfZ+BL
         3wJjsagaI2zG2V+Tm8RjlA6dgFxmG3aUQIsgII8wfAr/u1yUoFIsI/SnYysIFn/Pz0ih
         ArNtYMOgch3zriv1BPj+nkYFWlBqxaJTnuAALDwtGZNxKhZDUgEUUseAVm+HWeMow/JJ
         uHA14uRTnI/qbv9Aaia+fPiJg0E6NWnFBy2EIgZE7Dbg73lOLpzoOCacUvoUPPQBx9uE
         yqxQ==
X-Gm-Message-State: AOAM531HakMkcXieDRclipuXSiXQt/oHLJAtFd3gmDpYAmC32wWlehjX
        Nh1lfY7WWj41d3WUQK+vsNAY6Q==
X-Google-Smtp-Source: ABdhPJxs6gQED3x1xQTvItqVNfy4M5Qo43kL+qfgVTxzRYn7Au/Zt2MrLDv6L4EpPCU2Vk8oKw2lvA==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr21106137wrz.147.1637158775596;
        Wed, 17 Nov 2021 06:19:35 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:35 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 3/9] drm/omap: Add ovl checking funcs to dispc_ops
Date:   Wed, 17 Nov 2021 15:19:22 +0100
Message-Id: <20211117141928.771082-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=narmstrong@baylibre.com;
 h=from:subject; bh=3ZuXHPw5i+CUkF1E6yMQB6Ye+gRoZAVN+ibCccMbko0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MpgMs+k9m9KjXxdMN+K5FnHZiwxhfuTNuc+hO
 8TYYyFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0dXDD/
 9rddJZzDAyVVy0zGuJSR5vrT9SscH7YKGzgbzi/QbvYdk3qS0IsRCk9Sa5wvzir+mZO7bceGeXohXy
 LmudE6CoP8VliR0xTFksaJgXTvispoaLEEVksHWNwX7FJc4eTt0uMceYKKU9jlpRyYkf1L5sd5L09d
 Cpq3QWnqlS713r4N3YQL/C4HffyzYST/2NAxEpZp9UYhjXffall80+HiKy1IphicvXur82WEMR9sfo
 +ZPe9syKsSSQoKyf2ri2JXyvvSTlnujSQ3CElNT0dirwyTQEVyG6azzDLfz6GhnJDY8MPf9++1h6nO
 YZdtL6IXRTOBxCXdt71Hjg6nVj8xAndQ0KxyRI4KC7A8ZmjgmBAf2dKaW9/fCOzICYNActo93En0sy
 +8VNIc/BBgKBS/KOk6rZPIRgM0wasMEJ3xCQbuy6EcuSd9HI5+NFTgs2AYGN4rPkwdYt5+2FzYgSXj
 Dcr+rYrnOoNZq18h37vDUPn+mrWJFugvLN9VQwVeDf9b3ZHN4230A1vak5hW3VmTeixazGFYEuGbS4
 fEEVRghmrsKiA7vnlYtL1dP6w9bA1YEgvVouHp3CAbttr8lgGUm9URfZXiQhIlSne4MKuevqbMSlJf
 TAkPJ9yptpRpKJVcBQ0Kvt4sBiIRgXd7y9TqBWQdNTsKJfl0AA4m+MSnreBQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

In order to be able to dynamically assign overlays to planes we need to
be able to asses the overlay capabilities.

Add a helper function to be able to retrieve the supported capabilities
of an overlay.

And export the function to check if a fourcc is supported on a given
overlay.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
 drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index d3cf9d9aef63..2da4d36a3446 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -1281,8 +1281,8 @@ static u32 dispc_ovl_get_burst_size(struct dispc_device *dispc,
 	return dispc->feat->burst_size_unit * 8;
 }
 
-static bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
-					   enum omap_plane_id plane, u32 fourcc)
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc)
 {
 	const u32 *modes;
 	unsigned int i;
@@ -2489,6 +2489,11 @@ static int dispc_ovl_calc_scaling_44xx(struct dispc_device *dispc,
 	return 0;
 }
 
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane)
+{
+	return dispc->feat->overlay_caps[plane];
+}
+
 #define DIV_FRAC(dividend, divisor) \
 	((dividend) * 100 / (divisor) - ((dividend) / (divisor) * 100))
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 14c39f7c3988..4ff02fbc0e71 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -398,6 +398,9 @@ const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
 					    enum omap_plane_id plane);
 
 void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc);
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane);
 
 u32 dispc_read_irqstatus(struct dispc_device *dispc);
 void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
-- 
2.25.1

