Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313F13D01DE
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 20:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhGTSGi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 14:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGTSGg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Jul 2021 14:06:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4972AC061574
        for <linux-omap@vger.kernel.org>; Tue, 20 Jul 2021 11:47:12 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t9so23376662pgn.4
        for <linux-omap@vger.kernel.org>; Tue, 20 Jul 2021 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rxEs1C/QmakaiGNm8e0gee+gcdOkuo6zyDBpsMxd+M=;
        b=sh1FoIp7AQtCBs7N3hT+zWJXrqviLsOyahCfBz0hvOlVjxUikwFcYTcV3cH1v1PE9j
         BxXJUQXrzAp152htbrBHmOpb/7xYnYmRmyndZqUrgR6iz7W4BbmUTa9TfVGw1IOYsZfj
         uHJqVIwvZylfspcBiyrSrLrY/rfv88vZdNc/9nLa2w7LottHbHM1Y1GTmowEqrc5B9i6
         g1pFsQJ9kFwS/9oxOEwrnLQtRhb4/4AUwoDkuWq1jEpud8S+z1q8T8VUmektIUPlagJ2
         FYvjsDZA3ycw+gzck3EpjAIAp003+ryJ3KjUp6fKjxsMR+DwE2pfxIteDPR7wTPatYz7
         DKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rxEs1C/QmakaiGNm8e0gee+gcdOkuo6zyDBpsMxd+M=;
        b=ldq1jNaTVpvj5HrvdZlzdWSAm6iQoOMva10yaLGxej7lzRk3v7ShamwslXUaH+FmFd
         wm4qDzeEwmFgqlTAIho8DSkFqqHIGxCEi6atKNt55GsOT/WswsAgk3m5Qcv8pfnsFNlp
         4a5Jcxg+l8mG/risHuV9CS7hxFK/2cCwCU5G15GpztN+3CwUwr3fE1j2zOBvAVmUZM3K
         Dtaoq9hrTFVdIfGVbRS3ENeuLJsdkpXQHADexg7tzRiL++qgDCTLp+vOPPfcqzphsCpG
         mD0KHt/woOO2wQhIn05ILq6KdCe/FFLdmNDYFFXvYrDY/R8M7aYUtBX1S+yCFwvXucYW
         nAfw==
X-Gm-Message-State: AOAM532n/4cLrC1fXlxozajg0zNU5X6kVMDGY4OTSZk5xkzy0d9fC17v
        cASQJvl8tszeNYZPFtstxTOIP3yNcNDewg==
X-Google-Smtp-Source: ABdhPJyTWDmNsFp2oU8OQgIedicBgNmTSyiFCO+sAlphkGnG0Ngvw8cxeBnFbmdT7tZF2jmXCIbHfA==
X-Received: by 2002:a63:d44f:: with SMTP id i15mr32248403pgj.391.1626806831600;
        Tue, 20 Jul 2021 11:47:11 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
        by smtp.gmail.com with ESMTPSA id pj3sm19438410pjb.35.2021.07.20.11.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 11:47:10 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     Tero Kristo <kristo@kernel.org>
Subject: [PATCH] ARM: omap2+: hwmod: fix potential NULL pointer access
Date:   Tue, 20 Jul 2021 11:47:10 -0700
Message-Id: <20210720184710.17726-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

omap_hwmod_get_pwrdm() may access a NULL clk_hw pointer in some failure
cases. Add a check for the case and bail out gracely if this happens.

Reported-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 65934b2924fb..12b26e04686f 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3776,6 +3776,7 @@ struct powerdomain *omap_hwmod_get_pwrdm(struct omap_hwmod *oh)
 	struct omap_hwmod_ocp_if *oi;
 	struct clockdomain *clkdm;
 	struct clk_hw_omap *clk;
+	struct clk_hw *hw;
 
 	if (!oh)
 		return NULL;
@@ -3792,7 +3793,14 @@ struct powerdomain *omap_hwmod_get_pwrdm(struct omap_hwmod *oh)
 		c = oi->_clk;
 	}
 
-	clk = to_clk_hw_omap(__clk_get_hw(c));
+	hw = __clk_get_hw(c);
+	if (!hw)
+		return NULL;
+
+	clk = to_clk_hw_omap(hw);
+	if (!clk)
+		return NULL;
+
 	clkdm = clk->clkdm;
 	if (!clkdm)
 		return NULL;
-- 
2.31.1

