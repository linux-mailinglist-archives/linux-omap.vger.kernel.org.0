Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96759416CE2
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 09:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244334AbhIXHgS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 03:36:18 -0400
Received: from muru.com ([72.249.23.125]:36814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231921AbhIXHgS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 03:36:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 99D6580EE;
        Fri, 24 Sep 2021 07:35:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: sdhci-omap: Document ti,non-removable property as deprecated
Date:   Fri, 24 Sep 2021 10:34:41 +0300
Message-Id: <20210924073441.7835-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Nowadays the standard non-removable property should be used, but we
still need to parse the ti,non-removable too. Let's document it as a
deprecated property.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
--- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
@@ -28,6 +28,9 @@ Optional properties:
 		DMA specifiers listed in dmas. The string naming is to be "tx"
 		and "rx" for TX and RX DMA requests, respectively.
 
+Deprecated properties:
+- ti,non-removable: Compatible with the generic non-removable property
+
 Example:
 	mmc1: mmc@4809c000 {
 		compatible = "ti,dra7-sdhci";
-- 
2.33.0
