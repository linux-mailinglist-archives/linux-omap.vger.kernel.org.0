Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E5821AB79
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGIXUS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49318 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgGIXUR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NKAF4122959;
        Thu, 9 Jul 2020 18:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336810;
        bh=u3p1npC2557z4sLt7pkiAxqgy+7rym2HrvMf1wembWw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IBOg/QN+aoXjhpU/t5LE6tJIgWUECQCOtRYAfmqwHfUx1I1RG+weVeiRZ02m+FGHX
         LjMyGPo06hhvZwGkim7yBuBfYWEAiI30NGS/w5JmaShJBmbtGt6iOPou6SM8JUYVgE
         XqgC3phDPhVA85/BasR+KFBsas69QT8SbhYFs3mo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NKABg012122
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:10 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NKAi3096163;
        Thu, 9 Jul 2020 18:20:10 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NKAMD124482;
        Thu, 9 Jul 2020 18:20:10 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 12/13] ARM: dts: omap4-panda-common: Add watchdog timers for IPU and DSP
Date:   Thu, 9 Jul 2020 18:19:53 -0500
Message-ID: <20200709231954.1973-13-s-anna@ti.com>
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
devices on all the OMAP4-based Panda boards. The following timers
are used as the watchdog timers,
	DSP : GPT6
	IPU : GPT9 & GPT11 (one for each Cortex-M3 core)

The MPU-side drivers will use this data to initialize the watchdog
timers, and listen for any watchdog triggers. The BIOS-side code
needs to configure and refresh these timers properly to not throw
a watchdog error.

These timers can be changed or removed as per the system integration
needs, alongside appropriate equivalent changes on the firmware side.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4-panda-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index db0b7e9264f9..a6a0c7b832dd 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -596,10 +596,12 @@ &dsp {
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

