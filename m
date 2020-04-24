Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878521B791E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgDXPNS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54160 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgDXPNS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFDA9o102845;
        Fri, 24 Apr 2020 10:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741190;
        bh=KAv/NOSEEid2PYdnpesj7PdvOx6Am2Ciq3f7sfekSKs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gGVeTpdWJnBxvrfwM/1smUY0ronzFNyp5ZwwERBXTYh/oMOrEMRzQ3xM9Rp6zDFT3
         1Ibayow1DUxV9wys/NthvVlnDaCfe1V6SXf2IkPcNY2F3mOGsdHGNaufeT8/Y0d/Op
         piS3AztBmhzK4xNy/GMcHScY5zeaUrtzdT+32SUY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFD5iH100116
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:13:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:13:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:13:05 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu7D122378;
        Fri, 24 Apr 2020 10:13:04 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 05/17] ARM: dts: DRA72x: Add aliases for rproc nodes
Date:   Fri, 24 Apr 2020 18:12:32 +0300
Message-ID: <20200424151244.3225-6-t-kristo@ti.com>
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

Add aliases for all the 3 remote processor nodes common to
all DRA72x/DRA71x/AM571x/AM570x boards. The aliases uses the
stem "rproc", and are defined in the order of the most common
processors on the DRA72x family. The ids are same as DRA74x
except for the missing DSP2.

The aliases can be overridden, if needed, in the respective
derivative board dts files.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra72x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index da334489b18f..ae23ec14e8fa 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -10,6 +10,12 @@
 / {
 	compatible = "ti,dra722", "ti,dra72", "ti,dra7";
 
+	aliases {
+		rproc0 = &ipu1;
+		rproc1 = &ipu2;
+		rproc2 = &dsp1;
+	};
+
 	pmu {
 		compatible = "arm,cortex-a15-pmu";
 		interrupt-parent = <&wakeupgen>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
