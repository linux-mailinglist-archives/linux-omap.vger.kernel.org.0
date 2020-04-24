Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31E01B791C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgDXPNP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54152 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgDXPNP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFD8uD102837;
        Fri, 24 Apr 2020 10:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741188;
        bh=fI0sdQm2IdUNqVR48BJqjmXnYRo3kmpLOoT56kJvWS0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WJFOTyCa/y/tveYeIaiJLRs+uJ0yUpN7aOkLr97x2pWrqfSct7/tQ/Yz+vtSGFIym
         bavOG012toVa2lscDcZXUbiOjESzpcTj9bmTO2sfB1iSU2krjqg2heRoWM/8Vv/iH7
         ETghRVPJat1keRmh9WBIx1IhzfGTmOe8vpa0MInk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFD8WM043357;
        Fri, 24 Apr 2020 10:13:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:08 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7F122378;
        Fri, 24 Apr 2020 10:13:07 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 07/17] ARM: dts: dra7-ipu-dsp-common: Add mailboxes to IPU and DSP nodes
Date:   Fri, 24 Apr 2020 18:12:34 +0300
Message-ID: <20200424151244.3225-8-t-kristo@ti.com>
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

Add the required 'mboxes' property to all the IPU and DSP remote
processors (IPU1, IPU2, DSP1 and DSP2) in the two available common
dtsi files - dra7-ipu-dsp-common and dra74-ipu-dsp-common dtsi files.
The latter file is for platforms having DRA74x/DRA76x/AM572x/AM574x
SoCs which do have a DSP2 processor in addition to the other common
remote processors. The common data is added to the former file, and
the DSP2 only data is added to the latter file.

The mailboxes are required for running the Remote Processor Messaging
(RPMsg) stack between the host processor and each of the remote
processors. Each of the remote processors uses a single sub-mailbox
node, the IPUs are assumed to be running in SMP-mode. The chosen
sub-mailboxes match the values used in the current firmware images.
This can be changed, if needed, as per the system integration needs
after making appropriate changes on the firmware side as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi  | 12 ++++++++++++
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
index 478a07e29538..8a53da1c5f2e 100644
--- a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
@@ -19,3 +19,15 @@
 		status = "okay";
 	};
 };
+
+&ipu2 {
+	mboxes = <&mailbox6 &mbox_ipu2_ipc3x>;
+};
+
+&ipu1 {
+	mboxes = <&mailbox5 &mbox_ipu1_ipc3x>;
+};
+
+&dsp1 {
+	mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
+};
diff --git a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
index 645063d0df13..6e31c1c27fd4 100644
--- a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
@@ -10,3 +10,7 @@
 		status = "okay";
 	};
 };
+
+&dsp2 {
+	mboxes = <&mailbox6 &mbox_dsp2_ipc3x>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
