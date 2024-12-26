Return-Path: <linux-omap+bounces-2895-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2D9FCE21
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C0B3A02E9
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8ABA1B87D9;
	Thu, 26 Dec 2024 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gZ3LSGwf"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CD19341F;
	Thu, 26 Dec 2024 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735249790; cv=none; b=NpUVdvUNh5mR7/xii3RltQwqyjfFpuPJBACcDq+kktE/pg6Pc+9bB5J25uIhg2DY701i5Xckx+NMmX0Uh34cUUeWZVURnpAyt/JZS7Ki+CFKcTwZNUVQaK1sguFw2uAMoESTqwE6xA9OQfIxSCMKOooYn3ApdvNR57pZ9NqkdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735249790; c=relaxed/simple;
	bh=R7tJbZA/v8kwByakHdxu/pCSEm1yAV/roA0uOuVFQO0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q2lbNY+QRafF3E9gJxfcFHsWFp/6rpL1r/OxBaQA9d3n0vtHtHW0+2nooYeXZzyFuSuMKtPvgRjom/+I2Rz/kttygc9Dr0oXBF+MUmlS72SkK96nTIBBrsJhN28xOEp4a+EsrzP32ns+6pfgp4jFtEHD2vQJj0tlHvhtiTT4ZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gZ3LSGwf; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLnN1g1307139
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:49:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735249763;
	bh=fKLebGJK9NGUyMS2sm2RxUgo4PDZA5GDIhIQ+9mu388=;
	h=From:To:CC:Subject:Date;
	b=gZ3LSGwfbVxFXUEDNQLVUnvU6RLy4/Y/kPQUthoAjYvSDTTu0ide4Mh2fpEN0JG/O
	 D5DIezFfd/IZ6gnLt6QPeUZ8SocWCMRWT1+Zws6esvE0ICHpKoHKQ1aS2sm/zdpZhy
	 MhaCzCmCJTwyg3ojNK0KNt3f1ln6cSdyEih0JGys=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLnNOI071591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:49:23 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:49:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:49:22 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLnMXn060782;
	Thu, 26 Dec 2024 15:49:22 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/2] Add TI TPS65215 PMIC MFD Support
Date: Thu, 26 Dec 2024 15:49:20 -0600
Message-ID: <20241226214922.374987-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Happy Holidays!

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

This follow-up series is dependent on:
Commit 91462d209aaf ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- Both TPS65215 and TPS65219 have 3 Buck regulators.
- TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
- TPS65215 and TPS65219's LDO1 are the same.
- TPS65215's LDO2 maps to TPS65219's LDO3.
- TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
- The remaining features are the same.

TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

Shree Ramamoorthy (2):
  mfd: tps65215: Remove regmap_read check
  mfd: tps65215: Add support for TI TPS65215 PMIC

 drivers/mfd/tps65219.c       | 157 ++++++++++++++++++++++++++++++++---
 include/linux/mfd/tps65219.h |  72 ++++++++++++++--
 2 files changed, 210 insertions(+), 19 deletions(-)

-- 
2.34.1


