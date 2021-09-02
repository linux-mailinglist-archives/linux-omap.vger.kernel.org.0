Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03553FEBB0
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 11:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343648AbhIBJ5c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 05:57:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343791AbhIBJ50 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 05:57:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F9D96108B;
        Thu,  2 Sep 2021 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630576588;
        bh=K/6VfoFPQ9qMZMEaNkK+OZgH2Dx1omVf4MYgeH69nuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SanjNYPui/e5sQjaDNQzDu2moZAouXPYzkzq6SnNO2uqx7KyLLBxhw3iIdqcsUMKg
         LIs+cpV0+ce8tOw9xHa6PWP6ywiq2B37QZW/cT0OJ7K64UVvaNNo6Pu5m5yxQT02Zo
         4Locu/q3KELTQaO95hrFNchpj/I4kvBCH/1vzKhFr+OIC9UFX/BZkI61HGDkUZA1H9
         /LB4DgHsRyH71jnEKQGw5PnT/sbixWJgHn5xJfV5MbARwqJ3NU94wFy20yZutbuMnY
         C3qVU3wQ8upLObtWgghz4pUcxDi7uPVrSsA1CiGBQSxN175YWZpkkdUxp9TrYMwsYA
         wNg7wH+aaMLnQ==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 5/6] dt-bindings: mtd: Remove gpmc-nor.txt
Date:   Thu,  2 Sep 2021 12:56:08 +0300
Message-Id: <20210902095609.16583-6-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902095609.16583-1-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no GPMC NOR compatible or device driver. GPMC is just
a bus interface over which standard (CFI/JEDC) NOR Flash chips
can be attached.

For NOR chip bindings, please refer to
Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

For GPMC bus timing configuration, please refer to
Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-nor.txt      | 98 -------------------
 1 file changed, 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
deleted file mode 100644
index c9bea106ea65..000000000000
--- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
+++ /dev/null
@@ -1,98 +0,0 @@
-Device tree bindings for NOR flash connect to TI GPMC
-
-NOR flash connected to the TI GPMC (found on OMAP boards) are represented as
-child nodes of the GPMC controller with a name of "nor".
-
-All timing relevant properties as well as generic GPMC child properties are
-explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
-
-Required properties:
-- bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
-			16-bit devices and so must be either 1 or 2 bytes.
-- compatible:		Documentation/devicetree/bindings/mtd/mtd-physmap.txt
-- gpmc,cs-on-ns:		Chip-select assertion time
-- gpmc,cs-rd-off-ns:	Chip-select de-assertion time for reads
-- gpmc,cs-wr-off-ns:	Chip-select de-assertion time for writes
-- gpmc,oe-on-ns:	Output-enable assertion time
-- gpmc,oe-off-ns:	Output-enable de-assertion time
-- gpmc,we-on-ns		Write-enable assertion time
-- gpmc,we-off-ns:	Write-enable de-assertion time
-- gpmc,access-ns:	Start cycle to first data capture (read access)
-- gpmc,rd-cycle-ns:	Total read cycle time
-- gpmc,wr-cycle-ns:	Total write cycle time
-- linux,mtd-name:	Documentation/devicetree/bindings/mtd/mtd-physmap.txt
-- reg:			Chip-select, base address (relative to chip-select)
-			and size of NOR flash. Note that base address will be
-			typically 0 as this is the start of the chip-select.
-
-Optional properties:
-- gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
-
-Optional properties for partition table parsing:
-- #address-cells: should be set to 1
-- #size-cells: should be set to 1
-
-Example:
-
-gpmc: gpmc@6e000000 {
-	compatible = "ti,omap3430-gpmc", "simple-bus";
-	ti,hwmods = "gpmc";
-	reg = <0x6e000000 0x1000>;
-	interrupts = <20>;
-	gpmc,num-cs = <8>;
-	gpmc,num-waitpins = <4>;
-	#address-cells = <2>;
-	#size-cells = <1>;
-
-	ranges = <0 0 0x10000000 0x08000000>;
-
-	nor@0,0 {
-		compatible = "cfi-flash";
-		linux,mtd-name= "intel,pf48f6000m0y1be";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0 0 0x08000000>;
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
-		partition@0 {
-			label = "bootloader-nor";
-			reg = <0 0x40000>;
-		};
-		partition@40000 {
-			label = "params-nor";
-			reg = <0x40000 0x40000>;
-		};
-		partition@80000 {
-			label = "kernel-nor";
-			reg = <0x80000 0x200000>;
-		};
-		partition@280000 {
-			label = "filesystem-nor";
-			reg = <0x240000 0x7d80000>;
-		};
-	};
-};
-- 
2.17.1

