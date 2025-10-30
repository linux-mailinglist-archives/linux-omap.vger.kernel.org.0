Return-Path: <linux-omap+bounces-4817-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FCC21E24
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2DE421C2D
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 19:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2C5375739;
	Thu, 30 Oct 2025 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5e2tGMs"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA337572A;
	Thu, 30 Oct 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851454; cv=none; b=Ntkaky6nqZza0PecRP99q8Byvf5LcdQ7nVYWM4OmTKxvUgzK+RWyKyA5aju4TyOM+ZWu5GiABufillsuVsaH+G7rgWxsarq4aPFI1S8abrGOOwREPSxjPloAr3cjcSechslzvV5rKL8Sb5Tr7qFPp71f4+uSVSz6qwB2YM4EJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851454; c=relaxed/simple;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hF0L4FzUgelS+Hr+C8kDgQN5LaqbQbMlkQ/RKG5Dbyw3PosU2df/16JR6uAO+JuxPPrsYfuVB7gAr6u2FUlsmCLZDXqzpfurxCbqLw7VfEuAwKOTqldToCfGFiGRnT3dROK7JhHk8S5Gfn1vWKyyeuPOTSWrly1xsqxCkPB7cIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5e2tGMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD2AC4CEFD;
	Thu, 30 Oct 2025 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851453;
	bh=adyXiT86E3/PnN/XVD2yWuOTXuTxM2aPkCYxiEEjduY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g5e2tGMsymwn+FJBI5n1hSvtBJs0RhOvxQjknbrX07WyiUzOsLS0uIuE2C9Hmao4L
	 Gm0B3HaAw+egPQJaJu9zGagx+wq+ARareGR0iXjMpULLlRsZCRDcRHxh0Sw5oKQUlv
	 50tD4SlGVSqJZ11l3T6UMlB3n9/a7D+V9DD4GKb8vPOEvSpqL7pViiwopbcQkNedV2
	 JrG2OBYSk9YZ6FsTdjouV48hYMh9Y+Zz5wkVnBwQMdSGpE7cBbDf6sW9O5R10xnz6M
	 mJQLdAzM579Oj3g6HC170GETub0SU4WqyYhklgluYBYDf8GZSm8wXewpUQbenM6tSV
	 gSWEST+q3TMBQ==
From: akemnade@kernel.org
Date: Thu, 30 Oct 2025 20:10:36 +0100
Subject: [PATCH v2 3/3] ARM: dts: ti/omap: omap4-epson-embt2ws: add
 powerbutton
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-twl6030-button-v2-3-09653d05a2b1@kernel.org>
References: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
In-Reply-To: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=kCywPpfG6XQhiUheZwu6EG6J7hIkcu/XRNjW/00c6gg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnMOwwn8gmrlubETTjWsksq4ZzuSSPphL8zjpfdjOrfo
 nsyuXRhRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABOJVGFkuGq027yq88/klKDj
 rBFPv07YwvUxqy1livmfso0Zyjd9WRj+Z+188rBn2t1cn40+IXMFtm3aJGq7QVyrPP3Jx/T4twn
 X+QA=
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


