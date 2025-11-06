Return-Path: <linux-omap+bounces-4868-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7816C3A5AE
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 11:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 63235350B5A
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 10:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40BD2ECE97;
	Thu,  6 Nov 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="duFjs6Az"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C42E8DF3;
	Thu,  6 Nov 2025 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426207; cv=none; b=YWdTI/PMMxbjxwfjzwg1JMkQuZRkNmdgBhf3DA6NLpQRdixGFv/JFhjFGcwx22wvfXGBVo8P/S/PII0zhkrdN/JDCzARHjrQWVKyavhBULCWDy25YNu8qI3EzqcTrEUCf4NhnYot9fvW3WogZlFSpRtq7kvMe+orNM1KMjSrufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426207; c=relaxed/simple;
	bh=ASrAwFhXOWKFQ342vlSoPSQSeT3KAyfNFvciP4N2YFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TngVFM1TuMLPul1uKB5mbFe7MlUD8SCmccbJle4CRwDtFZ+z0zCs+KcUfc+bPkY3FzNBkDvp9p1Q7ZoEBhmMu0bVww+3VnVCc+M9vJpohG0MYyrlq5tbV2+SK2Q78p8CHaGoVxjdhBI3cX9fA5+Fh9p5eAQOaByhUzk87SJil8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=duFjs6Az; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0622C1A18F2;
	Thu,  6 Nov 2025 10:50:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDE1B6068C;
	Thu,  6 Nov 2025 10:50:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 713701185083A;
	Thu,  6 Nov 2025 11:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762426202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JL0grJ4gvAdcdCRThQUm00y7pKXuYsJeqAwkdTwvegc=;
	b=duFjs6Az8g7k2OiPH6XesKID5gcycZBfrJX2r8so77neXqmo7byVNsZZ2bW8YrPqiTaeVb
	I8bImvEJGY+vAh0dzjrSHVpRp8wZe5d/fvgpvlmh6htO+08uNCQxAYJuIexps1olroLqD8
	qZgBkD9XWpj7a/q/KssQFfO0Wx/yppx15lOMmCDjVpIgp7q7Wv79lVhnMQ/1K/TW+rCLmr
	+Ho/1SPia2TQAYuDdgNSDQf21oUuLPox1KGucaP4Qztb2vvUV1l7bgDfFZ1V2qXgnWfl+A
	JwyniZeV89/CZj1iS1bvVXmmhS2H17etIxYlTjVsK35cA1ODmLWeYqYWcA9EyQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v2 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Date: Thu, 06 Nov 2025 11:49:01 +0100
Message-Id: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB19DGkC/x2MQQqAIBAAvyJ7TnCXFOorERG51l4sNCIQ/550H
 IaZApmTcIZRFUj8SJYzNqBOwXascWctvjGQIYtonA7yLveVnSUctPeOsEdPtAVoyZW4+X83zbV
 +4hHIJl4AAAA=
X-Change-ID: 20251106-fix_tps65219-dd62141d22cf
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
which prevented the CPU from reaching the 1GHz operating point. This
limitation was put in place because voltage changes were not working
correctly, causing the board to stall when attempting higher frequencies.
Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to be
used.

Add a TPS65219 PMIC driver fixes that properly implement the LOCK register
handling, to make voltage transitions work reliably.

Changes in v2:
- Setup a custom regmap_bus only for the TPS65214 instead of checking
  the chip_id every time reg_write is called.
- Add the am335x-bonegreen-eco devicetree change in the same patch
  series.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (2):
      mfd: tps65219: Implement LOCK register handling for TPS65214
      ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage

 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts |  2 +-
 drivers/mfd/tps65219.c                             | 51 +++++++++++++++++++++-
 include/linux/mfd/tps65219.h                       |  2 +
 3 files changed, 53 insertions(+), 2 deletions(-)
---
base-commit: 1c353dc8d962de652bc7ad2ba2e63f553331391c
change-id: 20251106-fix_tps65219-dd62141d22cf

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


