Return-Path: <linux-omap+bounces-2274-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6998AF26
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 23:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267681F22F27
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 21:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4D8187322;
	Mon, 30 Sep 2024 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="eJ4yDdfg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D41183CCA;
	Mon, 30 Sep 2024 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731823; cv=none; b=ipL+5NkSSM0ILCm3Gx4mFWwxBCvZVRsxY9lIr88TJK+pUSScceFjzmMkiIsxyq05RZ85ll6ega6EucSxOHyMTT/LVFdlFrAWB7u4sYI8lMgLt9CwixkBywxbz1S52aezHCPQB9o3Ooc0oMaXL56G+LCXq/EXpK/Hmf+mrpwb1Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731823; c=relaxed/simple;
	bh=FsI0oaWwmOVQ6KOvyJQIDOCm13MeMmw1B9HFTphSINE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mBQuhX6NTOy5zoLOpW8BmTd2Kvoy2gbQQSJAu1pfECW70t3Dpgn/jLW4GPYhGCGET9m3OCHASV2UjW+TJyRSJJ11tW6fgAwBw1YzzaQBDgevSo3G7hYFDJZrToqnDMMjtcGrhymOAqdORdHmWdDIu9qSF5q9qIX0x1Zee7C8DTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=eJ4yDdfg; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H7Jvr+yx/BO6UymJrhRV33mZeBfutcKlKBCT4Q2jwxQ=; b=eJ4yDdfgE/qBw14YqJ8LXXCVU5
	Z6sWW/3nnP30/TPZPBJk5RGJ12tcRUgKqnR5sUuClpfHegukysnpSO7VIqWl+JcA/mU6FsntFcdH9
	BiuqXoZFJIqAXaOWZuRx9Ps2QbkOp03hPpfahXnSlNu5JOZQ5bvOP9BMx19fVNh07RxQkpjr5k9jY
	+/Bg4hcceZm/Va0MMDNJC3ZyxQCqhzG6QtVLAK9NdXqa/jhIJornENUwWYYyPtjhJcr3zU+aCaZ4F
	060oNi3o6/wELU8PyvFjilS2L8TDq2ySG6HIWkXEZQdJnZWEblYQ2TRW3pdFqoD6LKch/9LxSwyvI
	MwJNXcrQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	khilman@baylibre.com,
	devicetree@vger.kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	aaro.koskinen@iki.fi,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 4/4] ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
Date: Mon, 30 Sep 2024 23:30:08 +0200
Message-Id: <20240930213008.159647-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930213008.159647-1-andreas@kemnade.info>
References: <20240930213008.159647-1-andreas@kemnade.info>
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
index c8205ae89840..ecd727e65761 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -291,6 +291,19 @@ &i2c2 {
 
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


