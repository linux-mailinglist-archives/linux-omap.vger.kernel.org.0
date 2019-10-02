Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9204AC8EBF
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbfJBQoU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:44:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfJBQoT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:44:19 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52CC821D81;
        Wed,  2 Oct 2019 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034658;
        bh=LazMa1pK/qrmw9zIOVMVd3yQMbbcPVe3fHLRtGvw4yo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YBo3ntsWCjSQWgA/9XorDg11ldbCMjS1jo/ahsGpHl1nij+RyVeBbclDlBQZvZz1E
         iiDEfLn2/l1/z89eJyh0mjbRKS+TkkTzc7JmGgn5xF6jLZPHf6bpW4hbsnBmfmjFJv
         DWoPmIZlZ1QnWoss0qs27LW1FDMlOR4nlRTPN9VQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 05/10] ARM: dts: dove: Rename "sa-sram" node to "sram"
Date:   Wed,  2 Oct 2019 18:43:11 +0200
Message-Id: <20191002164316.14905-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "sa-sram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/dove.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 2e8a3977219f..3081b04e8c08 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -784,7 +784,7 @@
 				status = "disabled";
 			};
 
-			crypto_sram: sa-sram@ffffe000 {
+			crypto_sram: sram@ffffe000 {
 				compatible = "mmio-sram";
 				reg = <0xffffe000 0x800>;
 				clocks = <&gate_clk 15>;
-- 
2.17.1

