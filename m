Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862521B7927
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgDXPN3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50462 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgDXPN3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDNUb051974;
        Fri, 24 Apr 2020 10:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741203;
        bh=P8ZmpQjmczswA6Ei2TXEgbRC/mMssBRFI2xJIoa9u0I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Pn9SH0RQDazcGUb6lfDCDoWPXVkKMrQCY4nZuXYWoDGUTMcLzHo3kRdjxbKW6lHvw
         XaXlmezR0yh0vkX4taqe/LLDZ4y53KbLenQwan/4mkerYEotsMuFbvtTGQx4uPwaQB
         Bdmf+X2iVkt2XDW77arOHQkj8w8GSRe+SXHG0Qhg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFDNMR092288
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:13:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:23 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7P122378;
        Fri, 24 Apr 2020 10:13:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        Angela Stegmaier <angelabaker@ti.com>
Subject: [PATCH 17/17] ARM: dts: dra7-ipu-dsp-common: Add watchdog timers to IPU and DSP nodes
Date:   Fri, 24 Apr 2020 18:12:44 +0300
Message-ID: <20200424151244.3225-18-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The watchdog timer information has been added to all the IPU and DSP
remote processor device nodes in the DRA7xx/AM57xx SoC families. The
data has been added to the two common dra7-ipu-dsp-common and
dra74-ipu-dsp-common dtsi files that can be included by all the
desired board files. The following timers are chosen as the watchdog
timers, as per the usage on the current firmware images:
        IPU2: GPTimers 4 & 9 (one for each Cortex-M4 core)
        IPU1: GPTimers 7 & 8 (one for each Cortex-M4 core)
        DSP1: GPTimer 10
        DSP2: GPTimer 13

Each of the IPUs has two Cortex-M4 processors and so uses a timer
each for providing watchdog support on that processor irrespective of
whether the IPU is running in SMP-mode or non-SMP node. The chosen
timers also need to be unique from the ones used by other processors
(regular timers or watchdog timers) so that they can be supported
simultaneously.

The MPU-side drivers will use this data to initialize the watchdog
timer(s), and listen for any watchdog triggers. The BIOS-side code on
these processors needs to configure/refresh the corresponding timer
properly to not throw a watchdog error.

The watchdog timers are optional in general, but are mandatory to
be added to support watchdog error recovery on a particular processor.
These timers can be changed or removed as per the system integration
needs, alongside appropriate equivalent changes on the firmware side.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi  | 3 +++
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
index 23ce3b67faf7..a25749a1c365 100644
--- a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
@@ -23,14 +23,17 @@
 &ipu2 {
 	mboxes = <&mailbox6 &mbox_ipu2_ipc3x>;
 	ti,timers = <&timer3>;
+	ti,watchdog-timers = <&timer4>, <&timer9>;
 };
 
 &ipu1 {
 	mboxes = <&mailbox5 &mbox_ipu1_ipc3x>;
 	ti,timers = <&timer11>;
+	ti,watchdog-timers = <&timer7>, <&timer8>;
 };
 
 &dsp1 {
 	mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
 	ti,timers = <&timer5>;
+	ti,watchdog-timers = <&timer10>;
 };
diff --git a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
index a546cf740365..b1147a4b77f9 100644
--- a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
@@ -14,4 +14,5 @@
 &dsp2 {
 	mboxes = <&mailbox6 &mbox_dsp2_ipc3x>;
 	ti,timers = <&timer6>;
+	ti,watchdog-timers = <&timer13>;
 };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
