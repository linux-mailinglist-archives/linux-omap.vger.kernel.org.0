Return-Path: <linux-omap+bounces-4433-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FEB3DFE4
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 12:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39F0D7AAA49
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 10:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE95B301493;
	Mon,  1 Sep 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HFVqgzRE"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C40722FDFF;
	Mon,  1 Sep 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721753; cv=none; b=i3773OzGPqGsSXi4787UDoFo0Z9xVNItaq5XKz6+zz0h92H9ZSx60eFPSro/FKYPLAZadgC/3xjd+W+EjdQSu5HVXfi7z1lsOiTceHprjB0sJJaWrqmnI5cmRARZs1XbID0SlgcSyTmektJ2rY5wB9qxBQqtwiJaqp94vrPcKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721753; c=relaxed/simple;
	bh=WybEx41eWF9bJFyhbt3p1DGvcahsk7+xAnzqa3K3cpU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ra6RI5jFRCEh1OA/giq3HIxsKDQEYHFWZyNgr40fxCrPQbq+fAlmatYHlPcqk3WwAlUKtmMN9uucf7kboIPyD08t4B0PU7QUOLCg2ZKGW7f6l2rxFxkeKCYUJ5QOBHKep6fbxHg4v0y40PTB5GhTiHJeL8fhqGwOD7AN4MMJJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HFVqgzRE; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581AFZFh2752446;
	Mon, 1 Sep 2025 05:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756721735;
	bh=FtSKijCGs8TP0WXDGPNicHmfbjLsgr0U/Gpa7edboAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HFVqgzREmbZC5VggXKTWMxzizQOGFV/XPs3yT0lFvLpl1dmGJfquLUG3pgC5n+qLw
	 OJ5yn5uKVXJ7Mo97wYw2CeEPzd/RFjq4znkkEXe9wh49ah4z2mwv7vx0RW+JR8/SYr
	 dtsLrMNr9seZONncj9XyiEh43Cx0Ggu+RPB+ycDw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581AFZFP1475747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 05:15:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:15:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:15:35 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581AFPra2047319;
	Mon, 1 Sep 2025 05:15:32 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v2 2/2] ARM: dts: ti: omap: Use DMTimer as Clocksource instead of counter_32k
Date: Mon, 1 Sep 2025 15:45:25 +0530
Message-ID: <20250901101525.1090334-3-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901101525.1090334-1-a-dutta@ti.com>
References: <20250901101525.1090334-1-a-dutta@ti.com>
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
index ba7fdaae9c6e..0e0b5364be2b 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -4439,7 +4439,7 @@ segment@20000 {					/* 0x4ae20000 */
 			 <0x0000c000 0x0002c000 0x001000>,	/* ap 29 */
 			 <0x0000f000 0x0002f000 0x001000>;	/* ap 32 */
 
-		target-module@0 {			/* 0x4ae20000, ap 19 08.0 */
+		timer12_target: target-module@0 {		/* 0x4ae20000, ap 19 08.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>;
-- 
2.34.1


