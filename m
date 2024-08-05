Return-Path: <linux-omap+bounces-1833-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A1947925
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 12:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA5AAB21992
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 10:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD3154457;
	Mon,  5 Aug 2024 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LjmrMcBk"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424A14F122;
	Mon,  5 Aug 2024 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852752; cv=none; b=EFtT/h2Ve/vBT3BvS6plW2OitOe42L2Dw1/ea6ILkVayi+Mi0j6PdhNl2bTOPDfyOaJoRyfdluiuLtcSJlhSVQ934oLfW8YGzaXREJkHy2JcG//RD52zVONUT1M7VpIk3xmKVwJusnAerGKshYnwKDuGFmrRI6CXdyjzAGD3fXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852752; c=relaxed/simple;
	bh=ncIQxTDo8GyJlZQyaUhDdW/VdsRHE0l2yqoNLqRBlj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K7P46ktmMELfye6XqlW0HJs34CXyWBujz6L90AHHNt4XoihB2H4bd1TA3KVDOW01TfZAeB1hO3HO/IHrA8SFkhp6BVE0VEeRzUB1qRHZ9G60lqaZevvVbpa+mrP61R2TTGHyvE9gyQc4SYhD8TvjPC8vRHBmtLZ1vLAI+bM949M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LjmrMcBk; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475ABxFx052803;
	Mon, 5 Aug 2024 05:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722852719;
	bh=zXS0Wbmzl2MnWRxJChy7+js9aSs4+Hs+IORdBM5apWk=;
	h=From:To:CC:Subject:Date;
	b=LjmrMcBkFR3HTRmDBPxXConoXpEaEnS7Cdt3dP9ujOn5icd8UQyheJ7+jMm/h36oA
	 D2lUpP4xu7ZCCTNsz6LAAlQCPR64ejbJq3vRoMvFQhUANyZSJci9AKjN/EPOb0IMwA
	 hYqtPmnr0AvR6uZuojqv8fF8wePnvubm/qpqhGps=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475ABxLc092174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2024 05:11:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 05:11:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 05:11:59 -0500
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475ABuMD071854;
	Mon, 5 Aug 2024 05:11:57 -0500
From: Dhruva Gole <d-gole@ti.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Roger Quadros <rogerq@kernel.org>
CC: <vigneshr@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>
Subject: [PATCH] bus: ti-sysc: Remove excess struct member 'disable_on_idle' description
Date: Mon, 5 Aug 2024 15:41:18 +0530
Message-ID: <20240805101118.427133-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

When built with W=1, the driver throws the following warning:

../drivers/bus/ti-sysc.c:169: warning: Excess struct member
'disable_on_idle' description in 'sysc'

Fix it by removing the excess description.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/bus/ti-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 2b59ef61dda2..772de1d68f36 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -126,7 +126,6 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @enabled: sysc runtime enabled status
  * @needs_resume: runtime resume needed on resume from suspend
  * @child_needs_resume: runtime resume needed for child on resume from suspend
- * @disable_on_idle: status flag used for disabling modules with resets
  * @idle_work: work structure used to perform delayed idle on a module
  * @pre_reset_quirk: module specific pre-reset quirk
  * @post_reset_quirk: module specific post-reset quirk

base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
-- 
2.34.1


