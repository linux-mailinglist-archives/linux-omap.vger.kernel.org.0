Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E4640AD98
	for <lists+linux-omap@lfdr.de>; Tue, 14 Sep 2021 14:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbhINM2s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Sep 2021 08:28:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232929AbhINM2i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Sep 2021 08:28:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 033C36113B;
        Tue, 14 Sep 2021 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631622440;
        bh=48j2wsnGyat2ILyzMymL7hUEkoVXB+R33pMrIohVclo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ekU6ZW/SrZCJ4Tdl2DEHC74hWSFlvxrjXHW2KA69bZCnCa8XsWqGD7fEjQBIp6YRg
         SugpNZ+m4e679v9gQK2kNpzExxnbfUfXU556AdA88GqN+okk3mwMaBeWEJe8Y6/XiX
         HGzYXG4Ki+tEh5gBBJWDymPlOA/xp/ziDhbHTqbvAYNMLC9Qpn+t/RK8QV31wocnXG
         YMM3S2jExddfSrBZ517XTe+0C2rLKxv78gNtEtbisS/y6/Qa56Jw8cGl52ANHbvMAU
         Cvs2ewAafXbHX84sQMzsen+7TaHtQA1W43uXTxQQKtBh+vZsE3cCelLu4s7g+pA38x
         hzIoVMhn3Ie2A==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 3/8] dt-bindings: net: Remove gpmc-eth.txt
Date:   Tue, 14 Sep 2021 15:27:00 +0300
Message-Id: <20210914122705.15421-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914122705.15421-1-rogerq@kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
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

