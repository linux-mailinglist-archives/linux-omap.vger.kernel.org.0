Return-Path: <linux-omap+bounces-2961-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B838A0109E
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F4F1636DB
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C061C3C03;
	Fri,  3 Jan 2025 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Yf2Wz7Vu"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE41C0DF3;
	Fri,  3 Jan 2025 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945502; cv=none; b=EKYu+A1bppyBaPfpNyFoMBURW75ptP5sHyP7CCsMnoZaRnxo8IHXeuKWT+U5i6qkQShL63Cq/dotK+ah0t8Np3nEc/5+qIZudCFweW6Kevl+MyD/Ju7LBhxEj4yOt7Eee9gv3eKHg7tDC2BjG0LYhmLmux+KB2lpiOZZ1rpDK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945502; c=relaxed/simple;
	bh=8U81uPk+GvwJpWLRHGC7wuYHoWupPBbH8Wl9ZfX1kjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWlfs0V5o7BSu882JhOyDvyD/y5CvncEUKh+aWxXqqQUrYljb+lCpvx5vYEIqclJPaxJF+Eviio80HKK/RmTML5SeY1WpUMayPFzfqb0KvHElEgaTQUlZPdkKRuajHk02pbBQ6Vk8W63dpfPdpcLvn57aLsLyMI21F2SQ1Q9uik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Yf2Wz7Vu; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kdb080778;
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=LkNfA0nX0YZCPdSR7nG3NOTckdW/BXLfMrOuGJAloc8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yf2Wz7VuLTS76SjGPirNkXcz3F+BWGDCp2e9AroByjXRsMKb4gd8dBCsi68uh/Bcu
	 QA39OZLlcO2XnYvj03TEZpWO+qw4KjOiuWLZ1+Z6XD5SSamvp6Vg9c53UQcVFow+S1
	 sRQ8DN26agbx2Tl3duloXPea4C5rPTpW4mxeAdrA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kRo013252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0J121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
Date: Fri, 3 Jan 2025 17:04:40 -0600
Message-ID: <20250103230446.197597-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103230446.197597-1-s-ramamoorthy@ti.com>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
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
 .../devicetree/bindings/regulator/ti,tps65219.yaml       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 78e64521d401..ba5f6fcf5219 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/regulator/ti,tps65219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI tps65219 Power Management Integrated Circuit regulators
+title: TI TPS65215/TPS65219 Power Management Integrated Circuit
 
 maintainers:
   - Jerome Neanne <jerome.neanne@baylibre.com>
@@ -12,10 +12,17 @@ maintainers:
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
       - ti,tps65219
+      - ti,tps65215
 
   reg:
     maxItems: 1
-- 
2.34.1


