Return-Path: <linux-omap+bounces-1903-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFA94FE32
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 09:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7C51C22838
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4C73DBB7;
	Tue, 13 Aug 2024 07:01:37 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EE4C81
	for <linux-omap@vger.kernel.org>; Tue, 13 Aug 2024 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723532497; cv=none; b=JJadNw539VPhF47qmm8q4RbjdHRKW+L+Nt3pwKeA/Pu8uA1mufaGumEQpD1HXu66dVU8ED0HFi/bsVoQ4nOQvBQZWKofhwxMAj/nQ3amqNmuPTnxqN4MlsJlXPFqdM/Nuna279uH/48enN+OTmwjoaMhPgXJhQPy7Pdcp9MryDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723532497; c=relaxed/simple;
	bh=MdS9zr5GtZeKJEuVggJxe95IO5hNWbRtiqJCtdcI+3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVY52AS4VoghZCXH6OSgvYvdBKhP8pMloAnRi6S8ILth8583J1pYPMZtSqxNxbQL5A3+ni1at6HU1iOyhe9scQKxN84alYzFtR29TTV8h859uwEMJ6e49wPyM/xprwntn1fqmWwU808NDRxtfghpAE1rNq15vcZ8meWWyiJ/Tgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wjj045Jvwz1HGN6;
	Tue, 13 Aug 2024 14:58:28 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id CDDF51402DE;
	Tue, 13 Aug 2024 15:01:31 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 15:01:31 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <aaro.koskinen@iki.fi>, <jmkrzyszt@gmail.com>, <tony@atomide.com>,
	<linux@armlinux.org.uk>, <cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH -next] omap mmc: Remove unused sx1_mmc_slot_cover_handler() declaration
Date: Tue, 13 Aug 2024 15:01:30 +0800
Message-ID: <20240813070130.1039873-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The sx1_mmc_slot_cover_handler() has been removed since
commit 652bcd8f72cc ("omap mmc: Remove broken MMC init code"),
so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap1/board-sx1.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-sx1.h b/arch/arm/mach-omap1/board-sx1.h
index fafe54a2e444..112826a73adc 100644
--- a/arch/arm/mach-omap1/board-sx1.h
+++ b/arch/arm/mach-omap1/board-sx1.h
@@ -40,6 +40,5 @@ int sx1_i2c_write_byte(u8 devaddr, u8 regoffset, u8 value);
 /* MMC prototypes */
 
 extern void sx1_mmc_init(void);
-extern void sx1_mmc_slot_cover_handler(void *arg, int state);
 
 #endif /* __ASM_ARCH_SX1_I2C_CHIPS_H */
-- 
2.25.1


