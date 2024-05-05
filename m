Return-Path: <linux-omap+bounces-1338-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485258BC3A9
	for <lists+linux-omap@lfdr.de>; Sun,  5 May 2024 22:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C861C21623
	for <lists+linux-omap@lfdr.de>; Sun,  5 May 2024 20:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210E47317C;
	Sun,  5 May 2024 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="BOR8eryV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EF6EB51;
	Sun,  5 May 2024 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940546; cv=none; b=gVnx4Z7pticw22i3UXSW0+BqBfytopBUc9Z56D+30x5Bzsks7VoEvK5Hhu1CkqZzSOvHUvu/beMwvhPMFhjfAdPx8i5dD1OTjyDroojFuVdWWaKD5b1bTp3ExotUdGidjeGsgbWLq6YXLu77okLfgbYybx8Nn1VfVAWox7BTzBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940546; c=relaxed/simple;
	bh=6zZ9I+/S/0oQSwQS1c/S5AJHePAHDd8FWt0x5Yj2khg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xh1W7d75F4PkyDf175iB7Dhjr/Z9H508CUQ1XAnGzjWAQeuY+5K0BXe45MBGe+ujBz6sGvE7U/2MrTXMMrBthhWv8VwcDPs+HMcdITSSIdNP8tfTGPLNwA/S0Oo+S1ApMLaCJP2Le9BRMF+VtUekngOStqjpBB81GwYkJiDh838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=BOR8eryV; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0+NrnlGanpbDKBTcFpa/hRcO7lljTU+Kq8oaCV7xyAE=; b=BOR8eryVU1GPNyyM
	GtH9Pb6owDZyBjngs3juuRmWnjOgkB7HgNLrmj85StCsiy3PoV+rIjjYblhUGpz+zFRkjUSGCE5PW
	Pe2Hq26K3gDUMd/s2upf/1iRPBbBej7lbMwh4eFaSV9MJSdZJQDfFMBGLo6Iu5dFA5SLlo0soSn+S
	Jc3/NRnGIP3bPk6TQsbQLTAPWrLBwEzPhhhc9Kthfy6gxmdS0/HtATuHbmeMgtZsAUa5OZHptE8UQ
	QxrO7R0/zoHEWI3r8Lgtrcs9Qcxo4c+l/cK9bponnF5/6OflwhpJU1uRGAcvXSW8wx6dkbao6cnj5
	Y8zwnaupKskvwVEGsg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1s3iNI-004oPt-0X;
	Sun, 05 May 2024 20:22:20 +0000
From: linux@treblig.org
To: aaro.koskinen@iki.fi
Cc: tony@atomide.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ARM: omap1: Remove unused struct 'dma_link_info'
Date: Sun,  5 May 2024 21:22:14 +0100
Message-ID: <20240505202214.623612-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

I think the last use of this was removed somewhere
around the two:
Commit 755cbfd8cf89 ("ARM: OMAP2+: Drop sdma interrupt handling for
mach-omap2")
and
Commit 16630718ee46 ("ARM: omap1: move plat/dma.c to mach/omap-dma.c")

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/arm/mach-omap1/omap-dma.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
index 9ee472f8ead12..f091f78631d09 100644
--- a/arch/arm/mach-omap1/omap-dma.c
+++ b/arch/arm/mach-omap1/omap-dma.c
@@ -59,19 +59,6 @@ static struct omap_dma_dev_attr *d;
 static int enable_1510_mode;
 static u32 errata;
 
-struct dma_link_info {
-	int *linked_dmach_q;
-	int no_of_lchs_linked;
-
-	int q_count;
-	int q_tail;
-	int q_head;
-
-	int chain_state;
-	int chain_mode;
-
-};
-
 static int dma_lch_count;
 static int dma_chan_count;
 static int omap_dma_reserve_channels;
-- 
2.45.0


