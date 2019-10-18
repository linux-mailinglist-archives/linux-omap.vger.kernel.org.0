Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484CCDCE92
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505864AbfJRSqx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:46:53 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:11013 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502844AbfJRSqw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424407;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8FsX47iELcDNe5J41570aGfAYcqQSq9axKOUa9WR9Qs=;
        b=d9YW11UhjTVcJkD51B+bwurTg+HJJ83iGGvYpNEAXPhVGE6kJdGmy9blw6FBgeiyuA
        ds6Xw+3fC6tY7TxuX8pvCpweR1kVZ58I/hAaIvdaUvdzJFSGHV1p9jZbG3W3Ie8iSt4s
        bBgkmEAI4vnFAqoz6cxUxiL80CFChy7XV5Pp7PXJeaPLXIVC7lfZWKXlJRColf8wz+2d
        YoT8RYB+6pP5Ler+Ho7N6VcQRCrcEUthQjwXEiK9jJMAALa2AvyPNOLcqUwdUZk+4dzC
        WdCxdgQCbufERMqAYGCCjIkqjEXcLIatYrQlE+UeWKoPfjpC60wf1RsOLaMgtD23l0H5
        Y8lw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkYDLH
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 20:46:34 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 6/7] ARM: DTS: omap4: add sgx gpu child node
Date:   Fri, 18 Oct 2019 20:46:29 +0200
Message-Id: <4d9788256c2a34f97b5f2474333ceb113601dd6a.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

and add timer and interrupt.

Since omap4420/30/60 and omap4470 come with different SGX variants
we need to introduce a new omap4470.dtsi. If an omap4470 board
does not want to use SGX it is no problem to still include
omap4460.dtsi.

Tested on PandaBoard ES.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap4.dtsi   | 11 +++++++----
 arch/arm/boot/dts/omap4470.dts | 16 ++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4470.dts

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 7cc95bc1598b..4c94555ae0d0 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -347,10 +347,13 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: sgx@0 {
+				compatible = "img,sgx540-120", "img,sgx540", "ti,omap-omap4-sgx540-120";
+				reg = <0x0 0x2000000>;	/* 32MB */
+				reg-names = "sgx";
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+				timer = <&timer11>;
+			};
 		};
 
 		dss: dss@58000000 {
diff --git a/arch/arm/boot/dts/omap4470.dts b/arch/arm/boot/dts/omap4470.dts
new file mode 100644
index 000000000000..45b0b4b8ce32
--- /dev/null
+++ b/arch/arm/boot/dts/omap4470.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for OMAP4470 SoC
+ *
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+#include "omap4460.dtsi"
+
+&sgx {
+	compatible = "img,sgx544-112", "img,sgx544", "ti,omap-omap4-sgx544-112";
+	img,cores = <1>;
+};
-- 
2.19.1

