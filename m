Return-Path: <linux-omap+bounces-4814-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F49C21DF7
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8675F4E82B6
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 19:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E2036CE0E;
	Thu, 30 Oct 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldNniPL3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D12594BD;
	Thu, 30 Oct 2025 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851445; cv=none; b=RnNZtE8qffxVyrJaTFWpbV/YMeDh+l67VRs+Yl0txKUNdk+DXdIw2Bydvuijd+mXgPYxpSQHH7/kxj18dB/X8MpEOyiJltgBy8wgm8+oW6qplwVc+qyuVupo0+CgW7Gv0C2nXzceQJruHmVnXKAz17DSsYvfZilluyPPC476viE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851445; c=relaxed/simple;
	bh=naMvRg+jiLIrCXBRw75nBlNgeBZSLRLff3Z2tNMap9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzjT9xz6InoSwUQ1K+LkDQy0DzSj9/FC0d77bUi9Mkh7bSQTOpnQI+DLRu5kfi4EUnGCaXEKsb2HhMwulZ7xI9pujEr0k9SyLbilOrl8QrpUJlsLh2qPdh+TJv+DJFXqdEhtJXOZfWbx0TtgwlVLSCHdsPKYr1ol7hav2dDowaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldNniPL3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6734C4CEF1;
	Thu, 30 Oct 2025 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851444;
	bh=naMvRg+jiLIrCXBRw75nBlNgeBZSLRLff3Z2tNMap9Q=;
	h=From:Subject:Date:To:Cc:From;
	b=ldNniPL3Cc0f1rrQCaRSSaIY+akdszPnenKqRcKL+h8ZL/MVHb47YJW9bKBrbO1BV
	 SxlWIgz4ipokOTxuS1Mr1BvCYrY90MtE0lyooovCr9nVHQBxaA34Mt2nVovHxqf9AC
	 8c9f55OUB8IlU31uxb2sr9LSpj3/+U1BReM8FK+Ab5Rz+6/gcGMMW8nAz6rSH0QFGl
	 VjYUD0BUdMx4ip3zOWrBxDzKPnvK4ODrds3SBqOrQIMZ3NApFfh0PLDMs8QiCJTgJz
	 eXX/ZtZb69WOjyaXUhy4ugW2ZWaXO77rrgQC6UTg6hxeE5AnO9Be59IEYpOMjVYz80
	 4NO5E3SI3qARw==
From: akemnade@kernel.org
Subject: [PATCH v2 0/3] mfd: twl603x: add power button
Date: Thu, 30 Oct 2025 20:10:33 +0100
Message-Id: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACm4A2kC/3XMSw7CIBSF4a00dyzm8ii1jtyH6aCPa0tswACip
 mHvYucO/5Ocb4NA3lCAc7WBp2SCcbaEOFQwLr2diZmpNAgUNUeBLL5WjRLZ8IzRWXaSU1O3A2o
 kDeX08HQz7x28dqUXE6Lzn91P/Lf+pRJnyFpJSivVj22jLnfyltaj8zN0OecvcUJqf60AAAA=
X-Change-ID: 20251020-twl6030-button-83d759b060e6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=naMvRg+jiLIrCXBRw75nBlNgeBZSLRLff3Z2tNMap9Q=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnMO3SbnvX+Xeio/o67s1F0/+pTO/maPiXmGtawnAyPO
 hj68mVpRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABOZNpeRYUq9fdyWP8ujpZx2
 X5d0XCM7Ne8+75Ij+c87d6mue9099wcjw/a4Z6tzlNXPvFBfcGXFQz03h1W68x+u+PH1XmO0neW
 fySwA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Like the TWL4030, the TWL603x also has a power button feature,
so extend the TWL4030 power button driver to support TWL603x.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Changes in v2:
- integrate driver into existing TWL4030 driver
- improve commit messages
- Link to v1: https://lore.kernel.org/r/20251020-twl6030-button-v1-0-93e4644ac974@kernel.org

---
Andreas Kemnade (3):
      dt-bindings: mfd: twl: enable power button also for twl603x
      Input: twl4030 - add TWL603x power button
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton

 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |  5 ++
 drivers/input/misc/twl4030-pwrbutton.c            | 61 +++++++++++++++++++++--
 3 files changed, 94 insertions(+), 12 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251020-twl6030-button-83d759b060e6

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


