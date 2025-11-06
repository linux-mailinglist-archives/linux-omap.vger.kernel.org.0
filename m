Return-Path: <linux-omap+bounces-4865-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C0C39B59
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B453618C8768
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB4230B520;
	Thu,  6 Nov 2025 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbt3V9cx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD730B505;
	Thu,  6 Nov 2025 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419650; cv=none; b=hrUmlC9A8kEuByIhunlFp7jsMe5fDngQbizgj0pT3CQeNkZtYXRkJVoX7u8wEiGveUPESQ343AU3bPpGyXibmazHY891Ie1YBhMuhwy/UIjt2ydQtO7DdizC2UpJ5Egt+wUgkCnTOAJySjYwpp4mCzKDO1xyXrGt8GX0uF73Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419650; c=relaxed/simple;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDND/61aK4Jk2SyZkvXO2j+oUNKPn5AvHWYVvfPPLVd4zgqBZXAxgw2vLDpBTmI4VB1f/bSDtRlAhVhaojp4z3hcrGKE2POH/uK7H9fykADyZJ8qY3eTxhcMCSiZehHrf07HD4I3CKFjfxlIEkkbhUhHCPBWpPt2erb5cTYy2Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbt3V9cx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E21C4CEF7;
	Thu,  6 Nov 2025 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762419650;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nbt3V9cxB2LTtZ//SQFL0x5uRrR6uJ/sPHszu1LjQFoMYUdyq2VNZLozcx59t0W53
	 zZyxzonH4cwbWWZ0tVMQnjL98qEsHq0Dv5JhN4kUvU3cxN78oYaLXTmH7fostRlzP8
	 chyfCfJjIFC2wA/k4JCHoq+GFPy8UObrUTqWuqd3hiQP2cz19RQakmS9K2Rn5vIAuy
	 wkoRCjuCm0M9hjDL+Zgzra+ReHiT2U4TBe+pKj0g4hb2anN9vTa2OSNk0Jn3+7Pc64
	 vaUG9AK+1H7x/6Fi8/1sB060vhwR2HtGJkv2LWcl4xuh98SwpVGm+YrgMwU2YCjG7p
	 0ErCycyvlYO+A==
From: akemnade@kernel.org
Date: Thu, 06 Nov 2025 10:00:27 +0100
Subject: [PATCH v4 3/3] ARM: dts: ti/omap: omap4-epson-embt2ws: add
 powerbutton
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-twl6030-button-v4-3-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
In-Reply-To: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=kCywPpfG6XQhiUheZwu6EG6J7hIkcu/XRNjW/00c6gg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJk8yds0znVZih87nG/1cnHcOwZh1aUMC75lXDK4UpuwR
 nvKx0iTjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACbicI3hf/BrqWuz9rQ8W3qZ
 b3s0R97Z549l/vq/L1un0JNUbeFfz8jwV1B+w0+pKHOGzB13JvZZlJbarBGpmLDmqcojIT7GoNs
 xPAA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

There is a power button connected to the PMIC, so describe it to be able
to power off the device in a convenient manner.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index c90f43cc2fae..673df1b693f2 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -229,6 +229,11 @@ rtc {
 			interrupts = <11>;
 		};
 
+		pwrbutton {
+			compatible = "ti,twl6030-pwrbutton";
+			interrupts = <0>;
+		};
+
 		ldo2: regulator-ldo2 {
 			compatible = "ti,twl6032-ldo2";
 			regulator-min-microvolt = <1000000>;

-- 
2.47.3


