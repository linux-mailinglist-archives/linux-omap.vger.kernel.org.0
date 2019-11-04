Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30A3DEEA6D
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbfKDUt6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:49:58 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58210 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDUtJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:49:09 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn4jC129043;
        Mon, 4 Nov 2019 14:49:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572900544;
        bh=zWBhOOfeKxZLi5xztSZD4Ml4LW3AVvoUR5jhAapcIVA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d+hzKMBSe7c172B9RrZF3EfurlJChMPwQaAIYhKQGlMzBVpaLyjpN0YuXFKTa3N3L
         ALsk/vYQdLCzm5iQtjPYVWQetxFZ4/DdE15CbLKqLnxr5ltQQONTNlYw2WeTpbT9hx
         viPq0bsLHxZ78k4nDuNkXHd7/aInPBle4hSxEzcU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4Kn4lT038228
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 14:49:04 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:48:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:49:04 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kmvxw038360;
        Mon, 4 Nov 2019 14:49:03 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 02/10] ARM: dts: dra7: add cam clkctrl node
Date:   Mon, 4 Nov 2019 14:48:45 -0600
Message-ID: <20191104204853.4355-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104204853.4355-1-bparrot@ti.com>
References: <20191104204853.4355-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl nodes for CAM domain.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index d1c2406ec71c..199f8d483f75 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1734,6 +1734,20 @@
 		};
 	};
 
+	cam_cm: cam-cm@1000 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1000 0x100>;
+
+		cam_clkctrl: cam-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x2c>;
+			#clock-cells = <2>;
+		};
+	};
+
 	dss_cm: dss-cm@1100 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1100 0x100>;
-- 
2.17.1

