Return-Path: <linux-omap+bounces-3333-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C9A50D07
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 22:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB073ABA98
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 21:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5356C25A350;
	Wed,  5 Mar 2025 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VDilWztx"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A84259C91;
	Wed,  5 Mar 2025 21:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208665; cv=none; b=bEbLGk7gh9Xo8RNCNDi7wiFso7OIHSNPJ+PP76HlBaMT9HJaCPFWymXWksUFpoF5nyTcdzjZxcd7ZumvhWw3Iae58zLMeMuoDf82CRbmunZfjff1Yb9gZ7yWcxkaY7Ly8YT5SCmdGipPyZUN6XOcBS7JvOc1BVu+L8UNmRKDQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208665; c=relaxed/simple;
	bh=6dkPapPme6JcWGT2PjEQAkag9b/xetjKSmTXStI/kYQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qu1M3B4j6zgduVynl702T0/6N3Qwre4F5Q+JE2+vNFqYa3GSNs3AfjjbcrWSwUpwfJ0qc0lTF3d63YzjessGZiTimXp356lrGO/Ph//D7hVIv5pKBWkPVokgexisnEnQUXj+8ROd1PlvKAAADhzAWgHkxOuqqu1GB5AobIpObC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VDilWztx; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525L3qCl4072769
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Mar 2025 15:03:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741208632;
	bh=oFRupbHx1nu6HAUV3dCbqKYyO3BA+MmYlKeEXMIlvCo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VDilWztxndd05yPjSpPkzOrzaJcmSVuxEA2XFXgvkLBwQ2ooO0t8Rx8194QCjc4cJ
	 z638ii7dwt4X960FMeMTn6u/ASe9fR6FlsffFDz0xIUEkWjCVS9jIZMHT1b31XcxcQ
	 vu8xMPUIUHLSpjBFPPRfLE3BaU9F9KIMX8z8Tc/w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L3qK2114075;
	Wed, 5 Mar 2025 15:03:52 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 15:03:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 15:03:52 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L3peC125160;
	Wed, 5 Mar 2025 15:03:51 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v6 2/9] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
Date: Wed, 5 Mar 2025 15:03:44 -0600
Message-ID: <20250305210351.249811-3-s-ramamoorthy@ti.com>
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

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/regulator/ti,tps65219.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index b0d47415bf83..7c64e588a8b5 100644
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
 
@@ -102,7 +106,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: ti,tps65215
+            enum:
+              - ti,tps65214
+              - ti,tps65215
     then:
       properties:
         regulators:
-- 
2.43.0


