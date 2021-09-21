Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A8A412F37
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 09:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhIUHTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 03:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhIUHTm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 03:19:42 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF022C061760
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 00:18:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t8so29249441wri.1
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 00:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7uF0Ju609A3dPOAheIk7wjb/5qCM4rAGA2kRg4FHZ4=;
        b=OR2wui6VjK5ZS5kdC2paxolwDfj105bIdjj0Y40/FzANDUPZcdxe0hZ5XaghXoNgdk
         XbL3FD2Xzd1tn8x7Wt3FJETSXyWodSx5oMSlbEn5kM2St0ZVWEIwU4KOGbS+oxcCs1v5
         sawEWFY51RSxBbDgnsCMd1gYSmnIGPFbp9dZpOoacCiqWH1gJVWf1mH5+YMmQLXLNLJy
         ggbQXJ0xGZazo3FSsE5VgU45vJCaE7/XfoSF6IbsSBVFamp6078yXWadq6e5aiNr3huN
         +Um0S1SSbvdAP08Tu24VIYUNYZiDa7lZ8BpY0Goov/fAz92Ys2UP/AgFc1qCURhfSOwR
         04jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7uF0Ju609A3dPOAheIk7wjb/5qCM4rAGA2kRg4FHZ4=;
        b=z/zIOtZAnIys6bJGY1h8mQbEYqQc/ObnGUtO2CWvR+DsB9Dn643WMeqfyIjmI01CNn
         KStIx9UZ3l1ewTKB7OrXZyxMsk5fgFvRMN+RC5VEAIukH4mS2cJGyf20AOkY5NXNTd9w
         cGSuH6rJaBUkizxNn5IZZe71TVRKrNx8lRp7IyHCnbB5oA26gut8AHlaAxmycNXxE+S+
         cBKB18DGyBxasO6qG4IyaB0X7N8tXngL2znxjinyQzZonJSQ95walI1FRG/tJDe5VIPu
         XnhCfh40QfZGTLia+Cgb11/RLE7cRPvgI8sn7XYB+2JBQ6pwy0EoWZNE9uLxH41AEWU7
         +QHw==
X-Gm-Message-State: AOAM532YSVk6o6zOY/FZNEnvCa3AqGeDQS7fbM9wzTf80Wq1fz3YmQNf
        ebE5PKLqY0Vdp/bXSEL1Rk0JKw==
X-Google-Smtp-Source: ABdhPJwzF0OI1j11Yao0iEQAFr4D92BXLB53EGDrQsgNU3A85EpDT3FdkM07yJX+scDKxe/77JoIFg==
X-Received: by 2002:a5d:49c6:: with SMTP id t6mr33652411wrs.201.1632208690071;
        Tue, 21 Sep 2021 00:18:10 -0700 (PDT)
Received: from localhost.localdomain (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
        by smtp.gmail.com with ESMTPSA id w9sm1786918wmc.19.2021.09.21.00.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:18:09 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/1] ARM: dts: dra7: add entry for bb2d module
Date:   Tue, 21 Sep 2021 09:18:07 +0200
Message-Id: <20210921071807.30978-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921071807.30978-1-narmstrong@baylibre.com>
References: <20210921071807.30978-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Gowtham Tammana <g-tammana@ti.com>

BB2D is a Vivante GC 2D Accelerator.
This adds the node to the dts file within a target module node.
Crossbar index number is used for interrupt mapping.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/dra7.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index dfc1ef8ef6ae..6b485cbed8d5 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -965,6 +965,25 @@ hdmi: encoder@0 {
 			};
 		};
 
+		target-module@59000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x59000020 0x4>;
+			reg-names = "rev";
+			clocks = <&dss_clkctrl DRA7_DSS_BB2D_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x59000000 0x1000>;
+
+			bb2d: gpu@0 {
+				compatible = "vivante,gc";
+				reg = <0x0 0x700>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&dss_clkctrl DRA7_BB2D_CLKCTRL 0>;
+				clock-names = "core";
+			};
+		};
+
 		aes1_target: target-module@4b500000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x4b500080 0x4>,
-- 
2.25.1

