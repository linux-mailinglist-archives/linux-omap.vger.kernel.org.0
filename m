Return-Path: <linux-omap+bounces-2459-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A319A4922
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 23:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E381C21E59
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 21:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1439E18E368;
	Fri, 18 Oct 2024 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zTEuWelX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247C16D4E6;
	Fri, 18 Oct 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288128; cv=none; b=R6lvxux7gBtly93LP0CmydpN0A5kubbzYRp2QrV5QNO/bQ1wca87z9iTXpSy/Wqq+7D+i6muDo0z6LlCw6q+lUor2tZ2MBrS7IAH2SaG8c7t3DyE0hKIE5VK1lczuhHtTlyT/JyIqjZJZVRuEz7qclGQy1B2c36LkXU0TdaVLVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288128; c=relaxed/simple;
	bh=pm7Umla3tm9jpux63hr248UjUv/yWTbSi1mqVJVDW6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BxWy2mxEWPKUNHE0JE5WyM3/UnX6EcCF+pCiLSHHwSSIgK4OiWVm2VDk/BHeknj1VzQ5OIXIRNZEQsQZTHTvRC4EltqWOGnztjpKpqnzZEky5DxB/buqLaIlz7fwkJaR9toAGAeb3H86oI66zoopcyq67GIBDl2zJ8sCmpi6YAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zTEuWelX; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=vfuHGGp/gXQEREQV7oenTHDDKxIs/pz9s2cGnpdqQLc=; b=zTEuWelX6tS3cuR1euUJ5RylYX
	skKJusB/TTtzT7xkLzvT0Ap2bSKwkb2LWG7fZ5DM1vh1m4JXFQxeDlhn4Zi9+kQlbBWQlyrQn35Ij
	gOpaw1my2y8SHwJBcGWbpOsxCk47z8aOw6pzcSvEMN+I0+gN6GEZ1oIrQh6s3Z+bQVxWA5lMMQFjx
	MLj5qdcX7v0JuSvj19xbM2pfhgIMwDwFSHz3ffX8L1u7VjaZpBVOdGCtHOaDDdW/XffZGCvCTM6bT
	pKdSw09V55rKXGSLRy4uZMfckWbNZCfUxSLD7hGMWfX2ABLI6e3FN6AiZ8IAhpdBCDp/MaSHJsKk2
	abjZduFg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	khilman@baylibre.com,
	Roger Quadros <rogerq@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: ti/omap: omap3-gta04a5: add Bluetooth
Date: Fri, 18 Oct 2024 23:48:42 +0200
Message-Id: <20241018214842.275194-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GTA04A5 model has a wl1837 WLAN/Bluetooth combo chip, add
it.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
index 8bd6b4b1f30b8..d3a81f0b880fd 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
@@ -114,6 +114,16 @@ wlcore: wlcore@2 {
 	};
 };
 
+&uart1 {
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins>;
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;	/* GPIO_137 */
+	};
+};
+
+
 &i2c2 {
 	/delete-node/ bmp085@77;
 	/delete-node/ bma180@41;
-- 
2.39.2


