Return-Path: <linux-omap+bounces-4854-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AAC37948
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 20:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10D23BED32
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 19:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226C8345CC2;
	Wed,  5 Nov 2025 19:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ktkw8h6G"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F6345CAC;
	Wed,  5 Nov 2025 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372378; cv=none; b=noNfhweS0FTwrbgeva78ARbvIMiDzu8oz65Wc+IKev/dRAp1PHYSV5czaMgyMwM0bRkZF1nDsAsVoC+HF1UI0Atw0DKoiKmUfVVS6p9CxCxoKhX/mhcdEQTsyiDp97vUvYJS4UDwqzlbJLppxGtcU9wzJ7pJqJF/AoVH5a0v7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372378; c=relaxed/simple;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IojLwhlo1EAdDaBad/w4Re9L8MM4kyuh+0bQIAvmYGJkzOzaVmvWOc706cCFhybtfnebdu/QwbQsVthnrXEhNQrrxoBN7ppq5D0PRUrPA8t3C4iRwG8LREoRBP+oWZGk1W11J5yAbTGxAqoqwo0+8V3BgegTGfYqF41zwWQ9vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ktkw8h6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B17C4CEF5;
	Wed,  5 Nov 2025 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762372377;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ktkw8h6GlcysGPKIcqkTCsIRQG7DdIskEpJ1zknkBIDLKam3uFvNmAkiSbbs/gSjH
	 sdXDYgVgajbrgkkac+U5FOY5BeUC6XYdmhOxlXC5m45gLDVt0hFB1HAGPO6Mcv6gCD
	 A2T3TSW6aG4k8qaSEJHgpALCEcd0w9bm41oSydk4/4/EGkbvAeVYUyM+aKuGb30Kso
	 8IMzxr4UbhVnmNF/0QJBThVSvBStl3VSU0rwhvcGJOPVvqJjI7L2gtvRXtnIfQfopr
	 6MFLOSuG1g2JhrZ6IGz4teIOZLL7U4IKhE5Z0aChKnHjV4eQx3PQEdjy4Mu9XVe403
	 sW6WBLpi+NgvQ==
From: akemnade@kernel.org
Date: Wed, 05 Nov 2025 20:52:37 +0100
Subject: [PATCH v3 3/3] ARM: dts: ti/omap: omap4-epson-embt2ws: add
 powerbutton
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-twl6030-button-v3-3-9b37eb2b0989@kernel.org>
References: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
In-Reply-To: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
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
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJncq3nV371cePT/XUPWNHOvRpFFh19Xzp9/72YPp3ysT
 plmMfOOjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACYy5xzDf1/2U17rntzZuo3R
 4sanbZfmaNXN2MfmumIGk/G/dXnNd7kY/nB890nZEKVo7G7NepHdXeC4xCW9/7pbOPzZlFwuT/g
 1jxEA
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


