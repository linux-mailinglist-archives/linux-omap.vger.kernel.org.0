Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEDC1484FF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 13:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgAXMLE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 07:11:04 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33772 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbgAXMLD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jan 2020 07:11:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00OCAviN115358;
        Fri, 24 Jan 2020 06:10:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579867857;
        bh=u8GDMQWkvTPZQR05J917eZkNCR3bRNJDSQNATGVb7H4=;
        h=From:To:CC:Subject:Date;
        b=QMhUnlNdyr1XLJd4FcqdkWT3mVGKkHdmMyi0AHZMbk6SaD6AkHyxKwJiBfj/ShwFD
         Hl5T13rlsXSQGv3MkIr9TTvS9A2z5onRPdlWFHX4YmhIQq4iMQCeilxCXMIeH1qdiz
         41ky8C9h/yffjhBYSkG+Tt1F+xJGQzS/9/PN/f1o=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00OCAvwP120718;
        Fri, 24 Jan 2020 06:10:57 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 24
 Jan 2020 06:10:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 24 Jan 2020 06:10:57 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00OCAt7w065837;
        Fri, 24 Jan 2020 06:10:55 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <bcousson@baylibre.com>, <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM: dts: dra7-evm: Rename evm_3v3 regulator to vsys_3v3
Date:   Fri, 24 Jan 2020 14:11:39 +0200
Message-ID: <20200124121139.28657-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On the new schematics it is renamed and the same name is used on other
dra7 boards.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/dra7-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index de7f85efaa51..af06a55d1c5c 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -61,10 +61,10 @@ aic_dvdd: fixedregulator-aic_dvdd {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	evm_3v3: fixedregulator-evm3v3 {
+	vsys_3v3: fixedregulator-vsys3v3 {
 		/* Output of Cntlr A of TPS43351-Q1 on dra7-evm */
 		compatible = "regulator-fixed";
-		regulator-name = "evm_3v3";
+		regulator-name = "vsys_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&evm_12v0>;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

