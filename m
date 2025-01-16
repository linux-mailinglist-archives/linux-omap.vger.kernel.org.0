Return-Path: <linux-omap+bounces-3133-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D7A1448D
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 23:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54B73A6CE5
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 22:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3F224225D;
	Thu, 16 Jan 2025 22:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qCfS18SN"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1322BACA;
	Thu, 16 Jan 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067096; cv=none; b=kSinnCxa2O+M+02mlgnTACY3twQ9p8qsKrpOzQr3WhTOecK7EPWM1uuZDrV61R1p7b3iGrr3lxxb/AkpDBu6SJwoqcQj5GKI2u22L2KQDtrM0iUYgTbGCVs2tohc7DwC/Gv8fZOJsNvdlclq0QaAn7uKjjdIxZvdUwCyYwrDb8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067096; c=relaxed/simple;
	bh=L5MmjyuvQRnFMwb4/Kyl8meWviNS3V8qYI+12W4U0pI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kgb5KvPKx3GVlT0jIQoYbEjIxkWkDkAE5xkeo8qs6nq8W3+m3dPIs3gYWx2EebyFmMyLZuL34Ei0UqKpPjqFfuTnLb8TRMaJLJIdVT/DWsH3XYfFJav3br4fpoFi6l8qC9hvMpaM4Mko0LEDCTYEMn+MSuRiCgYTqgFk7M6e9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qCfS18SN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMbe3V223928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:37:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067060;
	bh=ZY997roUOTlXyxylbEMvp0F5Ad/fPy2pXpkn1UxtkRE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qCfS18SNk4oPc0rVPS5HYfedabIYy5TauPzftflIljFeUuSZkxc7riZ5Gs9b3bYuh
	 /tELc5vRmgo8F4sdXDU03KhUok3X6ilBwp1nOHuohFxqco59rTRpsEN0QmCyGj9rBc
	 3Dcb8DmoMf17ZoOj3bkaaEJiZvB9eR+RyZxeq8JI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMbeHD049330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:37:40 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:37:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:37:40 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMbeYM030055;
	Thu, 16 Jan 2025 16:37:40 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 1/2] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
Date: Thu, 16 Jan 2025 16:37:39 -0600
Message-ID: <20250116223740.429515-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116223740.429515-1-s-ramamoorthy@ti.com>
References: <20250116223740.429515-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 .../bindings/regulator/ti,tps65219.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index b0d47415bf83..b56e7f8fe88e 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/regulator/ti,tps65219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI TPS65215/TPS65219 Power Management Integrated Circuits
+title: TI TPS65214/TPS65215/TPS65219 Power Management Integrated Circuit
 
 maintainers:
   - Jerome Neanne <jerome.neanne@baylibre.com>
@@ -18,9 +18,13 @@ description: |
   TI TPS65215 is a derivative of TPS65219 with 3 Buck regulators, 2 Low
   Drop-out Regulators (LDOs), 1 GPIO, 1 GPO, and power-button.
 
+  TI TPS65214 is a derivative of TPS65219 with 3 Buck regulators, 2 Low
+  Drop-out Regulators (LDOs), 1 GPIO, 1 GPO, and power-button.
+
 properties:
   compatible:
     enum:
+      - ti,tps65214
       - ti,tps65215
       - ti,tps65219
 
@@ -98,6 +102,16 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,tps65214
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^ldo[3-4]$": false
   - if:
       properties:
         compatible:
-- 
2.43.0


