Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A80B3C9034
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jul 2021 22:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhGNTyE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jul 2021 15:54:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239120AbhGNTtL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Jul 2021 15:49:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 963576044F;
        Wed, 14 Jul 2021 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291846;
        bh=ZP72MNIhNjEqgn3lAWKRauimmu/FfYaKtcaJ48nayNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aNjloTgC/S5IuQnUqd1D50zRMW5sArRb/gif9jUnVHTi4SEQ9blpQtukfhreAMO6k
         oFCnjzZrT4NiJXWYzH+f0oDcLYAUpum+LEtLvLQmYSVGUSzlfbmAOUevZ+90DFhTlu
         n1tfnJ2SdLtPFkCj3rTcGPPM4p7ZSBL+BecaG1aLVpRFj2ptKGH74RG8KrzKnhgjyO
         TMnAoPESlmYGi+v4IdXaEiUTrb41hOBZfwE5FDIGBiSDipBz7/qNNJYRBLLphj9GtU
         IFe9qsSXI2Hy2l8Ten0FTUAYyQTIR3LgvKXdf14f64dG0V114HaMoy340DUZXUkf+d
         lauI6wXaSZ32A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 41/88] ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names
Date:   Wed, 14 Jul 2021 15:42:16 -0400
Message-Id: <20210714194303.54028-41-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194303.54028-1-sashal@kernel.org>
References: <20210714194303.54028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

[ Upstream commit 9e7f5ee1137397def6580461e27e5efcb68183ee ]

A number of sub-mailbox node names in various OMAP2+ dts files are
currently using underscores. This is not adhering to the node name
convention, fix all of these to use hiphens.

These nodes are already using the prefix mbox, so they will be in
compliance with the sub-mailbox node name convention being added in
the OMAP Mailbox YAML binding as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 39eba2bc36dd..aed81568a297 100644
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
index de742bf84efb..5015df4d876c 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -597,11 +597,11 @@ mailbox: mailbox@0 {
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
index f3d3a16b7c64..c67c8698cc30 100644
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -613,11 +613,11 @@ mailbox: mailbox@0 {
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
2.30.2

