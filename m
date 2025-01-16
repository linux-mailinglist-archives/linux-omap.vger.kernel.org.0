Return-Path: <linux-omap+bounces-3132-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB5A14489
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 23:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 362B7167E4F
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 22:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23667241681;
	Thu, 16 Jan 2025 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Nyo0g+V8"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AE236A6B;
	Thu, 16 Jan 2025 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067090; cv=none; b=LlkEaGO8kamAaSz8lG3Ro04culry0SoWDHwj2XLzV6ZcdvhohCAiZ5dYBUtPXMJuFto/sW2W52l9NU8LymTxpJaHOfimiTuRDvy8CNh6qSiTisAzI+effU5NBMwp4G6wFkl+XpI90nE9npnAtqLJpnDpr2FaLJ5q5L31OmTBMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067090; c=relaxed/simple;
	bh=JZQRCIDlqCYAsXf+7cLpTSNbCPqqlgSZ+2BcNyruw7I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XWDX4dY5XPiCJHs26F5l31gITRXM/ujISbkYQ+Cj3XoKSg9V7umfo5+5XOSHnE2ls+FUEbk4mvzm6LG3VRpqzCYj6/yGwfiM5zb8GD7k5vAgiDDKLUp03QjB5q+MKj0zG83KyW66x0/fkINJ3rZ4sC11SNSMgxaty+02EE3OOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Nyo0g+V8; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMbeE0078694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2025 16:37:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067060;
	bh=NCWc+ehWuGcsYuQwM+V+KUrTrFj0MlCkngF1UFn0H3U=;
	h=From:To:CC:Subject:Date;
	b=Nyo0g+V8chq0mltAgyh9mrlLsjzTQc3hO2ie6zixLixkna6i+/ykyNUfV3r+15Z/b
	 UnKyEZ41nsBKxzw1M6lVQ1FQ1y1rDbA1yQJItVopgaHVNX1Ph4iNYdsK0WfQ0lh/eo
	 OjObF4eb8DQFooYfV54NZyydSHO4G/p8Fd2QXMzU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMbejF022167;
	Thu, 16 Jan 2025 16:37:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:37:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:37:40 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMbeYL030055;
	Thu, 16 Jan 2025 16:37:40 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 0/2] Add TI TPS65214 PMIC Regulator Support
Date: Thu, 16 Jan 2025 16:37:38 -0600
Message-ID: <20250116223740.429515-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65214 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65215 and TPS65219. The series 
introduces TPS65214 and adds the device to the multi-PMIC support driver.

This follow-up series is dependent on:
Commit 2c4fd76d13ec ("mfd: tps65214: Add support for TI TPS65214 PMIC")

TPS65215 Driver Series:
GPIO: https://lore.kernel.org/all/20250113225530.124213-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20250113230750.124843-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20250113231018.125426-1-s-ramamoorthy@ti.com/
Input: https://lore.kernel.org/all/20241226220049.398794-1-s-ramamoorthy@ti.com/

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9

Shree Ramamoorthy (2):
  regulator: dt-bindings: Add TI TPS65214 PMIC bindings
  regulator: tps65214: Add TI TPS65214 Regulator Support

 .../bindings/regulator/ti,tps65219.yaml       | 16 +++-
 drivers/regulator/Kconfig                     |  9 ++-
 drivers/regulator/tps65219-regulator.c        | 73 ++++++++++++++++---
 3 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.43.0


