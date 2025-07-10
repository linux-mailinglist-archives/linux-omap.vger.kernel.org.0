Return-Path: <linux-omap+bounces-4083-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF46B00A75
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 19:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984EA7610F9
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25882F234E;
	Thu, 10 Jul 2025 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ncRj2Gg8"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B62F1FF6;
	Thu, 10 Jul 2025 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169741; cv=none; b=MujMYvThkmRZKnMkg6uvza/BG+rsLQL2urojO7bFWCly5DM+I6hQucXEjqwfiKV5//6ibOQPKV1Iog6y92p7DAa4LKejqxGnTo43bUoIWV26KAvAeTn4PqYQ4IMx3k31kd4iCrctRabWA9WO4kRAlIdo6d7/IKZLZ4DfJi9bNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169741; c=relaxed/simple;
	bh=xjNm2BWeE00PHyvJRjfE7hktMpltcv0ocuIcwkJfQJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBk94KbYr7CYKiU+BUjxctjGafhVf/vK1/qdLOyMYn6HYe0dqm55c560KVR+QUaZr/t5w+FfZasN1DJEKMT6V5xxoFmHmIys3VseSB8iL2O6wl0Et6bjmAD8wvYS/YrS7JcrWGA0q6zzj+3eCKkmAhZ4Asqn+EkIJMKSLcbQLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ncRj2Gg8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EA354B2B;
	Thu, 10 Jul 2025 19:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169708;
	bh=xjNm2BWeE00PHyvJRjfE7hktMpltcv0ocuIcwkJfQJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncRj2Gg8w0e+PTpGcWZQ1gTmvuSJV3nNnUhXD0kfTN6rtRBPpFWEIhV3x5446HOFn
	 DvBwV2SoQN/RK04f8r0S9Ui9RoyjVK4MZ7I7fujYwMuWjP5yZh6e3npLf38rn8Ymtf
	 SUJMBrPxtqhwliipbHaOcBKlt2N+pXgzmbgzIfUI=
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
Subject: [PATCH 11/72] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:07 +0300
Message-ID: <20250710174808.5361-12-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/ti/omap/omap3-n9.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n9.dts b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
index a3cf3f443785..2edc1933449b 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n9.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
@@ -21,8 +21,11 @@ smia_1: camera@10 {
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


