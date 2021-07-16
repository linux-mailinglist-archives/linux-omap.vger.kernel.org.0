Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C383CBA50
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jul 2021 18:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhGPQK1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Jul 2021 12:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhGPQK1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Jul 2021 12:10:27 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725BAC06175F
        for <linux-omap@vger.kernel.org>; Fri, 16 Jul 2021 09:07:32 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id y17so10367894pgf.12
        for <linux-omap@vger.kernel.org>; Fri, 16 Jul 2021 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8awA/oTYaOk9R8z60joH+KUUc5uv6dZerurOLNP4+S4=;
        b=liXwip506zuoTFBCjOu8+ZhZ1FQDTt7H3Sbdlpq4PrpNxdqD7r3p/HPIUnAvCjDR6X
         ed0Tf8sIzvT3fQQgaCioAxp7uCMCpQIuBifJcMbk3nxL38cKd3xjNV6CqfR852//FKjB
         wGjjnMm5mift5Gqwh3K8/s+xJtC5QVgZ1UO8CL0vFw32Xe7YwSFVVe3eSesxs4SGp7IA
         mAPPr18BR94iPBBROBJPAT4VSKvcJy6P/wOmEkSwkiEgsVkvfy0/QpqBo6hhzOy1Zw1R
         eIesXVBekObGHQ85qISk8b8/gC2v4vlaDQrvBs3QiKLEQr+2tTMWTsz7DRFliZvcL4SF
         WUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8awA/oTYaOk9R8z60joH+KUUc5uv6dZerurOLNP4+S4=;
        b=GEzY5ZTp1iy13ycmcElxwosDjxcVR1wdhjXBJ8vdKZG+1p9QRb6tLe6Gj/1LrS87i3
         zm2jJYk8zSvKg9GiSQz07Mc6q3zzm9lc54vki6RRLFhNkRzOZ03AmaKu4oDOra7QYdVJ
         0v0LLxnQPzBmsHhG9qttM8QsWAW8KKAnlwHssSDfZlMPvfluwIbW/mZouRXZLDj6WqAn
         saiMqqym03hm4fb6yRXVMtOTGFULgm6apQtxXPq7Nr6RpJDDp7WQmvJaXBh+FBlBkHT/
         0KxhyNvbL/RHAV5oOM8eGU2Kfo6D4f4QdWnMU87PMiK7tvdjPrpdsMbQQk/U3k+GEkCp
         /SLg==
X-Gm-Message-State: AOAM530ljSXTQtKyKLJpjKz8JQlK1tdUxy2qA3ZKvo2gVoGm8n78xK7r
        +q/S7J/HuRY9DH2dVx9xpyRpVQ==
X-Google-Smtp-Source: ABdhPJwC3/3v4i+N5JJuKFVDcWQnN6glwV6CD9Ij0poHpcB9jv4bGLK+udik2Gdt5iemkoNzI+s1dA==
X-Received: by 2002:a63:a441:: with SMTP id c1mr5087596pgp.59.1626451651890;
        Fri, 16 Jul 2021 09:07:31 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
        by smtp.gmail.com with ESMTPSA id mu9sm10921489pjb.26.2021.07.16.09.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 09:07:31 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH] ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218
Date:   Fri, 16 Jul 2021 09:07:30 -0700
Message-Id: <20210716160730.30547-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Based on the latest timing specifications for the TPS65218 from the data
sheet, http://www.ti.com/lit/ds/symlink/tps65218.pdf, document SLDS206
from November 2014, we must change the i2c bus speed to better fit within
the minimum high SCL time required for proper i2c transfer.

When running at 400khz, measurements show that SCL spends
0.8125 uS/1.666 uS high/low which violates the requirement for minimum
high period of SCL provided in datasheet Table 7.6 which is 1 uS.
Switching to 100khz gives us 5 uS/5 uS high/low which both fall above
the minimum given values for 100 khz, 4.0 uS/4.7 uS high/low.

Without this patch occasionally a voltage set operation from the kernel
will appear to have worked but the actual voltage reflected on the PMIC
will not have updated, causing problems especially with cpufreq that may
update to a higher OPP without actually raising the voltage on DCDC2,
leading to a hang.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm/boot/dts/am43x-epos-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index aae0af10a5b1..2aa75abf85a9 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -582,7 +582,7 @@ &i2c0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
-	clock-frequency = <400000>;
+	clock-frequency = <100000>;
 
 	tps65218: tps65218@24 {
 		reg = <0x24>;
-- 
2.31.1

