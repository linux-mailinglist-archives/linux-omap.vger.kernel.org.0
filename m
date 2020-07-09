Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C1221AB67
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgGIXUM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34592 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgGIXUM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK763053748;
        Thu, 9 Jul 2020 18:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336807;
        bh=UgAdMugjQH9zepDiXJKzHbCjKp+TW08nB/thQHWUeAg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RlLmUo9aScgSG3Ri0j6KhzcZPrgR9XrEnJEFBnKjUZx50rErm/CUkKgckgzKohYjb
         lZV2cEnlaSIa++NYIXRRl63YyTwTbkgnEpAeiOSnQfzgGw+9KiR4Q+zfxl5y27fhEd
         3+HASQx8S7PewtcTqK9YTO9q8enqBTvfHm4WrJ2c=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK7Tx051608
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:07 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK7ol096085;
        Thu, 9 Jul 2020 18:20:07 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK7Nj124447;
        Thu, 9 Jul 2020 18:20:07 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 08/13] ARM: dts: omap5: Add DSP and IPU nodes
Date:   Thu, 9 Jul 2020 18:19:49 -0500
Message-ID: <20200709231954.1973-9-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

OMAP5, like OMAP4, also has two remote processor subsystems,
DSP and IPU. The IPU subsystem though has dual Cortex-M4
processors instead of the dual Cortex-M3 processors in OMAP4,
but otherwise has almost the same set of features. Add the
DT nodes for these two processor sub-systems for all OMAP5
SoCs.

The nodes have the 'iommus', 'clocks', 'resets', 'firmware' and
'mboxes' properties added, and are disabled for now. The IPU node
has its L2 RAM memory specified through the 'reg' and 'reg-names'
properties. The DSP node doesn't have these since it doesn't have
any L2 RAM memories, but has an additional 'ti,bootreg' property
instead as it has a specific boot register that needs to be
programmed for booting.

These nodes should be enabled as per the individual product
configuration in the corresponding board dts files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap5.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index fb889c5b00c9..116150ded018 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -216,6 +216,29 @@ mmu_ipu: mmu@0 {
 			};
 		};
 
+		dsp: dsp {
+			compatible = "ti,omap5-dsp";
+			ti,bootreg = <&scm_conf 0x304 0>;
+			iommus = <&mmu_dsp>;
+			resets = <&prm_dsp 0>;
+			clocks = <&dsp_clkctrl OMAP5_MMU_DSP_CLKCTRL 0>;
+			firmware-name = "omap5-dsp-fw.xe64T";
+			mboxes = <&mailbox &mbox_dsp>;
+			status = "disabled";
+		};
+
+		ipu: ipu@55020000 {
+			compatible = "ti,omap5-ipu";
+			reg = <0x55020000 0x10000>;
+			reg-names = "l2ram";
+			iommus = <&mmu_ipu>;
+			resets = <&prm_core 0>, <&prm_core 1>;
+			clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
+			firmware-name = "omap5-ipu-fw.xem4";
+			mboxes = <&mailbox &mbox_ipu>;
+			status = "disabled";
+		};
+
 		dmm@4e000000 {
 			compatible = "ti,omap5-dmm";
 			reg = <0x4e000000 0x800>;
-- 
2.26.0

