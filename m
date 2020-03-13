Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DFF18440A
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 10:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCMJrb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 05:47:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38200 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgCMJrb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Mar 2020 05:47:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02D9lM2A008991;
        Fri, 13 Mar 2020 04:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584092842;
        bh=mFzRNpBAm8x3OIHFlE8PDdI7a4X4HaLXzV5MEkFtlhc=;
        h=From:To:CC:Subject:Date;
        b=W0rvU+KLaYvI7S2b8FRlhtGfW1Q/C/VchZIVjvSBWkjjJq+0q4sXU40yJFRSSJIgw
         HaFgmWwOYPMnjx+IrY6UnYHjh8lu+l5Wo+aH+9GWF8pKYCOuduk0HVOyGsMM22PwnT
         lFrfA5K85HOlSwLrvgRJHyPtvleIZWb1KYSXFe9w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02D9lMsN019353;
        Fri, 13 Mar 2020 04:47:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 04:47:21 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 04:47:21 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02D9lInb126551;
        Fri, 13 Mar 2020 04:47:18 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <tony@atomide.com>
CC:     <hch@lst.de>, <robin.murphy@arm.com>, <robh+dt@kernel.org>,
        <nm@ti.com>, <t-kristo@ti.com>, <nsekhar@ti.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>,
        <stable@kernel.org>
Subject: [PATCH v2] ARM: dts: dra7: Add bus_dma_limit for L3 bus
Date:   Fri, 13 Mar 2020 11:47:17 +0200
Message-ID: <20200313094717.6671-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The L3 interconnect's memory map is from 0x0 to
0xffffffff. Out of this, System memory (SDRAM) can be
accessed from 0x80000000 to 0xffffffff (2GB)

DRA7 does support 4GB of SDRAM but upper 2GB can only be
accessed by the MPU subsystem.

Add the dma-ranges property to reflect the physical address limit
of the L3 bus.

Issues ere observed only with SATA on DRA7-EVM with 4GB RAM
and CONFIG_ARM_LPAE enabled. This is because the controller
supports 64-bit DMA and its driver sets the dma_mask to 64-bit
thus resulting in DMA accesses beyond L3 limit of 2G.

Setting the correct bus_dma_limit fixes the issue.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Cc: stable@kernel.org
---

Changelog:
v2:
- Revised patch with minimal intrusion. i.e. don't change #size-cells
  of device node.

 arch/arm/boot/dts/dra7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index d78b684e7fca..058b8cbb8ef3 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -148,6 +148,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0xc0000000>;
+		dma-ranges = <0x80000000 0x0 0x80000000 0x80000000>;
 		ti,hwmods = "l3_main_1", "l3_main_2";
 		reg = <0x0 0x44000000 0x0 0x1000000>,
 		      <0x0 0x45000000 0x0 0x1000>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

