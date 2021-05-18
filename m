Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D445D387E96
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 19:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344033AbhERRii (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 13:38:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57928 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245210AbhERRih (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 May 2021 13:38:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IHbGaf058030;
        Tue, 18 May 2021 12:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621359436;
        bh=IeqgRMbIKCozvn4vzChEDUGiPGvLqWhYDyJm8OxOlPU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oOKQvjbltwd4ZOMuu24rvvxUi82ZsJl12Npx/XGbGfP+zReG41gfd6TnvW+dRjPfk
         SfDPjPMjZJNBIbYo4kKvCA3/ZqnI3bWVPC3SuN3KaKydKR/iu4iUxvXt/QHBMVC+yR
         QJpG7sMU3Md9i3q+K0nAt+l8YkdGCAjdo/pTZ+Ls=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IHbGlW004413
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 12:37:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 12:37:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 12:37:15 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IHbF9J096529;
        Tue, 18 May 2021 12:37:15 -0500
Received: from localhost ([10.250.32.40])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14IHbF5Y127028;
        Tue, 18 May 2021 12:37:15 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/4] ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names
Date:   Tue, 18 May 2021 12:36:45 -0500
Message-ID: <20210518173645.12270-5-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210518173645.12270-1-s-anna@ti.com>
References: <20210518173645.12270-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A number of sub-mailbox node names in various OMAP2+ dts files are
currently using underscores. This is not adhering to the node name
convention, fix all of these to use hiphens.

These nodes are already using the prefix mbox, so they will be in
compliance with the sub-mailbox node name convention being added in
the OMAP Mailbox YAML binding as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts   | 8 ++++----
 arch/arm/boot/dts/dm816x.dtsi               | 2 +-
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi  | 6 +++---
 arch/arm/boot/dts/dra72x.dtsi               | 6 +++---
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi | 2 +-
 arch/arm/boot/dts/dra74x.dtsi               | 8 ++++----
 arch/arm/boot/dts/omap4-l4.dtsi             | 4 ++--
 arch/arm/boot/dts/omap5-l4.dtsi             | 4 ++--
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 0d5fe2bfb683..e7b037b8a6dc 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -454,20 +454,20 @@ &sata {
 
 &mailbox5 {
 	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
+	mbox_ipu1_ipc3x: mbox-ipu1-ipc3x {
 		status = "okay";
 	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
+	mbox_dsp1_ipc3x: mbox-dsp1-ipc3x {
 		status = "okay";
 	};
 };
 
 &mailbox6 {
 	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
+	mbox_ipu2_ipc3x: mbox-ipu2-ipc3x {
 		status = "okay";
 	};
-	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
+	mbox_dsp2_ipc3x: mbox-dsp2-ipc3x {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
index 3551a64963f8..1825d912b8ab 100644
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -351,7 +351,7 @@ mailbox: mailbox@480c8000 {
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <12>;
-			mbox_dsp: mbox_dsp {
+			mbox_dsp: mbox-dsp {
 				ti,mbox-tx = <3 0 0>;
 				ti,mbox-rx = <0 0 0>;
 			};
diff --git a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
index a25749a1c365..a5bdc6431d8d 100644
--- a/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi
@@ -5,17 +5,17 @@
 
 &mailbox5 {
 	status = "okay";
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
+	mbox_ipu1_ipc3x: mbox-ipu1-ipc3x {
 		status = "okay";
 	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
+	mbox_dsp1_ipc3x: mbox-dsp1-ipc3x {
 		status = "okay";
 	};
 };
 
 &mailbox6 {
 	status = "okay";
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
+	mbox_ipu2_ipc3x: mbox-ipu2-ipc3x {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index d403acc754b6..85ab1f46e56b 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -77,12 +77,12 @@ &dss {
 };
 
 &mailbox5 {
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
+	mbox_ipu1_ipc3x: mbox-ipu1-ipc3x {
 		ti,mbox-tx = <6 2 2>;
 		ti,mbox-rx = <4 2 2>;
 		status = "disabled";
 	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
+	mbox_dsp1_ipc3x: mbox-dsp1-ipc3x {
 		ti,mbox-tx = <5 2 2>;
 		ti,mbox-rx = <1 2 2>;
 		status = "disabled";
@@ -90,7 +90,7 @@ mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
 };
 
 &mailbox6 {
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
+	mbox_ipu2_ipc3x: mbox-ipu2-ipc3x {
 		ti,mbox-tx = <6 2 2>;
 		ti,mbox-rx = <4 2 2>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
index b1147a4b77f9..3256631510c5 100644
--- a/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
+++ b/arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi
@@ -6,7 +6,7 @@
 #include "dra7-ipu-dsp-common.dtsi"
 
 &mailbox6 {
-	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
+	mbox_dsp2_ipc3x: mbox-dsp2-ipc3x {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index e1850d6c841a..411ad295c201 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -188,12 +188,12 @@ &dss {
 };
 
 &mailbox5 {
-	mbox_ipu1_ipc3x: mbox_ipu1_ipc3x {
+	mbox_ipu1_ipc3x: mbox-ipu1-ipc3x {
 		ti,mbox-tx = <6 2 2>;
 		ti,mbox-rx = <4 2 2>;
 		status = "disabled";
 	};
-	mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
+	mbox_dsp1_ipc3x: mbox-dsp1-ipc3x {
 		ti,mbox-tx = <5 2 2>;
 		ti,mbox-rx = <1 2 2>;
 		status = "disabled";
@@ -201,12 +201,12 @@ mbox_dsp1_ipc3x: mbox_dsp1_ipc3x {
 };
 
 &mailbox6 {
-	mbox_ipu2_ipc3x: mbox_ipu2_ipc3x {
+	mbox_ipu2_ipc3x: mbox-ipu2-ipc3x {
 		ti,mbox-tx = <6 2 2>;
 		ti,mbox-rx = <4 2 2>;
 		status = "disabled";
 	};
-	mbox_dsp2_ipc3x: mbox_dsp2_ipc3x {
+	mbox_dsp2_ipc3x: mbox-dsp2-ipc3x {
 		ti,mbox-tx = <5 2 2>;
 		ti,mbox-rx = <1 2 2>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
index 99721673d7af..46b8f9efd413 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -600,11 +600,11 @@ mailbox: mailbox@0 {
 				#mbox-cells = <1>;
 				ti,mbox-num-users = <3>;
 				ti,mbox-num-fifos = <8>;
-				mbox_ipu: mbox_ipu {
+				mbox_ipu: mbox-ipu {
 					ti,mbox-tx = <0 0 0>;
 					ti,mbox-rx = <1 0 0>;
 				};
-				mbox_dsp: mbox_dsp {
+				mbox_dsp: mbox-dsp {
 					ti,mbox-tx = <3 0 0>;
 					ti,mbox-rx = <2 0 0>;
 				};
diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
index b148b289e830..06cc3a19ddaa 100644
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -616,11 +616,11 @@ mailbox: mailbox@0 {
 				#mbox-cells = <1>;
 				ti,mbox-num-users = <3>;
 				ti,mbox-num-fifos = <8>;
-				mbox_ipu: mbox_ipu {
+				mbox_ipu: mbox-ipu {
 					ti,mbox-tx = <0 0 0>;
 					ti,mbox-rx = <1 0 0>;
 				};
-				mbox_dsp: mbox_dsp {
+				mbox_dsp: mbox-dsp {
 					ti,mbox-tx = <3 0 0>;
 					ti,mbox-rx = <2 0 0>;
 				};
-- 
2.30.1

