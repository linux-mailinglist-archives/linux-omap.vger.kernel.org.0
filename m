Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8B5FBB72
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 23:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfKMWO7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 17:14:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59588 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfKMWO4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 17:14:56 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADMEodx086252;
        Wed, 13 Nov 2019 16:14:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573683290;
        bh=MoVVMIm/tqY3PrtvmbkHheuw5YFQdQcT2+p9yspkVRs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=j1+uqJIIzrqdH74VK+NDeLipAvwK4oCMRGtFbBKYvxmiwPsNwe+Rg4lDICmeb0XnC
         jZ3fhucDHX3PV69Fv6NjkgL8qXGlyxLnAUFTkXkcRzw5z2v+muKcxbQOKgALHft4lJ
         hngMUbCwhNndKi+zsCuQ21uQrtCznOeq5wMQ+UMM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADMEorM120248
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 16:14:50 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 16:14:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 16:14:31 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADMEnfo071231;
        Wed, 13 Nov 2019 16:14:49 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [128.247.59.95])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xADMEnu04426;
        Wed, 13 Nov 2019 16:14:49 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux-patch-review@list.ti.com>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        "Andreas Dannenberg" <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        "Caleb Robey" <c-robey@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [uL PATCH 2/2] ARM: dts: am5729: beaglebone-ai: dra7 reqs in dts
Date:   Wed, 13 Nov 2019 16:13:44 -0600
Message-ID: <20191113221345.4795-3-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191113221345.4795-1-c-robey@ti.com>
References: <20191113221345.4795-1-c-robey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Small nomenclature change for beaglebone AI compatibility.

Signed-off-by: Jason Kridner <jdk@ti.com>

---
 arch/arm/boot/dts/dra7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 953f0ffce2a9..563d64c69fd4 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -143,7 +143,7 @@
 	 * the moment, just use a fake OCP bus entry to represent the whole bus
 	 * hierarchy.
 	 */
-	ocp {
+	ocp: ocp {
 		compatible = "ti,dra7-l3-noc", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.17.1

