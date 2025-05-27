Return-Path: <linux-omap+bounces-3740-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FCAC5A5E
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 21:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD7747B06FF
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 19:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821BE281341;
	Tue, 27 May 2025 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GGLAubnk"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDC1F8F04;
	Tue, 27 May 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372717; cv=none; b=AxDOrH4xKm7pNEuSCdBEyb0R30CkY8EbgT3VBHFkEfBUNlmIs/1JwiqA0xcvNCa3yHxFs5UjkaDpww0F+NNBisXakL/vTOgkhnkT+MsL/cJxYZGqkPMWr1ZTkFC6l9f5DkEe47ZzCjAKCh19Pm+e91NBjRTCehJfj1wulAjpH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372717; c=relaxed/simple;
	bh=3+NtFlmtXfUy839svZeeGU9OBD1iYnlGA4I+ECBvv9c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YJe8iKz+wQyHVOCrAFbGxng0EfF033dfxyGTXG3WKK5vnS0XCzI3knBfOXd2yttsuDR8PMPuPG3ObTI97ohzOIh12u/pzjgi69b8HyWfrwxpUNyW409peVqZrA63FY3JLiEcT8Xshe5KKW5ZbJLdKF5MNdhOLIdOiVLzPTlVmCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GGLAubnk; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RJ4t293043645;
	Tue, 27 May 2025 14:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748372695;
	bh=VcCP5sL9rJHfMN4liqC6MuWZiSWMlAhVNHDNS4foVfg=;
	h=From:To:CC:Subject:Date;
	b=GGLAubnkSWIH0+nEECy1q4toh4BMWOeckgibF8+Qe3PS1Oi7I6OmzzsV+yhOvCauP
	 QiWIZzb8lmsRCLU806SN5tOllfo/FMm0ym6D3scT8C+e1HtYvHXx/cef8iUojRBKuF
	 Ej8WcDXqNDGv+3NzF4FWn0cIeugRdPU1IH361MuU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RJ4t3t930893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 14:04:55 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 14:04:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 14:04:55 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RJ4tcP3540893;
	Tue, 27 May 2025 14:04:55 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: [PATCH 0/2] TI TPS65214 & TPS65215: Update MFD Cell Structs
Date: Tue, 27 May 2025 14:04:53 -0500
Message-ID: <20250527190455.169772-1-s-ramamoorthy@ti.com>
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

The patches updates the GPIO compatible string for the TPS65214 & TPS65215
MFD cell struct based on a system design change made after driver
development. TPS65215 & TPS65219 now share the same GPIO count 2 GPOs and
1 GPIO), instead of TPS65214 & TPS65215. TPS65215 will reuse the TPS65219
GPIO compatible string, instead of TPS65214. TPS65214 still has 1 GPO and
1 GPIO.

TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

Shree Ramamoorthy (2):
  mfd: tps65219: Update TPS65214 MFD cell's GPIO compatible string
  mfd: tps65219: Update TPS65215's MFD cell GPIO compatible string

 drivers/mfd/tps65219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


