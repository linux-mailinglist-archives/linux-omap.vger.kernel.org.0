Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D755D431F91
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 16:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhJRObC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 10:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhJRObA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 10:31:00 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F405C06161C
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u18so41929325wrg.5
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5H2hhzuRrvmA/4yp/fNI9riPBu8q3rix23PsNkWExX4=;
        b=EMOfL+zMR3n+voUDGnHpGA8hK7xhP9l2G8bv3uB/w1/ggpy9RAab8rmCLNjg+JMAKL
         shO2XE70RQJVyJMZh1GblHFGqx1aA9unr15AqjahO64JHvpYWLjt68wArBhL5KvS1wv0
         nGEYMDqxG8yRuf5nJhmO/sDDorJeiXQXHRbSRFW0Hn0mTF0uHTShYR1w/ZqNh7oDKBks
         2gg10Jp+HCWWSANx6TIBX0i3EExfT2L0xruyTQjPgiSsaAEL55rYU61aLNfhoXmw8z1W
         9GYUJJGwH9ouxedT1vRxznnXwmt+IiZnmyi1sjxJQdNTUC6PL4+HHaor3TV5CVISMSBp
         b3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5H2hhzuRrvmA/4yp/fNI9riPBu8q3rix23PsNkWExX4=;
        b=hWhRfrkQcn2CtasiqExtxXwiH7gswqF0MzWovVfIaROw3rA8pljUkqSt8753d7EEpY
         xtVwDQR1WQw8/jEhj6py67Yw8tUfURV4JeXtpjpLdStO/W6OQrJ1ADGJqPiA5QNVZ32Y
         CZxhQyQrzcLKXVa2ht01cMyLYgvXYydVkZlcyoOPkNWwPQHVqBpHxmg6TlWzcgCZzglU
         ISz/GMwtqdDpsXMeTL3+hAmo0cL8LQj75vLCdQa9GPqknCYQG64Yu68Ky6cYq8aBaut8
         exKfkdn0XiPvu9E97IwS4uCcI5jqn9LIzd4ICNHBZ7j6/8C0yxjqyeVJ/kaHfN3PkvFB
         XtoQ==
X-Gm-Message-State: AOAM532njP+DjbMKnA4VaeGyfge5PQHq3vcWAAZlX/RB0UFRuW6/DC1w
        4VF3O55s9bItNmsYivhcwuWy6Q==
X-Google-Smtp-Source: ABdhPJzQuzaxNQ3bud8LujqNIFqGNFYw34jL1vJ2T8djA36YlLePQjxHnCPScXcjcWKOX+sPfv+trA==
X-Received: by 2002:adf:bb12:: with SMTP id r18mr36073651wrg.313.1634567328043;
        Mon, 18 Oct 2021 07:28:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
        by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:28:47 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 3/9] drm/omap: Add ovl checking funcs to dispc_ops
Date:   Mon, 18 Oct 2021 16:28:36 +0200
Message-Id: <20211018142842.2511200-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=narmstrong@baylibre.com;
 h=from:subject; bh=koW8JWicC/ikxRWVypGZv81IJqBAw7vmCwy+5yAxnpw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSFU+lQsT2xLcINix4tQSeHdOJZ9AaFtpUCP2s/
 W9Lto32JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0aiPD/
 0UhV4dm089UmDROSLcsjGPn3RsOpemnxIiXeCTyg7MxV38TSWTqd96dG5hL5vs4kzy0ity7rtleZTN
 PP2XsOnBBdN9Ku0Aa1iVqDbSCbxoZm4CTnkhSLAYzrCG4f9xtd6PpXO5Upi5/Z7EOSAiiBZwk1a/dV
 VjSPtsY8kqOlO6rZqOmsR3hPAWVANl62bQF7i1FwL3QQqiSoHZDDS4r6jE1b10l7PknPB60IIqMVM3
 wJ4Uin/8Me4nOt+uv4IM+c5WYjY1fzEZFNESsASnVRg5MvGHhEc0QiFOxhXQ62W7aE4/Ldn/51tEIb
 MnzDIX6Nl28Ahf9P8TpD/PnHwdg6nFP8xNHrSh0dMO1soUX7EwB9Z/3SH1HLk5yB9OS/tqYOaYYL6z
 W4IRbhNFvC74RmqJKEDTrE0bQ8QyfzXASQVwENHASIESK9q2NpRYQx1E7WJI0OvgDYzB37gTARXE8m
 PEfh5DCqeP0EGZS44ymX/5+8zza4H/UaHHN/DpRUepF81+vQeoC+YFWlMyj5FDCLrs+QjMASyulBw/
 hXW1Hoh6pG4v2rixs27yKoFMjCR2txVGAQAuiDdyFTPM8U3U5vgyFs9I4QA4qHZwcgKXXFTwjYDOiZ
 rsDyzoq4+kF+J3PHI7/FcZLU5qkH4E6JpPHa7HXTm6/fOzuV/nBdxx3251nQ==
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
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
 drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 5ac90ba6b76d..dd36db75b4b4 100644
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

