Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AF240AD94
	for <lists+linux-omap@lfdr.de>; Tue, 14 Sep 2021 14:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhINM2j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Sep 2021 08:28:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232800AbhINM2e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Sep 2021 08:28:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C7F160F92;
        Tue, 14 Sep 2021 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631622437;
        bh=xjXBwJevs5XgLWRG+LQGWP4p8XpWIa5UPqlENQ7qU0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hvqOs+epK6SjV1/7ci9IV2frgC1Aqw0VEISQ1/QbFtw6yyDN4vDQsBwDVLXCoWD8U
         9fU7KnhKMEuogiBpJgWBm0EjDK1G5J/OiB9KKRo9+COT7ZGtMa3l3VvSuxfP5ndzSN
         sN0dPnzf7tabjpVSLUloF/I81exQCMXobPQqegjpKP4ZW/LyZgfZcqkM1rTi/Lxjs+
         M85f1kbM3/rvqTLHELwbFxfduvFMH9aERqnR0Bc1LMJx8A2nmE3IGN+CgEJYqlI0Eo
         MLvyJdiqvu8S8Z0Cf8t3fMw/CvkgXKCuJPOy4Mo8jiNQIZ5srUyhqRsNKbtlAy0wzu
         mSltRwwHfOzzg==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 2/8] dt-bindings: mtd: Remove gpmc-nor.txt
Date:   Tue, 14 Sep 2021 15:26:59 +0300
Message-Id: <20210914122705.15421-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914122705.15421-1-rogerq@kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no GPMC NOR compatible or device driver. GPMC is just
a bus interface over which standard (CFI/JEDC) NOR Flash chips
can be attached.

For NOR chip bindings, please refer to
Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-nor.txt      | 98 -------------------
 1 file changed, 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
deleted file mode 100644
index c8567b40fe13..000000000000
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
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
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
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
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

