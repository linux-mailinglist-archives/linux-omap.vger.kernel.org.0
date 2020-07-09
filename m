Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BA221AB77
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgGIXUS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55410 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbgGIXUS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NKB28019098;
        Thu, 9 Jul 2020 18:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336811;
        bh=hoL0x9O1kvkaT4prL5tfXltZY55PUwkw/Roc9kLuZoA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uQrDfkRX1E7dRRpd+FVkx8e9aDd0eG5JNkddM8kTRSJcGB8SYCakzom7KEQaasN6P
         z+8aqRnjO5MOOA7bgMXm+ROFz96mOjsz4MAn7ESQ0ppXy9m60CayKsFPRsUiiiO1jZ
         kGr85dwwFamhgdNTrFHDMDz605ciqbUQNwhrdqrE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NKBoo012138
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:11 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:10 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NKAtp032199;
        Thu, 9 Jul 2020 18:20:10 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NKAmV124485;
        Thu, 9 Jul 2020 18:20:10 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 13/13] ARM: dts: omap5-uevm: Add watchdog timers for IPU and DSP
Date:   Thu, 9 Jul 2020 18:19:54 -0500
Message-ID: <20200709231954.1973-14-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The watchdog timers have been added for the IPU and DSP remoteproc
devices for the OMAP5 uEVM board. The following timers (same as the
timers on OMAP4 Panda boards) are used as the watchdog timers,
        DSP : GPT6
        IPU : GPT9 & GPT11 (one for each Cortex-M4 core)

The MPU-side drivers will use this data to initialize the watchdog
timers, and listen for any watchdog triggers. The BIOS-side code
needs to configure and refresh these timers properly to not throw
a watchdog error.

These timers can be changed or removed as per the system integration
needs, alongside appropriate equivalent changes on the firmware side.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap5-uevm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
index bb016419ef61..9b9e9ee51b5c 100644
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -223,10 +223,12 @@ &dsp {
 	status = "okay";
 	memory-region = <&dsp_memory_region>;
 	ti,timers = <&timer5>;
+	ti,watchdog-timers = <&timer6>;
 };
 
 &ipu {
 	status = "okay";
 	memory-region = <&ipu_memory_region>;
 	ti,timers = <&timer3>;
+	ti,watchdog-timers = <&timer9>, <&timer11>;
 };
-- 
2.26.0

