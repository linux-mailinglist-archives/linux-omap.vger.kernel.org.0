Return-Path: <linux-omap+bounces-2095-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5996A4C1
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C55AB2740A
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AE818FDAA;
	Tue,  3 Sep 2024 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCgdzowS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B418F2D1;
	Tue,  3 Sep 2024 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381842; cv=none; b=o8qi6sByeQw6o8iCFb1yoGfE+kRbOsUcGj9FuPb3tJB/fFhvY+vkohbJq+TguaBznEH5Os5/W23WQZTfpo687aNWHQtuwJFOjh22UeeCpxJC6PKQTpiHOqxE36MVrdXZQ+grUzAJcNgJs6BoSp8sOd6PYpCdANvMK+saqtYW3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381842; c=relaxed/simple;
	bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVcSHd652ThyNunC6FErSW+/gZt/G7Xk+3dwpTH3qYiXwMfiNbRwj8G30zgJy9ccPyPIMok1MU4s+++Lac3Vy4EXq8vWoXhBJViI6DkQPLCkGaewWO1H7I1hTR6nvEmFhTvDOrKEAnwKszlhJZ/GrqVi918iT9XVeOcqGzHbFBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCgdzowS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4616EC4CECB;
	Tue,  3 Sep 2024 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381842;
	bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SCgdzowSUX2K2JHy8cppd+iwwv8eABVJI8k5cnB/4lKWWwGtPPiIJO9NI7fzs0io/
	 otQn5RFMYTjXNucAB4eu2AMM5OxI0PoSqb8OYpJjIgcaTHd+vTHJvqSvmnKS0KObqL
	 XwbSav8fDGkTKAm9i3o702iFxsP/DIZ36lmXPUImQa7VlFFiIgZnT1Ny7C2xhoDKVV
	 i1k/n0aforC3mXdTi7TEBrQ16NP25Gj/bxrEhZi6x60CUHzzMZlHkHiRJfCvr9ulFs
	 K+AXEbAN5QXYtSqQvKzFY355SIh6IaYuctUwg5Gx95/8sjRu/LAaigFDIVeBI3ZQh6
	 sEmBOghExSq2w==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Sep 2024 19:43:46 +0300
Subject: [PATCH 3/3] ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from
 onenand node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-gpmc-dtb-v1-3-380952952e34@kernel.org>
References: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
In-Reply-To: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zzE+rQ6FdyJlyLiGQ/yEkQ5mlYFBAJARKao4
 XEC+JbQGs+JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc8xAAKCRDSWmvTvnYw
 k6zxEAC2XTgmhU5HvnS5w+WmgD/nZFCwy3v6ZXa/5UqnJBUeLzwuqV7mpFXKPpPxCGlsyXKIluH
 j0esP2dvdOQyOwoMv3/9LXOxUZAEgX1GQkZMSMtM5mt9mk3/mPwS/CThNkYqu6S3LImXGT2sDkf
 x/3FQRP/TciUKeYzaHvKpiV++irwomcLLXFtbHCCJxoJbFwZrgx84ytR3G5gs8kjkjZ3LrKInmm
 1dmHz27sdThWmEX09zQOSDPzk3tRioP2BAwhE6oCvKJW7/KmQgcaRa5u7c1Wq9yS+vLkqFijK5D
 IB63+UAOh2VC3JqNfim489Dgp6HwvlckrM2BtQTaKVt1FmikSaeqId7/IQpgf3OvMfvLRz9AU3W
 tWNhhE0EzMPMyLaqZBlS5qQluZCFjv8+3VM0ZP/qTlWVU63txFcd1DyMqXS+xTiXi3AJymNDORq
 2sRXWQEmwXMIHmZf5Og8mYTezEc7o1q/qBjePh64fa1YxdM2JbyrsOawSGdr1/EkOEGLMjtWVPG
 k1jiW1b/vfXgwgeaXbdFKj2sfw9cQVSBxLzo0JsNC2AWe9km3JeuLDqXQzVcCIrIVJ23vfW2e/i
 CXyjdGSaKXxELKUsQxUc/0ilmKxBgUfDKUaXoB0yG5rpXRElVjCbNX/g65ScnyRwBuyd7IBHE5R
 kvwvAXRuLL7Lkkw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

linux,mtd-name is only applicable for PHYSMAP driver and not for
OneNAND.

Fixes the below dtbs_check warning

"omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
index 1454a89aa980..cc5e9035ef73 100644
--- a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
@@ -147,7 +147,6 @@ partition@780000 {
 	};
 
 	onenand@2,0 {
-		linux,mtd-name = "samsung,kfm2g16q2m-deb8";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "ti,omap2-onenand";

-- 
2.34.1


