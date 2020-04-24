Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A151B7919
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgDXPNK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:10 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41516 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgDXPNK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:10 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFD40K044766;
        Fri, 24 Apr 2020 10:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741184;
        bh=INBNkuDdnAM4rYsyUVLSc+wh2cCd+Cy2fOLMb5QkpCE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UPY3p3NFXtl+g0kJwyteYAhT7sojOh9Vl/V+7Vmkh4Qeq4tMKpwhp5G2A/zPViBzh
         BLfliWXVgNfj5guUfdhVkt6qfH0iHMUMfH8duG/t1RgoIJ/n7Rz4tlZ0igcq2Fs4I6
         q1WQ6O0CL7Q2xzUXikSlzIEj2YKaiSlQ/W4CF8E4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFD4d8006635
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:13:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:04 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7C122378;
        Fri, 24 Apr 2020 10:13:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 04/17] ARM: dts: DRA74x: Add aliases for rproc nodes
Date:   Fri, 24 Apr 2020 18:12:31 +0300
Message-ID: <20200424151244.3225-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add aliases for all the IPU and DSP remoteproc processor
nodes common to all DRA74x/DRA76x/AM572x/AM574x boards.
The aliases uses the stem "rproc". The aliases are defined
in the order of the most common processors on the DRA74x
family.

The aliases can be overridden, if needed, in the respective
derivative board dts files.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra74x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index 94ba80769001..46d8e7615180 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -29,6 +29,13 @@
 		};
 	};
 
+	aliases {
+		rproc0 = &ipu1;
+		rproc1 = &ipu2;
+		rproc2 = &dsp1;
+		rproc3 = &dsp2;
+	};
+
 	pmu {
 		compatible = "arm,cortex-a15-pmu";
 		interrupt-parent = <&wakeupgen>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
