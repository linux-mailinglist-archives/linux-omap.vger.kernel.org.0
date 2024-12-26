Return-Path: <linux-omap+bounces-2898-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DB9FCE34
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7E51883514
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297371BA86C;
	Thu, 26 Dec 2024 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CV/UEh5n"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31663198E8C;
	Thu, 26 Dec 2024 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250075; cv=none; b=CFhFa+kJWfdjBytAf2ESjH9vbx96G8F2Hii+UAk0DrKE0W9kOM82BM+1iAja34KGJAB55S2+fHf13ZiHBpt9qzvWV8ftaKZxp3YWKt8s7pYfFDK1PS936U6P0otdKIlQHYN8RtJB+XqcgZaMu7/ayQKZVWHZkCKZxaeYxpvpqsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250075; c=relaxed/simple;
	bh=NSjgsJGKkH519VeYog+omYmqkSnD+FsV768F8q/AF6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjiIYor0iBk8HKuOxULlR3WcsJE6hyZngW6kTj79dmqoRwzJyFxa/Ua17EMVP4OHbrSTRLK7ndl6MSucpSbyMxiMSfIZc3TqBSEbi5NZEfBXmVxyCTgTTGv7SdLem4V6x7LAwgyjl4dR2XjLpXbqLBdkMWStP5ZOso0Zyvqq+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CV/UEh5n; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsEJH1307636
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:54:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250054;
	bh=j9o/hfBKkIedaJv/6+9Y7k5o5nbeuJqdCMQMIpMapOk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CV/UEh5nUGyBAVACyUsyHoIDM2dwEbmoZsfrGjrbJkvOmlK5VR6Nc/EFSH4f19wwA
	 qrN3wivk9n5kb7QjPgLS3A3SeJHVZSpopmExnK+vQOyVCrzpSSK20/CPbxbySyk32G
	 rav+BaL+tEKpFN+Kqjoq4OaNDJWBfkZ8IOJBCBlg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsE2g013335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:14 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:13 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9J052274;
	Thu, 26 Dec 2024 15:54:13 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
Date: Thu, 26 Dec 2024 15:54:06 -0600
Message-ID: <20241226215412.395822-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226215412.395822-1-s-ramamoorthy@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
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


