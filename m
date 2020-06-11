Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190311F6B05
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jun 2020 17:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgFKP37 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jun 2020 11:29:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50272 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgFKP36 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Jun 2020 11:29:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BFTtIv130248;
        Thu, 11 Jun 2020 10:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591889395;
        bh=hbtuhUNZ9tzwg2QjtHoSOIKYGRSF668PaftacXVIw3Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uhChi/QNSJPqJWTW3VjDEL066AKDT5+gTcLwHyQLVw5m7hXVv4enjpYse4xWwsPDg
         cojtk5idlOaciAcz9OjygM6waMeYkgVc1NBaRyrHPQZ6Yq8o65NwGaCnYAU2zC7Hkv
         4GzZfuQo5frwrwhM+SIdGaKxVZwDa6shAphRA3AE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BFTt4a083053
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Jun 2020 10:29:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 10:29:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 10:29:54 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BFTswZ021089;
        Thu, 11 Jun 2020 10:29:54 -0500
Received: from localhost ([10.250.48.148])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 05BFTsVs085866;
        Thu, 11 Jun 2020 10:29:54 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jason Kridner <jdk@ti.com>, Caleb Robey <c-robey@ti.com>,
        Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] ARM: dts: am5729-beaglebone-ai: Enable IPU & DSP rprocs
Date:   Thu, 11 Jun 2020 10:29:44 -0500
Message-ID: <20200611152945.27656-2-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200611152945.27656-1-s-anna@ti.com>
References: <20200611152945.27656-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Assign the previously added CMA reserved memory nodes to the respective
IPU and DSP rproc device nodes, and enable these rproc nodes so that
these remote processors can be booted on the AM5729 BeagleBone AI board.

The addresses and sizes of the CMA pools are identical to those used on
various other TI AM572x/AM574x based boards. The mailboxes, timers and
watchdog-timers for all these remoteprocs are inherited by including the
common dra72-ipu-dsp-common.dtsi file.

An associated pair of the rproc node and its CMA node can be disabled
later on if there is no use-case defined to use that remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am5729-beagleboneai.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 9877d7709d41..619e75927224 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -8,6 +8,7 @@
 #include "dra74x.dtsi"
 #include "am57xx-commercial-grade.dtsi"
 #include "dra74x-mmc-iodelay.dtsi"
+#include "dra74-ipu-dsp-common.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/dra.h>
@@ -729,3 +730,23 @@ opp_slow-500000000 {
 		opp-shared;
 	};
 };
+
+&ipu2 {
+	status = "okay";
+	memory-region = <&ipu2_memory_region>;
+};
+
+&ipu1 {
+	status = "okay";
+	memory-region = <&ipu1_memory_region>;
+};
+
+&dsp1 {
+	status = "okay";
+	memory-region = <&dsp1_memory_region>;
+};
+
+&dsp2 {
+	status = "okay";
+	memory-region = <&dsp2_memory_region>;
+};
-- 
2.26.0

