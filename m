Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4E41310ED
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgAFLA2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:00:28 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57948 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgAFLA2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:00:28 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B0GgX122763;
        Mon, 6 Jan 2020 05:00:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308416;
        bh=lxlHAeQb+Egn9A8TXfftZQl2W1CKFKU6Y+sq3Oy1S30=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=m+Oym2BZid1akuq0uN0DYUbr1Hz4T/G+sGY2cukFU87Aw5Hp6wBGlM/r6terXw/Bz
         1C2S7Y+M8Q5j3CrSejUpyLcgibIO+k4F3ghCVIi2X16Lnr32zj7M5lEJogozW2YABC
         1AWHdo1rHVakMGxZpboFfkfBZGqeHSZxpBytS1rw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B0Gxw096936;
        Mon, 6 Jan 2020 05:00:16 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:00:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:00:15 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00Jq007044;
        Mon, 6 Jan 2020 05:00:08 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 01/11] dt-bindings: sdhci-omap: Add properties for using external dma
Date:   Mon, 6 Jan 2020 16:31:23 +0530
Message-ID: <20200106110133.13791-2-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200106110133.13791-1-faiz_abbas@ti.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Chunyan Zhang <zhang.chunyan@linaro.org>

sdhci-omap can support both external dma controller via dmaengine
framework as well as ADMA which standard SD host controller
provides. Add binding documentation for these external dma properties.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
index 72c4dec7e1db..97efb01617dd 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
@@ -15,6 +15,13 @@ Required properties:
 		 "hs200_1_8v",
 - pinctrl-<n> : Pinctrl states as described in bindings/pinctrl/pinctrl-bindings.txt
 
+Optional properties:
+- dmas:		List of DMA specifiers with the controller specific format as described
+		in the generic DMA client binding. A tx and rx specifier is required.
+- dma-names:	List of DMA request names. These strings correspond 1:1 with the
+		DMA specifiers listed in dmas. The string naming is to be "tx"
+		and "rx" for TX and RX DMA requests, respectively.
+
 Example:
 	mmc1: mmc@4809c000 {
 		compatible = "ti,dra7-sdhci";
@@ -22,4 +29,6 @@ Example:
 		ti,hwmods = "mmc1";
 		bus-width = <4>;
 		vmmc-supply = <&vmmc>; /* phandle to regulator node */
+		dmas = <&sdma 61 &sdma 62>;
+		dma-names = "tx", "rx";
 	};
-- 
2.19.2

