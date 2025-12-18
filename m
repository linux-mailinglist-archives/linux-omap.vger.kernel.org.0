Return-Path: <linux-omap+bounces-5220-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0302CCC7CE
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 16:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5819B3053C98
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2092D6E76;
	Thu, 18 Dec 2025 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eMMPfqiD"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B72DF125;
	Thu, 18 Dec 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070403; cv=none; b=E04cDZWC8qAOwQhu76H1KAXRfq40dIAz0HOUvpbKx0L8L61XnHLvTU+M5zZ44LSydQJlxLJZ/USdbJcb33WQU0uZmvJYHyf868duCBBTd7IddJCruG7FOnDIJPArGKP9vv/U8vybjjQbu+eblvp186UdIwObcehHcayPjDbdicQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070403; c=relaxed/simple;
	bh=sLosKdwEM5n3UBcakIlkHvb8i0UYiD1THUjBocLTyNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EVUYFpLs+rI4vn1C0qdkKlXTT3fENDVdd7a0O+y/lG1gSLFZ5QUoWw+7A4704vn7l5Nh9zrdoTklzgAigqBB9YW+5lEFsXbCSvmRnRypPToqIqKzbaRyjvrlRgsGSHYGj9lf2uxvsEZab62yKKF9rwpXNFDYXEU7zn/3w5dxLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eMMPfqiD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C33DB1A22D1;
	Thu, 18 Dec 2025 15:06:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9605A606B6;
	Thu, 18 Dec 2025 15:06:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 871FE102F0ADC;
	Thu, 18 Dec 2025 16:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766070396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KqMH9eLoxiWaVsR+YYUkxeCUobHi5E/7MJZmMY6hEFE=;
	b=eMMPfqiDj/cnkF8d5yS8qCqqjXk61dCNbwGMU5PuukI6kUf46rCVa0mLhgTbc+K9DTmlX+
	Rd2aDFIVVTLbGzsctxNqkXVEoXwrn/A+6jCg4CGox5TkfXsoqEN7Kdf+QoX3ZdAEbdilTq
	8etl1EVLSvdZxZujtKqsvoDV8Y3hyQbVHoZkFmhXG45tLqxZkehPhhQTJDvc6dTPkGXzfJ
	g3GTF729IAkUUZer3oxkT0RbGgvN90OgheH0JMSoRCTJl0FANmkWTqyWxJu/If9fnAJGDQ
	rdHeicWPLJkbwePJyo/3hJFebXIysA4JXdK218kXmypXyExjUic/sGpVnUEujg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v5 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Date: Thu, 18 Dec 2025 16:06:27 +0100
Message-Id: <20251218-fix_tps65219-v5-0-8bb511417f3a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHMYRGkC/33MyQ7CIBSF4VdpWIuBW6DDyvcwxlAGS6KlgYZom
 r67tCuH6PLcm++fUTTBmYjaYkbBJBedH/LguwKpXg4Xg53OGwEBTikR2Lr7eRqj4EAbrLUAyqg
 GUBZlMgaT/1vueMq7d3Hy4bHVE6zXH6EEmGBZaUFqxaACe+i8n65u2Ct/Q2sqlS+cwgcvMzes6
 WTHFKHKfHP2j7PMRSMksZxrrut3vizLE1T7J24oAQAA
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

Changes in v5:
- Add a error message.
- Link to v4: https://lore.kernel.org/r/20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com

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
 drivers/mfd/tps65219.c                             | 9 +++++++++
 include/linux/mfd/tps65219.h                       | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: 2bb202416d33347102b12bbd1db4837fb6685617
change-id: 20251106-fix_tps65219-dd62141d22cf

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


