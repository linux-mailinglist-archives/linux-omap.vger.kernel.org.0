Return-Path: <linux-omap+bounces-4908-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEE5C5380A
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 17:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596AD62442E
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C24E33E360;
	Wed, 12 Nov 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Mko/5yoV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AD337BAC;
	Wed, 12 Nov 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960477; cv=none; b=H+Qb5ivWigedGDi5tsAQSRaiGjAssz0tAw7scSZtz+XN+2lKEAnS+P0BTldAq49655EVlk42gkP1GKfhZ1ndqHVgScqOO0GTa9hzMkr7fIzuEvyAhJi5/sF04ClH0k07Hy10gBIBwYCV9lPBL6k+k+mWUaQ4Gc5T8hUz0sQ70eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960477; c=relaxed/simple;
	bh=Jnp4IlflwgSMycJi01qBlU7Sv1wGXj0nFB6lrlCZrlE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I5F1YicKrkPJ0AFB8llQ1I+4Z11x0MPEIB5OjhRmlV3/K5v1qqWM5Z1E4iSnJ5MhwQPuS/M1OSWSd2fqi3MP2PX8f3zsb37zVDszSc8r6cp9xQz+ogwOMVmHThyH+5ClSMb/rINMDadt6T10/pTirorvyDoTb2SI7D1wl2z3h70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Mko/5yoV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED52E1A1A31;
	Wed, 12 Nov 2025 15:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0C806070B;
	Wed, 12 Nov 2025 15:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04983102F187F;
	Wed, 12 Nov 2025 16:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762960471; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TQgXjxSgHcT+NWP+SefXHNsxBqz2GVfd0mxc5Ppvkuw=;
	b=Mko/5yoVvgtVcnpBGG/WcDNSfej+OFBndYnTCcBmVzaCvpL9kgreyq/JjmJCG8O8G8WVIR
	poqxuoU/+AjIgK0jRbGdpzwzaqOUddETZIoXIBLC9+Vmsi9rFsmKn8s01Nm1IKDyABLqZ3
	iTTZDUSjfdcyWn+430OGqt+e0zTSSxtH04/fSkv4GNdTvMQN5dijO604uxdG8M5NC46Nee
	BYR9g892I6KeRqYta6RGkakg2W20T87V1S1GFIXi/BGV7bjo5FLytxZE2Pe/HvSA0gYOXg
	Z/IX87MMXILW69Gcy/75DC8F3WIqnMqlsyvLN55v5BNEXGeZRnngR7OmF69Ueg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v4 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Date: Wed, 12 Nov 2025 16:14:19 +0100
Message-Id: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEukFGkC/3WMwQ6CMBAFf4Xs2Zp2KUU8+R/GGGiLbKItaUmjI
 fy7hZOaeJz3MjNDtIFshGMxQ7CJInmXQe4K0EPrbpaRyQzIsRKCK9bT8zqNUVUoGmaMQiGFQdQ
 9ZGUMNv9b7nzJPFCcfHht9YTr+ieUkHHW1kbxg5ZYY3/qvJ/u5PbaP2BNpfJDF/ijl1m3sunaT
 moutP3Wl2V5A/X0fz7pAAAA
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

Changes in v4:
- Move the registers unlock in the probe instead of a custom regmap write
  operation.
- Link to v3: https://lore.kernel.org/r/20251112-fix_tps65219-v3-0-e49bab4c01ce@bootlin.com

Changes in v3:
- Remove an unused variable
- Link to v2: https://lore.kernel.org/r/20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com

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

 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 2 +-
 drivers/mfd/tps65219.c                             | 7 +++++++
 include/linux/mfd/tps65219.h                       | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 1c353dc8d962de652bc7ad2ba2e63f553331391c
change-id: 20251106-fix_tps65219-dd62141d22cf

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


