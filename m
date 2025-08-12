Return-Path: <linux-omap+bounces-4210-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 337CEB23B45
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 23:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95177585C19
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 21:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C799B2E88A5;
	Tue, 12 Aug 2025 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pP9ir+8o"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174002E7F24;
	Tue, 12 Aug 2025 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035313; cv=none; b=b/KlkHpgM7elpb1jMeOiaCuTE+kvnanKOEzXkp0gkX760knk3yI4L1u6UQKS8Taun95HfpE0hTLBx6wIBunX1oFlrM6vRufyCJLvvmZfxvFauC+VqPsFRKKYGAXdb1KwNNzq5++xfK89fgSIei0ImKkxPCVWk/ixeNCx9hjbmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035313; c=relaxed/simple;
	bh=BzgBR17Zq5zzhteVPxzOplHRa55eNAnsGAYxzfEuqZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kl3CioYR3FsMtpNofpIGbou3CMnbC4knBpaWDlXVrEJJTIgfBuDWQQbYEmhMmUViP3MZWPMTdSWqrgOvwuUK8B5bdUw724b8IzA53W0D7dQCOzNlK7Psb2MiZOCMbSDySd7Gb3kkiUtulBoeELu4F0BRlTdZNL03J5x+qMuc/bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pP9ir+8o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D72A410D4;
	Tue, 12 Aug 2025 23:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035258;
	bh=BzgBR17Zq5zzhteVPxzOplHRa55eNAnsGAYxzfEuqZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pP9ir+8oK6d5gxI+lji1Ons0ktjRFZx6LB0BFqguYgBWmop9z6Kb80WIfWk+/W/tq
	 +PYutm58Gcd+cM0hM0ya3zCGs81VmTzGVl7gogD+Bsw6n4uoYy9vG8MTs1UM9UBVTv
	 oJgo0hf9m6lqSRU8vx9tgIKKRy//NZ5N5z6Ps5o4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 67/72] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:15 +0300
Message-ID: <20250812214620.30425-68-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
This patch depends on "media: i2c: et8ek8: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.
---
 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
index c50ca572d1b9..0d4ceaf96f66 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -792,7 +792,8 @@ cam1: camera@3e {
 
 		clocks = <&isp 0>;
 		clock-names = "extclk";
-		clock-frequency = <9600000>;
+		assigned-clocks = <&isp 0>;
+		assigned-clock-rates = <9600000>;
 
 		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
 
-- 
Regards,

Laurent Pinchart


