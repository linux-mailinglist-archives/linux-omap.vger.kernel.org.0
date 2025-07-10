Return-Path: <linux-omap+bounces-4081-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90320B00A6E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 19:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5335C3465
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63082F1FE9;
	Thu, 10 Jul 2025 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxAZ7gA+"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3A2F1FDA;
	Thu, 10 Jul 2025 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169738; cv=none; b=CiY39ogI6bb0AYET7lWkzDXhHdW2AgJ3r9npUcENfeDF2lulxXTidZOz7QCaAp9PKUw1Qz1E7YhbateuFkqN2ZJvZXi/r2mb/ipX4YbPtAeUS2FGG7/3R/VdYjYSUMjVzT+NIN2sFvuxsHjR8PnlMqWFwTgwPjGgTMyHHI2H1Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169738; c=relaxed/simple;
	bh=Yx97Cit8JkW97aR5BjPGKQfP2/jwTWQedi4ZMWfFgcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jl9uBQQWLGKbel+TSPni3tpwTaRy1Rrq3nlarYbk5jfkuNd3h45DU12b0T08JaGKe5mNCGCYV/ugfp76+OJtOIbbqnCJ+aoS8CxqWs+GyQAUSYIPkiweY+t3ELCKWfJUz9IKMfT3iN4uJxLGWhLW835y82bazLm3A7JXKKvmBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxAZ7gA+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 715841AD5;
	Thu, 10 Jul 2025 19:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169704;
	bh=Yx97Cit8JkW97aR5BjPGKQfP2/jwTWQedi4ZMWfFgcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxAZ7gA+n08+1ZiaY44DZvDX1ukg6l7ZJjrfY4SGM6BPggMfCzCQ8BclZ1Xgzvjqt
	 htbEMVZBD2xBeIpXv9PFH8OmIdVOVrEuFhvTbAih4hikfaCGfujfiATPfxW9LzV36L
	 iTu9YrWxrHLDm0Xly0XR+w0NcfpdMlu6G67wwoxQ=
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
Subject: [PATCH 09/72] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:05 +0300
Message-ID: <20250710174808.5361-10-laurent.pinchart@ideasonboard.com>
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


