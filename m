Return-Path: <linux-omap+bounces-2839-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B49F5802
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5650A16F14C
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798AD1F9F75;
	Tue, 17 Dec 2024 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bS+VcCOP"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818118453E;
	Tue, 17 Dec 2024 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468356; cv=none; b=Nn3C4WnOhDKUpTXqno6YMz5IvfHZZqo0JqYE80z8O4RIeBDT1NwwLgRRdlcfFErDaj9VD2DDT5s8vKQ/X2EPoiV6Fh6JeHHQC+dJn/alKlJbvq01K1FM0kk8TndDcTb9Nxf/oFjpguHYyj3miPfypN/ps4EQ+Gb906QAkkA7B+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468356; c=relaxed/simple;
	bh=OG/s2tEQlgMzrXs97y2tksL1HZv80QdkochQqZPUArw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGTNZ5xTnDAh8O20yQu9390EAP4NxUny0aEM+DpE71NSdAR/21K0NHPYRoUpgIqKe682NWYr5Athe9jY9hFwrl6eDOgWB5VPdREJ39VCEu9ShEMyQNJm1NYqq6ksUrLJA3tE2vVGCLLrQE1ygxW5jpCRNFfwWeqPvdaJIpoVmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bS+VcCOP; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjR1K4018753
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:45:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468327;
	bh=melrG4zI9e2Q8k4BTuT6COHt+XhocyE94l2IyPQCVak=;
	h=From:To:CC:Subject:Date;
	b=bS+VcCOPx4uBxk6jHr9+AIWrsDWbnxktnae5wCTmtec736t7hhH69tGQIQn0/I4aX
	 7GdhvuCKi3ghPgCeeAJ7UCgmnYcNJkOaNiraF4sKuek6j261nOJSVPgoce1V9aR3Ra
	 55CqW4M+SorLaTdORaz221ZaZwReBCV6Dkhdy/Fo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjQ93067955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:45:27 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:45:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:45:26 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjQj0023682;
	Tue, 17 Dec 2024 14:45:26 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/4] TPS65219 Regulator Driver Cleanup Series
Date: Tue, 17 Dec 2024 14:45:22 -0600
Message-ID: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
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

This series is in preparation to add 2 PMIC devices to the TPS65219 driver.

The changes involve using dev_err_probe() for instances that have a chance 
of returning -EPORBE_DEFER, remove redundant code, and follow other PMIC 
regulator driver naming conventions. The intention is to remove unnecessary
noise from the new PMIC device patches added to this driver.

Shree Ramamoorthy (4):
  regulator: tps65219: Use dev_err_probe() instead of dev_err()
  regulator: tps65219: Update driver name
  regulator: tps65219: Remove MODULE_ALIAS
  regulator: tps65219: Remove debugging helper function

 drivers/regulator/tps65219-regulator.c | 39 ++++----------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

-- 
2.34.1


