Return-Path: <linux-omap+bounces-3328-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B1A50CF9
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 22:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF2A171C77
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 21:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0342586C8;
	Wed,  5 Mar 2025 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nmA3DdSu"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5152580C6;
	Wed,  5 Mar 2025 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208660; cv=none; b=eZ5f/OcTzT+u+qcZF3bJh2MVwnQUq3OfC6D9PkhvIUSxPhuOZgkmj82vQxpoRaLVSEt2RuQWEqrU+qtPzxTzL2Nw2Jy9yHN88HkpXzgLGjAVA69MgZcjfFNdFXSJrH0Y9enl7Db0gLnNd/GOUK5Uo3bHexV9yJTVuNlAtm26Igs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208660; c=relaxed/simple;
	bh=Pov7nJtkOZ5HfHS1cXKZ7b9hFVEZJfFxkCeGliJPvJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/ZG2aBTywWT2VT4WktOLLc6w63W7DZEgo+wE9BQnXJGy9U7yNeqZNrXncGsvC9IibKPGN78fybBXYq2c56ilPFo9YGLvC9xknLmJEy+RPVx9AHvLzXimFMQpJxutbUnXFYgMu2hBOROgiU4vGXVTROZj5p8o7kKiywyv5ElMo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nmA3DdSu; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525L3qHa3414929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Mar 2025 15:03:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741208632;
	bh=dD1VwGrNpd2NkN9mIIECzz6+iWCpvrOQszaRP4ix5i4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nmA3DdSuqISPeQEJFnkyXj2DfLuozmJbZsfdXcv9z/PYdvkebV/EwWNU9BR/6KQXW
	 BqytjuY1OZNTihYWD4OyYYyjsTEfKgF+1GOd6RFxf+1aTxerwH+K8kAAfQJ06pxuaR
	 8kATPMXJtAWAI2XzbDkwogSjxWcg4fio85qf77Bk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L3q3Z114081;
	Wed, 5 Mar 2025 15:03:52 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 15:03:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 15:03:51 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L3peB125160;
	Wed, 5 Mar 2025 15:03:51 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v6 1/9] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
Date: Wed, 5 Mar 2025 15:03:43 -0600
Message-ID: <20250305210351.249811-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305210351.249811-1-s-ramamoorthy@ti.com>
References: <20250305210351.249811-1-s-ramamoorthy@ti.com>
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


