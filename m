Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FE64158BE
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239544AbhIWHIk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239538AbhIWHIi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2C1C061762
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id g16so14223502wrb.3
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/81sSyyxvMo1ibeq3AtPzZF+vUWnLboV86d+Wu7gvLo=;
        b=XGz7zHiTqUzR1wmtOzMHkib8qZf+yqVPgG2Kxb9agUMdSa74B5PAzvnGhksC0J61l+
         gbeiTnIEg4T+LXsyNjyb8+oXknkm2d/Q8jBLRCOFQVRVy/EEhuldm9M2V7ID34rXkSBD
         lMm8YTqbFBV8J4U13o4EGthVqG4ZlgyCK8F68hvY5xwUJqRc8z1Qysp7LJoRKtayA+lw
         wAAYh256XFoyaSzuZDSBY0d7s41VjvDgFX5ZlbvxaPKtNYr4DUbnw36ZwuP5Oz5PwvcD
         c7JUf8XtPzX7fmi4lhNTgjLjWZf17Tg4jXSKFgJkA0NbE/Ikl35HtkaWUTbZGy3ECct4
         SsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/81sSyyxvMo1ibeq3AtPzZF+vUWnLboV86d+Wu7gvLo=;
        b=nQ3csqEwNDrYqBT9LNXhJbInpzqX77IcmMQG2euX9rVIAihdS9o+exY02+9yzRzAyz
         Gu9sBxkFnD0viyWvgw3DQ3bA/0pBQ+lL1RttT9HD2UAsSUa/Sk15W4bKu600WAmgfrv/
         CGi0BB4lliYW0trbRfW+D7sQ85xYKCceXb0TujWYGhDUuuHIqcKCjYQrK/0Vs88j0pIr
         IAUlhZpyT9e6+U/YRd3y8O6zfGHxt2/hxmS1Lvv+WemuQrjBrDHKBfVmPdbejFJWT31t
         twRtwSTSCginYhHpBGP1VzniruyqkP5Cd19CvGbjyzfintiDeWjBESaEnjjbNksP44k8
         yybA==
X-Gm-Message-State: AOAM533vl0EUpH5qSt6otq+GMDFvCC9SjkdImy4e+44hLCwY1zTkHiOT
        Qd55POx0RYV43zcz6ng/mqlk+w==
X-Google-Smtp-Source: ABdhPJzvK6+kkW7WQP3/h9qj7aFOHACeP1+5CPokeFbIVV+WS6TnnNKWAZewOmf9t7VSKZ47PK3nZg==
X-Received: by 2002:adf:edc7:: with SMTP id v7mr3218835wro.63.1632380825408;
        Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:04 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 2/8] drm/omap: Add ovl checking funcs to dispc_ops
Date:   Thu, 23 Sep 2021 09:06:55 +0200
Message-Id: <20210923070701.145377-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=narmstrong@baylibre.com;
 h=from:subject; bh=Wlxh4ChQtQ3J8QTuldvFif6dgGSQt01TuE/tUnTUmZU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchLvhFU34Ve0/Nb7xWC7pqWPlUGUB7Oe3pfZy0
 i0xGPk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0Y1yEA
 ClKhNhzDjL7ymUKnrKgJNt0URG2tcFseQ2cMa/nQz3M185rpH7m2YpireAuB2fEh63xJgSNC6uMD71
 5JFxzRR9Ln8mOzVI2HibMsVtdqlHcKNmyfVsHqQEe7APDXKOEyzVPkCk52PcUM1gWTvjhApniBuOzq
 WETV6RA8HJpPmea9S4H2A7s1ANetH6mjKmtdFhjJejk/KbHT9BDYmL31lrUkscJPmFqQG1In0h2J6r
 CcuMVqPIFrw5VM2Y6Xj18DEZBbu9RSXYe2UDDmswX+FFPemDEQhYlL4qGy+NHJ2esGlkyWjKUMnUVg
 gRZrAh+s92M+j9XblWS5Yz12QnuUMzSqIT80Yzk+Jhn8ztJXJQnL2csjpKEcAMBh0brzA8zJxU1XFh
 cqZKoFZgla6vmUCHzgu32HnCgJVkjbeh+glS0InDwdV1i1weAm0RbOdzA4avP8GWl5flcnKt9k2YlI
 84RhCeMBzZsUZ/sblrwNTGAsWYMiqwKdl3GCR684p+yuXPtHYXn+k6laRh5r7i+OIxRwAYJUZSmjYx
 ZAkgfh0J909RbB4FJqQryJP7CO7OfIZY84Wu5yKGqr8vBJpsMjLBmVSsycq6BfTP/wcEUQyj5exTin
 kITumX6LNqgV//czhZU1/j5VKlc5RsThZ28nL3THaV+sRfF/eGD13m/8vZ6g==
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
index bdecec8f4d88..df945e4b1fd3 100644
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

