Return-Path: <linux-omap+bounces-3245-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA6A2450F
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 23:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED29A7A1A90
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 22:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED0E1F3FF0;
	Fri, 31 Jan 2025 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MXpBbSm8"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE801487E9;
	Fri, 31 Jan 2025 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738361518; cv=none; b=btuzS2oXsyQVG+DwmbB5SoBwt4d5f2g+H2qxgxZFrLJu9gZAEWEV+8BOOlv3lbWQ5rMI8bpjqMRJ5A1pT2RO48IC6YORNbHN5gBmJfr3QMoGn7y8OFVlVDafiuTEE1QgSAC1Y/a3p5q/E/yTZJbwwtaM6YlIj2obD6IDy7yEexY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738361518; c=relaxed/simple;
	bh=Pov7nJtkOZ5HfHS1cXKZ7b9hFVEZJfFxkCeGliJPvJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UP/gvYvK6RgmMdSZDA7VAAy8KcArN2QN5UmLImGQaDQ12ZaFWxpyArvHmiT11DvSc/oqR+QkdN64wO13AauYCy5PiioQ/Aj6dQzDpC4E0sfnN4EFlqE1mCkyd2kEXrzhLEOOQzcCCP7I00Ktbm+17vzwOkkSRRZV3zUNJBhI24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MXpBbSm8; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VMBdms1737223
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 31 Jan 2025 16:11:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738361500;
	bh=dD1VwGrNpd2NkN9mIIECzz6+iWCpvrOQszaRP4ix5i4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MXpBbSm8IgCNC9xhKFjfEo5Utn2halawxQqhERyFf8mCePgtLX/qd+cGaZiMsNL4e
	 rz3nxPyZcQX+L+DIvv4ffdibdR61ADioqCNZl7xc/vEmT/4oCaLl1cizvow5+hDhUk
	 4SSQVMbblTMjjAtZv9kaDQ2lf33o5MWhIeTvtkfk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VMBdMk125879;
	Fri, 31 Jan 2025 16:11:39 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 16:11:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 16:11:39 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VMBd1x111306;
	Fri, 31 Jan 2025 16:11:39 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
Date: Fri, 31 Jan 2025 16:11:35 -0600
Message-ID: <20250131221139.342967-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131221139.342967-1-s-ramamoorthy@ti.com>
References: <20250131221139.342967-1-s-ramamoorthy@ti.com>
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


