Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09EEAFCB87
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 18:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfKNRKd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 12:10:33 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33800 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNRKd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 12:10:33 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEHA2l7023968;
        Thu, 14 Nov 2019 11:10:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573751402;
        bh=nHrdcDw7lSz9s3P1r6oW2Qp28u77dyRK98Mqysr0DAo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mv/R8fSM8padD9i2lK13uk22GPbNxTSR38qB4u2gqHehBQ8mCyaYq6iMtb4s0X8kC
         B0lFHJHCUrh86Io1M6tWmmd1KNbYgYJUx9zDQCmG4EnEpPpt6iz7pq0WZoAMFzerwq
         uysFqdBs9QrrePiWDw5EE92+/Wa0arMLRmQl/DIY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEHA1om026611;
        Thu, 14 Nov 2019 11:10:01 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 11:10:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 11:10:01 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEHA1u9065420;
        Thu, 14 Nov 2019 11:10:01 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [172.25.137.130])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xAEHA0u10937;
        Thu, 14 Nov 2019 11:10:00 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Caleb Robey <c-robey@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ARM: dts: am5729: beaglebone-ai: dra7 reqs in dts
Date:   Thu, 14 Nov 2019 11:09:30 -0600
Message-ID: <20191114170933.12623-2-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114170933.12623-1-c-robey@ti.com>
References: <20191114170933.12623-1-c-robey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Small nomenclature change for beaglebone AI compatibility.

Signed-off-by: Jason Kridner <jdk@ti.com>
Signed-off-by: Caleb Robey <c-robey@ti.com>

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

