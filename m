Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 439A9E71FA
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389261AbfJ1MnC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37216 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389230AbfJ1MnA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgve8033729;
        Mon, 28 Oct 2019 07:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266577;
        bh=h8UvdH0jq2ykZeJxZMyA9dhTsaxsmByi2M9+PwbJ+NA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ahGGJEEPd4QYWqpW1+ezBFwO9hp44lnQRmv/SowVwTpEXb8mCSCCga2C1c8X50rN+
         CftNP+UcVb9vVWntbLO0hx+71B8w+mSxpH2vfZD3w3ISDZYU/oOySHCI3VHaAVOXE1
         4dQy7yLsEDx9gg1F6ELxfr4tmIx6K10H3/7r42ak=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SCgvY4039404
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:42:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:42:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:42:43 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgogr063574;
        Mon, 28 Oct 2019 07:42:53 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 01/17] dt-bindings: remoteproc: Add OMAP remoteproc bindings
Date:   Mon, 28 Oct 2019 14:42:22 +0200
Message-ID: <20191028124238.19224-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028124238.19224-1-t-kristo@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add the device tree bindings document for the IPU and DSP
remote processor devices on OMAP4+ SoCs.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 .../remoteproc/ti,omap-remoteproc.txt         | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt
new file mode 100644
index 000000000000..e2bcfcab21c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.txt
@@ -0,0 +1,205 @@
+OMAP4+ Remoteproc Devices
+=========================
+
+The OMAP family of SoCs usually have one or more slave processor sub-systems
+that are used to offload some of the processor-intensive tasks, or to manage
+other hardware accelerators, for achieving various system level goals.
+
+The processor cores in the sub-system are usually behind an IOMMU, and may
+contain additional sub-modules like Internal RAM and/or ROMs, L1 and/or L2
+caches, an Interrupt Controller, a Cache Controller etc.
+
+The OMAP SoCs usually have a DSP processor sub-system and/or an IPU processor
+sub-system. The DSP processor sub-system can contain any of the TI's C64x,
+C66x or C67x family of DSP cores as the main execution unit. The IPU processor
+sub-system usually contains either a Dual-Core Cortex-M3 or Dual-Core Cortex-M4
+processors.
+
+Remote Processor Node:
+======================
+Each remote processor sub-system is represented as a single DT node. Each node
+has a number of required or optional properties that enable the OS running on
+the host processor (MPU) to perform the device management of the remote
+processor and to communicate with the remote processor. The various properties
+can be classified as constant or variable. The constant properties are dictated
+by the SoC and does not change from one board to another having the same SoC.
+Examples of constant properties include 'iommus', 'reg'. The variable properties
+are dictated by the system integration aspects such as memory on the board, or
+configuration used within the corresponding firmware image. Examples of variable
+properties include 'mboxes', 'memory-region', 'timers', 'watchdog-timers' etc.
+
+Required properties:
+--------------------
+The following are the mandatory properties:
+
+- compatible:	Should be one of the following,
+		    "ti,omap4-dsp" for DSPs on OMAP4 SoCs
+		    "ti,omap5-dsp" for DSPs on OMAP5 SoCs
+		    "ti,dra7-dsp" for DSPs on DRA7xx/AM57xx SoCs
+		    "ti,omap4-ipu" for IPUs on OMAP4 SoCs
+		    "ti,omap5-ipu" for IPUs on OMAP5 SoCs
+		    "ti,dra7-ipu" for IPUs on DRA7xx/AM57xx SoCs
+
+- iommus:	phandles to OMAP IOMMU nodes, that need to be programmed
+		for this remote processor to access any external RAM memory or
+		other peripheral device address spaces. This property usually
+		has only a single phandle. Multiple phandles are used only in
+		cases where the sub-system has different ports for different
+		sub-modules within the processor sub-system (eg: DRA7 DSPs),
+		and need the same programming in both the MMUs.
+
+- mboxes:	OMAP Mailbox specifier denoting the sub-mailbox, to be used for
+		communication with the remote processor. The specifier format is
+		as per the bindings,
+		Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+		This property should match with the sub-mailbox node used in
+		the firmware image.
+
+Optional properties:
+--------------------
+Some of these properties are mandatory on some SoCs, and some are optional
+depending on the configuration of the firmware image to be executed on the
+remote processor. The conditions are mentioned for each property.
+
+The following are the optional properties:
+- reg:			Address space for any remoteproc memories present on
+			the SoC. Should contain an entry for each value in
+			'reg-names'. These are mandatory for all DSP and IPU
+			processors that have them (OMAP4/OMAP5 DSPs do not have
+			any RAMs)
+
+- reg-names:		Required names for each of the address spaces defined in
+			the 'reg' property. Should contain a string from among
+			the following names, each representing the corresponding
+			internal RAM memory region,
+			   "l2ram" for L2 RAM,
+			   "l1pram" for L1 Program RAM Memory/Cache,
+			   "l1dram" for L1 Data RAM Memory/Cache,
+
+			All devices may not have all the above memories.
+
+- syscon-bootreg:	Should be a pair of the phandle to the System Control
+			Configuration region that contains the boot address
+			register, and the register offset of the boot address
+			register within the System Control module. This property
+			is required for all the DSP instances on OMAP4, OMAP5
+			and DRA7xx SoCs.
+
+- memory-region:	phandle to the reserved memory node to be associated
+			with the remoteproc device. The reserved memory node
+			can be a CMA memory node, and should be defined as
+			per the bindings,
+			Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+- mbox-names:		Optional names for the OMAP mailbox specifiers mentioned
+			in the 'mboxes' property, one per specifier value
+
+- timers:		One or more phandles to OMAP DMTimer nodes, that serve
+			as System/Tick timers for the OS running on the remote
+			processors. This will usually be a single timer if the
+			processor sub-system is running in SMP mode, or one per
+			core in the processor sub-system. This can also be used
+			to reserve specific timers to be dedicated to the
+			remote processors.
+
+			This property is mandatory on remote processors requiring
+			external tick wakeup, and to support Power Management
+			features. The timers to be used should match with the
+			timers used in the firmware image.
+
+- watchdog-timers:	One or more phandles to OMAP DMTimer nodes, used to
+			serve as Watchdog timers for the processor cores. This
+			will usually be one per executing processor core, even
+			if the processor sub-system is running a SMP OS.
+
+			The timers to be used should match with the watchdog
+			timers used in the firmware image.
+
+Example:
+--------
+
+1. OMAP4 DSP
+	/* DSP Reserved Memory node */
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dsp_memory_region: dsp-memory@98000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x98000000 0x800000>;
+			reusable;
+		};
+	};
+
+	/* DSP node */
+	ocp {
+		dsp: dsp {
+			compatible = "ti,omap4-dsp";
+			syscon-bootreg = <&scm_conf 0x304>;
+			iommus = <&mmu_dsp>;
+			mboxes = <&mailbox &mbox_dsp>;
+			memory-region = <&dsp_memory_region>;
+			timers = <&timer5>;
+			watchdog-timers = <&timer6>;
+		};
+	};
+
+2. OMAP5 IPU
+	/* IPU Reserved Memory node */
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ipu_memory_region: ipu-memory@95800000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x95800000 0 0x3800000>;
+			reusable;
+		};
+	};
+
+	/* IPU node */
+	ocp {
+		ipu: ipu@55020000 {
+			compatible = "ti,omap5-ipu";
+			reg = <0x55020000 0x10000>;
+			reg-names = "l2ram";
+			iommus = <&mmu_ipu>;
+			mboxes = <&mailbox &mbox_ipu>;
+			memory-region = <&ipu_memory_region>;
+			timers = <&timer3>, <&timer4>;
+			watchdog-timers = <&timer9>, <&timer11>;
+		};
+	};
+
+3. DRA7xx/AM57xx DSP
+	/* DSP1 Reserved Memory node */
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		dsp1_memory_region: dsp1-memory@99000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x99000000 0x0 0x4000000>;
+			reusable;
+		};
+	};
+
+	/* DSP1 node */
+	ocp {
+		dsp1: dsp@40800000 {
+			compatible = "ti,dra7-dsp";
+			reg = <0x40800000 0x48000>,
+			      <0x40e00000 0x8000>,
+			      <0x40f00000 0x8000>;
+			reg-names = "l2ram", "l1pram", "l1dram";
+			syscon-bootreg = <&scm_conf 0x55c>;
+			iommus = <&mmu0_dsp1>, <&mmu1_dsp1>;
+			mboxes = <&mailbox5 &mbox_dsp1_ipc3x>;
+			memory-region = <&dsp1_memory_region>;
+			timers = <&timer5>;
+			watchdog-timers = <&timer10>;
+		};
+	};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
