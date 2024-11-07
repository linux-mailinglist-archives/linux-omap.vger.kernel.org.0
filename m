Return-Path: <linux-omap+bounces-2611-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7A9C1208
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 23:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7C51C229E3
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 22:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072E0218D64;
	Thu,  7 Nov 2024 22:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Acntt9mI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEE1DF989;
	Thu,  7 Nov 2024 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731019956; cv=none; b=o2rwgOfeiiRPMgVcjZCZx0p5HGWMAFUsk62Owd8cWC3Jgpj7RCmnpvp8xAPuLA9CVynhHM2Pc0XVaVoIZj4WEkvT4OTRH/BjPLKDkO0OJRvm/BTefyhcCZlFbebCVy2vSbmQRBT8PjCjOes5Tg2H9lqToPiITV3tnnHMescZaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731019956; c=relaxed/simple;
	bh=6qjorj3AZRernRxn0Of19KkUE6PwjbwiKclqjwKnECk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EHbvyufAWNUV6Rgox6XTc9vPFUryaeb+3LumRoWqTswE18Anq2+WQDx5TpuL6Ws/1brHcXNEVCHNJIP/2+6f1iXiK67MUr+5hy9sSvGX1gidOHpb0qgxqDsEowYF8/aWMcuko9VNqIEdDyYDmq91ez3O/TayYE6A5iGR0as0Dm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Acntt9mI; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XI/ost4SdoUoRaeNL+H9ruW+hBD6tjVruY/zl1+JqWY=; b=Acntt9mIvxQcOhjBWv7ckVlEZR
	wwvp7sFB46+pbO53KIRUev7/S5ugAjZUKW0WRCojqvoKeMt5tqjlblqsyCD3+AIcmA5pzq/srTxYb
	DS9NY+CoX+zOCJgACxKX7OhPN+KwKaiuT0xaKGWrUZq3Ac8QAxdF0PwtaFnLhhRvP4pJjUwWxH3af
	CbmHj0eqq78l4EgjSyB3whyzx+ldWQ4IGw0zbcIKwSAmyeaVaMIzxOXDDD1Fvs9bfV/WgzD5u1B/m
	CJEW98YloiI3mtDcaGaUz4DlrSIEcq+Xr1kgOh5C4rRKJrnRgpNoAifJPS/fq9k2KDFh1asn57wiG
	XKnxNIYg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hns@goldelico.com,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
Date: Thu,  7 Nov 2024 23:51:00 +0100
Message-Id: <20241107225100.1803943-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
disabling SPI leads to messages like:
Powerdomain (core_pwrdm) didn't enter target state 0
and according to /sys/kernel/debug/pm_debug/count off state is not
entered. That was not connected to SPI during the discussion
of disabling SPI. See:
https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/

Fix excess DMA channel usage by disabling DMA only instead of disabling
the SPI modules, so powermanagement can da all its work.

Fixes: a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage")
CC: stable@vger.kernel.org
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 3661340009e7a..11f8af34498b1 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -612,19 +612,23 @@ &i2c3 {
 };
 
 &mcspi1 {
-	status = "disabled";
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &mcspi2 {
-	status = "disabled";
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &mcspi3 {
-	status = "disabled";
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &mcspi4 {
-	status = "disabled";
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &usb_otg_hs {
-- 
2.39.2


