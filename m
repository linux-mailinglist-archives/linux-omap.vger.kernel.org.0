Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C0D41D3AD
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 08:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348383AbhI3G7c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 02:59:32 -0400
Received: from muru.com ([72.249.23.125]:38924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348397AbhI3G7b (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 02:59:31 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4BD5E818C;
        Thu, 30 Sep 2021 06:58:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/5] dt-bindings: sdhci-omap: Update binding for legacy SoCs
Date:   Thu, 30 Sep 2021 09:57:29 +0300
Message-Id: <20210930065733.31943-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930065733.31943-1-tony@atomide.com>
References: <20210930065733.31943-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add compatible values for the legacy SoCs so we can continue
deprecating omap_hsmmc in favor of sdhci-omap driver.

For omap5, we want to have a separate compatible from omap4 for the
additional features available on omap5. AFAIK ti81 can just use the
omap4 compatible.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
--- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
@@ -5,7 +5,11 @@ Refer to mmc.txt for standard MMC bindings.
 For UHS devices which require tuning, the device tree should have a "cpu_thermal" node which maps to the appropriate thermal zone. This is used to get the temperature of the zone during tuning.
 
 Required properties:
-- compatible: Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
+- compatible: Should be "ti,omap2430-sdhci" for omap2430 controllers
+	      Should be "ti,omap3-sdhci" for omap3 controllers
+	      Should be "ti,omap4-sdhci" for omap4 and ti81 controllers
+	      Should be "ti,omap5-sdhci" for omap5 controllers
+	      Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
 	      Should be "ti,k2g-sdhci" for K2G
 	      Should be "ti,am335-sdhci" for am335x controllers
 	      Should be "ti,am437-sdhci" for am437x controllers
-- 
2.33.0
