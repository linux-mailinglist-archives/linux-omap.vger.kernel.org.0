Return-Path: <linux-omap+bounces-2902-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DA9FCE3F
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A7F3A0530
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036501C8FB5;
	Thu, 26 Dec 2024 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oD58g4Rr"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402D199FAB;
	Thu, 26 Dec 2024 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250078; cv=none; b=EX54+8Cy3y1/c6hXOX+D6xwO/y6ruJAtPt5WlN3pCwNvpxQwO+20du9MbYXMa+l3ERAO9XeuCok2lBDIBaY5sps7q4FUaZ3wv7T1iEN4H9fz7y8xZU57vylCeMT9WWlJb3nrWDerh/ES853QLO6cAwWEuYJ0SwiE/nPNi7uQ430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250078; c=relaxed/simple;
	bh=XXTOyqgQKGGiOXB+i/ylWEun25a6mU7H68foh7KNDxk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DX9yzIkl30JGIZJcU1u89N1aIe4dLJqJ9RC8NeO6Mv8JSXBvzrECHXewqSFeg1IODtqZTWzLdXLAQlj6pUjEZ+glJx3Cbsca+kMwpNwCl0r05kQmU+WinKgU/+J5Nb7ZAx3IF7fcKZSOJwPjdNb0+AxYJ6/fLkEaKOSkebmEUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oD58g4Rr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsDC11307628
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:54:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250053;
	bh=SXV92mc0gQ4YJG65osFx3CNUHBVVPqPQX5zfywPS1/I=;
	h=From:To:CC:Subject:Date;
	b=oD58g4RrxPN+uIMxsyB0mYrUeIyrIuXTTU/gT+PivGH0NakY/T9Ywam2Kr7hK7voo
	 QNptcN/dEKX6jTI9zdJdRAVcTEvjbEik+zdbeC/io26FU0q3xR7ocW0BuPDdR5dzEJ
	 mwUe4oUrkJXBwijsIzOK8+nJl7357azkQ8qckalg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsDvw013331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:13 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9I052274;
	Thu, 26 Dec 2024 15:54:12 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/7] Add TI TPS65215 PMIC Regulator Support
Date: Thu, 26 Dec 2024 15:54:05 -0600
Message-ID: <20241226215412.395822-1-s-ramamoorthy@ti.com>
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

This follow-up series is dependent on the TPS65215 MFD Driver Series:
Commit 30fafb69994a ("mfd: tps65215: Add support for TI TPS65215 PMIC")
Commit 07c9c92bd47f ("mfd: tps65215: Remove regmap_read check")

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

Shree Ramamoorthy (7):
  regulator: dt-bindings: Add TI TPS65215 PMIC bindings
  regulator: tps65215: Update platform_device_id table
  regulator: tps65215: Update function & struct names
  regulator: tps65215: Update IRQ structs to include TPS65215
  regulator: tps65215: Add chip_data struct for multi-PMIC support
  regulator: tps65215: Define probe() helper functions
  regulator: tps65215: Restructure probe() for multi-PMIC support

 .../bindings/regulator/ti,tps65219.yaml       |   9 +-
 drivers/regulator/Kconfig                     |   7 +-
 drivers/regulator/tps65219-regulator.c        | 214 +++++++++++++-----
 3 files changed, 175 insertions(+), 55 deletions(-)

-- 
2.34.1


