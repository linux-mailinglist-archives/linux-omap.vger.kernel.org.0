Return-Path: <linux-omap+bounces-3272-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66084A2AEFE
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 18:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D275188AC5D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 17:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CD5189BB6;
	Thu,  6 Feb 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zOCPisWj"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9E239569;
	Thu,  6 Feb 2025 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863461; cv=none; b=qbnabiqpIo0szUNEHbSqfrn1CHBMNHwmPT4GDnSPs8T++1/yxWXVLGJh+3q/0Z8NGRiAjzrXY2BTZ1KDvW8BrpJgMgvB5tPA/Lo+exB7UkKRK30nlZKAb3jQzZTxZSFaw8ULvt8actJRcdrY6XDRxnJc/oYke5KYmQqLUhM32lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863461; c=relaxed/simple;
	bh=Pov7nJtkOZ5HfHS1cXKZ7b9hFVEZJfFxkCeGliJPvJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zug+npp7e6qtkwYY1o6/8uHdsA3HEuFjrCfiu12dA8V6wsnUmskGq6W8iDj8flKJz1ghq0vIx+6VFNcLf6XoVUb6gR/MDqbU3OHhPulXkyaEOfDUSqAZ1YCYQ3k7enho3DnHU1jHVHAgu+cj7YrL4CvVrhVJRye+k64X22COICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zOCPisWj; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516HbQ642845849
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 11:37:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738863446;
	bh=dD1VwGrNpd2NkN9mIIECzz6+iWCpvrOQszaRP4ix5i4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zOCPisWj9jKTOFET1xBqXlZmbBJogyZDjbP82PIlkUJn4YNTDwhgQpZ1Nm0wIwF0p
	 /uvjmp7rcqnlmDaRgklBRrD92wxb29uonvDDn8XVrQKXHVzqXT78ZCpvt2WswKXB9X
	 PEmCSHIprIKyF4jwnZfYinQJPfyzke5It73YGH9Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516HbQI2026301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 11:37:26 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 11:37:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 11:37:25 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516HbPCE015728;
	Thu, 6 Feb 2025 11:37:25 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v5 1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
Date: Thu, 6 Feb 2025 11:37:21 -0600
Message-ID: <20250206173725.386720-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206173725.386720-1-s-ramamoorthy@ti.com>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65215 is a Power Management IC with 3 Buck regulators and 2 LDOs.

TPS65215 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs. The
remaining features for both devices are the same.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/regulator/ti,tps65219.yaml       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 78e64521d401..b0d47415bf83 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/regulator/ti,tps65219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI tps65219 Power Management Integrated Circuit regulators
+title: TI TPS65215/TPS65219 Power Management Integrated Circuits
 
 maintainers:
   - Jerome Neanne <jerome.neanne@baylibre.com>
@@ -12,9 +12,16 @@ maintainers:
 description: |
   Regulator nodes should be named to buck<number> and ldo<number>.
 
+  TI TPS65219 is a Power Management IC with 3 Buck regulators, 4 Low
+  Drop-out Regulators (LDOs), 1 GPIO, 2 GPOs, and power-button.
+
+  TI TPS65215 is a derivative of TPS65219 with 3 Buck regulators, 2 Low
+  Drop-out Regulators (LDOs), 1 GPIO, 1 GPO, and power-button.
+
 properties:
   compatible:
     enum:
+      - ti,tps65215
       - ti,tps65219
 
   reg:
@@ -90,6 +97,18 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,tps65215
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^ldo[3-4]$": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0


