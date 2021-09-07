Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF54027D3
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 13:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344024AbhIGLdz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 07:33:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:53506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245276AbhIGLdr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Sep 2021 07:33:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81780610A3;
        Tue,  7 Sep 2021 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631014361;
        bh=48j2wsnGyat2ILyzMymL7hUEkoVXB+R33pMrIohVclo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ieWhPeVRUctXlWAZQAgqk5ogAEJYA/1Pm0X8PHvphVJ8zyCnQikZywjX8Tf6dGQvO
         CqD99DFmEhHZ5y7dZ/k2zgYK794diAKBbIB1dg+6Z2YII1ix5Ihuz3EmAAuHFJsW3d
         1Yn0gen21AeAwz9aSx1N6TVzhGcFa/TZb0sPIlDGO16UkI+KeDHfjkl5kOqUfgaL9g
         pBgILe4BHojbF+KbgG6kb9KudrIiObO66kqvCI/tWXKe1P9we8O39hDIsfrMx6b0Pp
         YzqTu6gSPHTKg3VrgrRYtnsVKpAeF3RE9qqfDb9KBKe3cddi8ukJNFM9MeDcSO86lI
         zNziePd7c0+DA==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 3/8] dt-bindings: net: Remove gpmc-eth.txt
Date:   Tue,  7 Sep 2021 14:32:21 +0300
Message-Id: <20210907113226.31876-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907113226.31876-1-rogerq@kernel.org>
References: <20210907113226.31876-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no GPMC Ethernet compatible or device driver. GPMC is
just a bus interface over which devices like Ethernet controller
can be to.

For SMSC 911x Ethernet chip bindings, please refer to
Documentation/devicetree/bindings/net/smsc,lan9115.yaml

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/net/gpmc-eth.txt      | 97 -------------------
 1 file changed, 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
deleted file mode 100644
index 32821066a85b..000000000000
--- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
+++ /dev/null
@@ -1,97 +0,0 @@
-Device tree bindings for Ethernet chip connected to TI GPMC
-
-Besides being used to interface with external memory devices, the
-General-Purpose Memory Controller can be used to connect Pseudo-SRAM devices
-such as ethernet controllers to processors using the TI GPMC as a data bus.
-
-Ethernet controllers connected to TI GPMC are represented as child nodes of
-the GPMC controller with an "ethernet" name.
-
-All timing relevant properties as well as generic GPMC child properties are
-explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-For the properties relevant to the ethernet controller connected to the GPMC
-refer to the binding documentation of the device. For example, the documentation
-for the SMSC 911x is Documentation/devicetree/bindings/net/smsc,lan9115.yaml
-
-Child nodes need to specify the GPMC bus address width using the "bank-width"
-property but is possible that an ethernet controller also has a property to
-specify the I/O registers address width. Even when the GPMC has a maximum 16-bit
-address width, it supports devices with 32-bit word registers.
-For example with an SMSC LAN911x/912x controller connected to the TI GPMC on an
-OMAP2+ board, "bank-width = <2>;" and "reg-io-width = <4>;".
-
-Required properties:
-- bank-width: 		Address width of the device in bytes. GPMC supports 8-bit
-			and 16-bit devices and so must be either 1 or 2 bytes.
-- compatible:		Compatible string property for the ethernet child device.
-- gpmc,cs-on-ns:	Chip-select assertion time
-- gpmc,cs-rd-off-ns:	Chip-select de-assertion time for reads
-- gpmc,cs-wr-off-ns:	Chip-select de-assertion time for writes
-- gpmc,oe-on-ns:	Output-enable assertion time
-- gpmc,oe-off-ns:	Output-enable de-assertion time
-- gpmc,we-on-ns:	Write-enable assertion time
-- gpmc,we-off-ns:	Write-enable de-assertion time
-- gpmc,access-ns:	Start cycle to first data capture (read access)
-- gpmc,rd-cycle-ns:	Total read cycle time
-- gpmc,wr-cycle-ns:	Total write cycle time
-- reg:			Chip-select, base address (relative to chip-select)
-			and size of the memory mapped for the device.
-			Note that base address will be typically 0 as this
-			is the start of the chip-select.
-
-Optional properties:
-- gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Example:
-
-gpmc: gpmc@6e000000 {
-	compatible = "ti,omap3430-gpmc";
-	ti,hwmods = "gpmc";
-	reg = <0x6e000000 0x1000>;
-	interrupts = <20>;
-	gpmc,num-cs = <8>;
-	gpmc,num-waitpins = <4>;
-	#address-cells = <2>;
-	#size-cells = <1>;
-
-	ranges = <5 0 0x2c000000 0x1000000>;
-
-	ethernet@5,0 {
-		compatible = "smsc,lan9221", "smsc,lan9115";
-		reg = <5 0 0xff>;
-		bank-width = <2>;
-
-		gpmc,mux-add-data;
-		gpmc,cs-on-ns = <0>;
-		gpmc,cs-rd-off-ns = <186>;
-		gpmc,cs-wr-off-ns = <186>;
-		gpmc,adv-on-ns = <12>;
-		gpmc,adv-rd-off-ns = <48>;
-		gpmc,adv-wr-off-ns = <48>;
-		gpmc,oe-on-ns = <54>;
-		gpmc,oe-off-ns = <168>;
-		gpmc,we-on-ns = <54>;
-		gpmc,we-off-ns = <168>;
-		gpmc,rd-cycle-ns = <186>;
-		gpmc,wr-cycle-ns = <186>;
-		gpmc,access-ns = <114>;
-		gpmc,page-burst-access-ns = <6>;
-		gpmc,bus-turnaround-ns = <12>;
-		gpmc,cycle2cycle-delay-ns = <18>;
-		gpmc,wr-data-mux-bus-ns = <90>;
-		gpmc,wr-access-ns = <186>;
-		gpmc,cycle2cycle-samecsen;
-		gpmc,cycle2cycle-diffcsen;
-
-		interrupt-parent = <&gpio6>;
-		interrupts = <16>;
-		vmmc-supply = <&vddvario>;
-		vmmc_aux-supply = <&vdd33a>;
-		reg-io-width = <4>;
-
-		smsc,save-mac-address;
-	};
-};
-- 
2.17.1

