Return-Path: <linux-omap+bounces-4208-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC688B23B41
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 23:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8930585289
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19AF2E7F1F;
	Tue, 12 Aug 2025 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="epJDgQZh"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303532E7653;
	Tue, 12 Aug 2025 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035310; cv=none; b=I7uXK4KkedzGEwhg55lawGhiSK4cPRCwb9WxGe8sh0M4KsSbIAVqExB+qmTJ56ldgvcIPk5hU7KjCUeXBIxkJZKSGAsTlnuf9p1CcqUKkxxXQ1pfPQXhQvxc2D4YtL9xGenU9LkqqZFIG3M0zXipc3gwJ2nqIm0UOSPLfEXfZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035310; c=relaxed/simple;
	bh=dJwQxAjbM4LylLQrI6Hr8oSOKL3Dd69CDYRUQ8Zwl74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfXI19A6K69bN63t/4wxP0NFrmB189UTLCviJXPnWbYIC2tvFI36qdfbaulawfgcjv3a18rXP56meoWFQfDsh4FLVXUXMA/l5/E216TZD2DIR6dtyfWparaWoLopYHq9g/k3AYDGXFGcxOvY8NIJb+UBkNFVb/3X5a3GvirhMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=epJDgQZh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BD45E1738;
	Tue, 12 Aug 2025 23:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035255;
	bh=dJwQxAjbM4LylLQrI6Hr8oSOKL3Dd69CDYRUQ8Zwl74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epJDgQZh/mTRuxez5lbSxP7yVIh4CMIWudo6UsXdNPNwoEBzBKOv6DGSV+ynPO/ZL
	 7j3X9IfTNlPgrnL6guJGid7Gx4sYynjcpoPVcomK4OPvkXIHlyfWZFrVZ7uJlhkGSH
	 w9a7tDnG8XErscuFHJD9b49QPXctGkK4IfXjIutE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 65/72] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:13 +0300
Message-ID: <20250812214620.30425-66-laurent.pinchart@ideasonboard.com>
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
This patch has no dependency on driver changes.
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


