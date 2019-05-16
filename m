Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24811FE85
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 06:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfEPEb5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 00:31:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39434 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfEPEb4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 00:31:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vsb7052996;
        Wed, 15 May 2019 23:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557981114;
        bh=Qja/CieMYlfrNKjvjmZVGoSPhbgghvJ+uqLp/cGn+gk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NWt+SK3AI5qosTEXsLIosZCb2wI6oOJkRsfZah0QHsO223q9gxvn5P8Scir/Wr8o2
         MpOiBkaCstTXq8m6rTmlzZMWj4//kXL9YQYemLHfw8jGAKwR1c5y1I+1F1d1YIxqnp
         Uze3kMOv8CcaUCij/J6CSrHwMWlJneWX3WNdLsPw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G4Vswo042186
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 23:31:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 23:31:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 23:31:54 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vmim094857;
        Wed, 15 May 2019 23:31:51 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: lp87565: Add lp87561 configuration
Date:   Thu, 16 May 2019 10:02:16 +0530
Message-ID: <20190516043218.8222-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516043218.8222-1-j-keerthy@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

lp87561 is a single output 4-phase regulator configuration.
Add support for the same.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 .../devicetree/bindings/mfd/lp87565.txt       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/lp87565.txt b/Documentation/devicetree/bindings/mfd/lp87565.txt
index a48df7c08ab0..41671e0dc26b 100644
--- a/Documentation/devicetree/bindings/mfd/lp87565.txt
+++ b/Documentation/devicetree/bindings/mfd/lp87565.txt
@@ -41,3 +41,39 @@ lp87565_pmic: pmic@60 {
 		};
 	};
 };
+
+TI LP87561 PMIC:
+
+This is a single output 4-phase regulator configuration
+
+Required properties:
+  - compatible:	"ti,lp87561-q1"
+  - reg:		I2C slave address.
+  - gpio-controller:	Marks the device node as a GPIO Controller.
+  - #gpio-cells:	Should be two.  The first cell is the pin number and
+			the second cell is used to specify flags.
+			See ../gpio/gpio.txt for more information.
+  - xxx-in-supply:	Phandle to parent supply node of each regulator
+			populated under regulators node. xxx should match
+			the supply_name populated in driver.
+Example:
+
+lp87561_pmic: pmic@62 {
+	compatible = "ti,lp87561-q1";
+	reg = <0x62>;
+	gpio-controller;
+	#gpio-cells = <2>;
+
+	buck3210-in-supply = <&vsys_3v3>;
+
+	regulators: regulators {
+		buck3210_reg: buck3210 {
+			/* VDD_CORE */
+			regulator-name = "buck3210";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+};
-- 
2.17.1

