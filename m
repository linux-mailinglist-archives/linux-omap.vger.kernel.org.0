Return-Path: <linux-omap+bounces-4082-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F58B00A74
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 19:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F181C876FA
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE29D2F1FF3;
	Thu, 10 Jul 2025 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qgEz+Vce"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251D199BC;
	Thu, 10 Jul 2025 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169739; cv=none; b=mjPY9KN4cepEXKjczOH/EEEUHlze/albGVAloYVfs1CEezSPM4vJ1OERQjtWt2gCLJf4bFt7C4xNJcd92Pgguaj0G+Fu1XnScJHDUWWe/GdK5iG0p1mRyMrzmKBk5pNS84hPIkmHYynz7Q3k0hw1F+X6/NQ0DwN0v5zMdsOqr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169739; c=relaxed/simple;
	bh=O6IYkgILTbk8U0DnVQBlNG6+7hs+mkXbRpK79O/KzWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyZKhW2P8Hx13JpnvPkPiFC30uoZlfkdUCRAZYhkZsN92vpQvyjECiC8ic2pDOJxlp45/cCFKiLWZkN8Ic+VwoVdJVmmycpJEDAZ0L+KkndR+BjFejf6H8fVqZfP2ocMMIMzk6CppHuVTT7juXLrdcnZV/pAtefT1XIVdgNICdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qgEz+Vce; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57053C0B;
	Thu, 10 Jul 2025 19:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169706;
	bh=O6IYkgILTbk8U0DnVQBlNG6+7hs+mkXbRpK79O/KzWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qgEz+VcepszB1Jvo87eytax1fcknxbUoe2SxPnSOstxcROzgGxRwhFpxSc6/g7bsh
	 3Vkx2khMe9h14AS7KrtbX6D5ICVR3zkJarK8Y4+OhweH4G1TCiCJdUuAxIVRFE8CbW
	 bF7iVwOYf6brPwGEzhQX+s9BoaqqAwlQ2mJ5yL7s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 10/72] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:06 +0300
Message-ID: <20250710174808.5361-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/ti/omap/omap3-n950.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n950.dts b/arch/arm/boot/dts/ti/omap/omap3-n950.dts
index b99f97880204..2864ed8dd6c3 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n950.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n950.dts
@@ -74,8 +74,11 @@ smia_1: camera@10 {
 		reg = <0x10>;
 		/* No reset gpio */
 		vana-supply = <&vaux3>;
+
 		clocks = <&isp 0>;
-		clock-frequency = <9600000>;
+		assigned-clocks = <&isp 0>;
+		assigned-clock-rates = <9600000>;
+
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
-- 
Regards,

Laurent Pinchart


