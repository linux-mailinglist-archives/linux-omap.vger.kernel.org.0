Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B6BDCE9E
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443098AbfJRSqp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:46:45 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:19472 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443051AbfJRSqp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424400;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iSkqypEOIXqjPnMech7nom91pT488acblcWrfraIbHk=;
        b=gRJ5jixv+dRRemDnjjwFltuBH2u419Tnvx9oCqofryjtZAisutnk+GcvoGye/QauC6
        0NkuThKpPac0gQJsQs0rzRMJorYVUI6xhWSUZ3bhkk1eYjZWE4P2uwCwcbqkGsDy4ehH
        8DUYlQDtDNDiWdOeNyQgzZ/iWtjc9+85VZQPC/NCwTespzq+Ch3Zechep5fnvJgb8XUS
        LczGqsf/HeyVzcZokkcsB1da/nuPjD4z+vqQ7XTWz/5hYzk4L5iDAGL/TaMPEMCLnjTe
        GB4RD/yTZsQ8vr4shaAPfQvtOpjU5k9Bjmat2c5QwZp8B4c0O56+QajutaQp8QC8a5hr
        DojQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkWDLC
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 20:46:32 +0200 (CEST)
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
Subject: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Date:   Fri, 18 Oct 2019 20:46:24 +0200
Message-Id: <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Imagination PVR/SGX GPU is part of several SoC from
multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
and others.

Here we describe how the SGX processor is interfaced to
the SoC (registers, interrupt etc.).

Clock, Reset and power management should be handled
by the parent node.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.txt    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.txt

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
new file mode 100644
index 000000000000..4ad87c075791
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
@@ -0,0 +1,76 @@
+Imagination PVR/SGX GPU
+
+Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by this binding.
+
+Required properties:
+- compatible:	Should be one of
+		"img,sgx530-121", "img,sgx530", "ti,omap-omap3-sgx530-121";
+		  - BeagleBoard ABC, OpenPandora 600MHz
+		"img,sgx530-125", "img,sgx530", "ti,omap-omap3-sgx530-125";
+		  - BeagleBoard XM, GTA04, OpenPandora 1GHz
+		"img,sgx530-125", "img,sgx530", "ti,omap-am3517-sgx530-125";
+		"img,sgx530-125", "img,sgx530", "ti,omap-am335x-sgx530-125";
+		  - BeagleBone Black
+		"img,sgx540-120", "img,sgx540", "ti,omap-omap4-sgx540-120";
+		  - Pandaboard (ES)
+		"img,sgx544-112", "img,sgx544", "ti,omap-omap4-sgx544-112";
+		"img,sgx544-116", "img,sgx544", "ti,omap-omap5-sgx544-116";
+		  - OMAP5 UEVM, Pyra Handheld
+		"img,sgx544-116", "img,sgx544", "ti,omap-dra7-sgx544-116";
+
+		For further study:
+			"ti,omap-am3517-sgx530-?"
+			"ti,omap-am43xx-sgx530-?"
+			"ti,ti43xx-sgx"
+			"ti,ti81xx-sgx"
+			"img,jz4780-sgx5??-?"
+			"intel,poulsbo-sgx?"
+			"intel,cedarview-sgx?"
+			"sunxi,sgx-544-?" - Banana-Pi-M3 (Allwinner A83T)
+
+		The "ti,omap..." entries are needed temporarily to handle SoC
+		specific builds of the kernel module.
+
+		In the long run, only the "img,sgx..." entry should suffice
+		to match a generic driver for all architectures and driver
+		code can dynamically find out on which SoC it is running.
+
+
+- reg:		Physical base addresses and lengths of the register areas.
+- reg-names:	Names for the register areas.
+- interrupts:	The interrupt numbers.
+
+Optional properties:
+- timer:	the timer to be used by the driver.
+- img,cores:	number of cores. Defaults to <1>.
+
+/ {
+	ocp {
+		sgx_module: target-module@56000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x56000000 0x2000000>;
+
+			sgx@fe00 {
+				compatible = "img,sgx544-116", "img,sgx544", "ti,omap-omap5-sgx544-116";
+				reg = <0xfe00 0x200>;
+				reg-names = "sgx";
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+				timer = <&timer11>;
+				img,cores = <2>;
+			};
+		};
+	};
+};
-- 
2.19.1

