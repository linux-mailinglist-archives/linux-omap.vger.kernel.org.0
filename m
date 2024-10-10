Return-Path: <linux-omap+bounces-2384-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD79985F8
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36B51C23221
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E841C5796;
	Thu, 10 Oct 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1JM2sSak"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F491C579E;
	Thu, 10 Oct 2024 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563408; cv=none; b=RW8CwotWG7sfcfacmNnFWDbjbwAfzssTqCStHvTO2Rvq3kLUyDhGJYOKep76esvI9yYCyvC5hVs0XBjYg36eRFLx25ZEz6xDkczpaEQTYeC8uH98/nTKnoXv019mE1y33g2eAj6L7iW+vhZcMeiQ5vB+RvlNPcXh/4o5obut+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563408; c=relaxed/simple;
	bh=LVhddGZweBSURqGzn9VZDRZri76N2rZDvfb48+vvFdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewoGZ9uJlCFtDEvUdg7/tZVs47zoXfcsoCW6NDXYihvBkO9Es/bABNR//sUC2YTFAkJSbbJJ2i6zN/JIQE2XuGwDohhiN446jLP6fHvFXg8xS6qCPZo9k03poF4zuAg0K6osmJ3KTW6U4GYmteaKiqKLGEg90NvqABhdkmVGVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1JM2sSak; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=u7NgFmqNWBbaPcWNB6etpacuZmDj/dTMj7FspcWJt7E=; b=1JM2sSakHC5JBJ9T1uMAVgQbEj
	6cuToNE62GJJdIxy+PltPHENnoO0VvHgstayUfcwTlAFt327Qwu5aDN0PaoDkl0P2NhWl9vycgLPY
	y2Pv138UeP86d7IiF430qiHjagUEB+3wSx+B1NlS2LxAUd7HFrmfjTu/y4WexpUqLE6T4x3J6PJKq
	n3FHuRPN4t6yDD1biCFu1PdvdBmeRd11zBGgw4k2qp629h3Hyj2Tv+U8DwG214YDMU4jxsL243ESK
	0Mr6+02Bz6hs7OTlAwUfclWkdgOnDmx0V1ulDiPy+Y4EmAD5Vcr4w5q1kVfIfoe9+4b7/1PajQB+A
	JIOVcv7A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	tony@atomide.com,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	Conor Dooley <conor+dt@kernel.org>,
	aaro.koskinen@iki.fi
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/4] ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
Date: Thu, 10 Oct 2024 14:29:57 +0200
Message-Id: <20241010122957.85164-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010122957.85164-1-andreas@kemnade.info>
References: <20241010122957.85164-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the GPIO expander which controls at least some camera gpios.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 983a21d95db3..6bc8c0397c29 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -299,6 +299,19 @@ &i2c2 {
 
 	clock-frequency = <200000>;
 
+	/* is sometimes not available, research needed */
+	gpio_head: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	/*
+	 * camera chip at 0x3c, available if <&gpio_head 1> high
+	 * and <&gpio_head 5> low
+	 */
+
 	/* at head/glasses */
 	mpu9150h: imu@68 {
 		compatible = "invensense,mpu9150";
-- 
2.39.5


