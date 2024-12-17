Return-Path: <linux-omap+bounces-2845-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298E9F5818
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53965168617
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D1E1F8AE7;
	Tue, 17 Dec 2024 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nxGTxmdg"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC5150994;
	Tue, 17 Dec 2024 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468598; cv=none; b=YFXnbSAZa94twA2ttgR9nM25YYiLIoBixhIvoMqjOaN8eaxzVUCdpzR8OYKrABIHa9BSbniCKfvK8EajyL7PM+RAi0fkQQGbc9g40I9JsvSY/4cLheDo0vWkFjRNrfUSAuhJ+biSss9xXCACI3pdNCjmxOr4zHbf6O236bhycWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468598; c=relaxed/simple;
	bh=jqauervucs34xd7C5K8H/zMRDcEi/djQTC8N+PBrxUE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M3fH1gNBdZ7i0AKJpbdFVICHjQPFseFu839yoK05mqPdirNu0cxGnyJco42VKbV/0HvB/M8Yahu+D6+D+b6OQFvsruJhvGLxCjpIoC8N+e8+qQxy1sRbGTI98nX10wFT0DDAg/HlvnT3aAWUGa4GAxkeNLszzxvE0EHno4r/SmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nxGTxmdg; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKnZ8B057058
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Dec 2024 14:49:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468575;
	bh=gQKVFosZiurw5gJT9GH9doLfY1bvEMH79fpOan7a8ew=;
	h=From:To:CC:Subject:Date;
	b=nxGTxmdg5Tp56D3XpKCVhgZassVCwfHo3c2LT/r92DM7qzurNoaIY5mroq5WvkAY3
	 tXly/ghHkOb66l/ng2vqmZXp8N7/iRxcY/PyjbVUdCu0U7rfLyww0koXVIdcBC8FM/
	 ulfJJzRS9j5VSOucwGEgGp98GXQnjTT//3x5XPIo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKnZAj013384;
	Tue, 17 Dec 2024 14:49:35 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:49:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:49:35 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKnZIB097729;
	Tue, 17 Dec 2024 14:49:35 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/2] TPS65219 MFD Driver Cleanup Series
Date: Tue, 17 Dec 2024 14:49:33 -0600
Message-ID: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
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

The changes involve using existing helper macros and removing unused macros
to simplify code. The intention is to remove unnecessary noise from the new
PMIC device patches adding support to this driver.

Shree Ramamoorthy (2):
  mfd: tps65219: Use MFD_CELL macros
  mfd: tps65219: Remove unused macros & add regmap.h

 drivers/mfd/tps65219.c       | 15 ++++-----------
 include/linux/mfd/tps65219.h |  7 +------
 2 files changed, 5 insertions(+), 17 deletions(-)

-- 
2.34.1


