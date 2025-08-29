Return-Path: <linux-omap+bounces-4406-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C63B3B77D
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 11:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1125F1608D7
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77671F55F8;
	Fri, 29 Aug 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xn2fRGkq"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADF02E54D7;
	Fri, 29 Aug 2025 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459821; cv=none; b=KA93X9MAeF69LgIIlJKDaWIXl1nJlH3F4bu9Xp13/sSo5ikZDVo/hb1hWBAyosEUybMgwaxQEWjyomtrPGCf16N7y7Bq4xmHf37VMLYa28+do2o0uFC1vd/NFwSx6PsF2+PLoM62KDp663tNAQWzqMQ3ZRjeCzykClHwxhQBzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459821; c=relaxed/simple;
	bh=JyT5kYYmgplTJlEdqGb9doRZjniA9Dx+SfuFojrRXvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e86CoTfs7dm/+G7bcaVuofsUCm3IvrDCvbxMeMG/jeUsCEzew8UWkLiEJcYl83q1LJL5ZrU14NNayajoqj3QMWAbKRS0pnmj+tMNCNchzxhtXB/02JazZevkJKCQDjmmQeY1efHXvnqyGFx/dF2JrAvH98Qp6GYdjGeTS2zXOvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Xn2fRGkq; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T9Twoe1724452;
	Fri, 29 Aug 2025 04:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756459798;
	bh=QdD3YyXBddKPw0BZcTG597jUpO1a09jAxJyXMWptNoE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Xn2fRGkqYB9eiV/zbYDTQFVLbTm/zxKcs9saOpMH01l3aLEaTZPKpCh4isHwH01zW
	 o+XQP9w1oTPPLVqLcFY8DtL8SR0/TPYSY1/N+/+Iq+p6B7O1/YYbgGso5LNH7nUDci
	 9px/JtssOSzQ1jEBXktsgJD7/fLOQYs+v4M5niZc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T9TwtL4125120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 04:29:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 04:29:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 04:29:58 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T9Tmoj1850123;
	Fri, 29 Aug 2025 04:29:55 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 2/2] arm: dts: Use DMTimer as Clocksource instead of counter_32k
Date: Fri, 29 Aug 2025 14:59:47 +0530
Message-ID: <20250829092947.855974-3-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829092947.855974-1-a-dutta@ti.com>
References: <20250829092947.855974-1-a-dutta@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Sinthu Raja <sinthu.raja@ti.com>

Clock drift of approximately 500 ppm is observed with 'counter_32k'
as clocksource. Clock drift is seen because 'counter_32k' is running
with 32786Hz frequency instead it should run with 32768Hz. Use DMTimer as
clocksource, which is running at 32768Hz to fix the clock drift issue.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts | 9 +++++++++
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi          | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
index 0a8b16505ed9..83009883277e 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
+++ b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts
@@ -36,3 +36,12 @@ &mmc2 {
 &phy1 {
 	max-speed = <100>;
 };
+
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+};
+
+&counter32k {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index ba7fdaae9c6e..a6ac4fd43b54 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -4439,7 +4439,7 @@ segment@20000 {					/* 0x4ae20000 */
 			 <0x0000c000 0x0002c000 0x001000>,	/* ap 29 */
 			 <0x0000f000 0x0002f000 0x001000>;	/* ap 32 */
 
-		target-module@0 {			/* 0x4ae20000, ap 19 08.0 */
+		timer12_target: target-module@0 {			/* 0x4ae20000, ap 19 08.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>;
-- 
2.34.1


