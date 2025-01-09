Return-Path: <linux-omap+bounces-3064-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772EA07FBD
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 19:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14853188ACD6
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 18:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B85199238;
	Thu,  9 Jan 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valla.it header.i=@valla.it header.b="fNb80v/0"
X-Original-To: linux-omap@vger.kernel.org
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467218C92F
	for <linux-omap@vger.kernel.org>; Thu,  9 Jan 2025 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447010; cv=pass; b=Rj5aGvBqX6lMpDBy1i1pK768YwUFjqlxk7swn9zetcx0XIsocW7gn6nTqRGW3FvffCYQarf256b8qQmHnPuXx1OhBAhTaQ0bc7Jw7iMSJQSws9Zb1+SXy/5kZh+i0yvGqdWYkYx5t51+Xfqlf7r3sFOfub/v00vEQNe6rVtI/1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447010; c=relaxed/simple;
	bh=JujTlisisTKj/lB3FvEubvMqpUIrnRDxA2GT8c2/36I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=theD1akWhXY3REr971ArAckjZY8/rLn5bWPo53JCcBll15PQMG6aUmf+NJyqivca9B/4yErGUqH49EUhNy33y8QluiUVGyLlwHbP7y2FtPNaYRvRrn5sRAl4y2S7bv9tVfQC+NCDkwdqnXmNL3UabZKTb4P6oLod3Qd5/HlUo+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=fNb80v/0; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; s=arckey; t=1736447008;
	 b=ketfwJqYUtv9JbXhCwWGFqcrKCRGt1jfzbWkvZHe8GN9pINVuYlmfRzVGAUEJbGGjiP8xuYFIf
	  E3JJWW/ybMRRmxgpDgjXlgtVV+bdoeRcwbqWiMDHyCRLsqW+YKv968eIwEgER8aLU9VcL7hlnT
	  KsIwOpbI0mF+5SYxF3z0JXhuvXyA95vMGfpK8e3ymVlgFo5aK4OmVw4rVybRJtydcsIaY8nW3x
	  1uVhKy/HrciX99wps/sQjR2X1meyvTAg6iqfj7q3cqG/igitNDTfbNATxKVChfFVqfQmNmEp6n
	  XfJS7bGXroj2+zQ1++P2Uz5dgLCUTVY3Cq67Ua1fVrewGw==;
ARC-Authentication-Results: i=1; instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; s=arckey; t=1736447008;
	bh=JujTlisisTKj/lB3FvEubvMqpUIrnRDxA2GT8c2/36I=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature;
	b=dP9r9L56dbQ9tMeJtGgh28ss/p07pven3kPDvz6g8WreAScgzvjU8EiHF56SuRlKFnevo+lKw5
	  37kCxjfd32UfskEfCI+Djwl/DegHcRvcOIOSFIXOu9+DYlyPdNCXPfbAyBeBlnOU6M0eo/R5uP
	  /qF31L8eSohNOo29I0DafZo3EkzsdyxEAUvU2PuACjzuJRTr20ZOViz396waYOAPkY2Mb67m6Q
	  Cs8Lv0xodau14Snij354hSw7pv6EmACbDchkPj2BV8Z3zOUgphRtVfKGvJAZGpzlMjG8NnW4PT
	  A3jtQZ/BLO6K7xy1JJl+Ss1yLebAq+3Yf2NWrP7kHvrXkg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-75c7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVwiX-00000003szy-17A2
	for linux-omap@vger.kernel.org;
	Thu, 09 Jan 2025 17:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wWu0+tM+DklUyr688J1cGKUK2jvQy1icRidsJVjMMsQ=; b=fNb80v/07B5aJK0R1fnlwPlkfL
	FN67hDGL/yRbZajmZ/gEMwiZT+ObPRX7ix5L+1G2USW+ygPe2arT4mIbYlvnoItdTwwdFkFKfquHV
	nc5LwonHoSwwW9BCf66l2AwRKINIdZ8Kw/+WThim1Ce7gfFYkuqnPhit08vIfBR1Q+Ok=;
Received: from [87.11.41.26] (port=62454 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVwiJ-00000000G9C-3HFB;
	Thu, 09 Jan 2025 17:52:59 +0000
From: Francesco Valla <francesco@valla.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
Date: Thu,  9 Jan 2025 18:52:12 +0100
Message-ID: <20250109175211.113945-2-francesco@valla.it>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0a575a9f272d99902191e47c5241aea8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-75c7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The ti-sysc driver implements a probe deferral logic to be sure to probe
the parent interconnects before their children, postponing the probe of
interconnects not marked as "early" instances until one of these is
found.

Since the driver is alse used for the wkup_uart0 block found on the AM62
SoC, but not for other devices on the same platform, this logic forces
the probe for it to be artificially deferred 10 times and can lead to
the device not being probed at all. The missed probe was seen on a
BeaglePlay with the kernel configuration stripped to bare minimum and
no module support.

Add the ranges for wkup_uart0 to the list of "early" interconnect
instances, forcing the driver to skip the defer logic entirely for this
device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index f67b927ae4ca..917b7168fbd0 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
 	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
 	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
 	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
+	/* am62 wkup_uart0 */
+	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
 };
 
 static atomic_t sysc_defer = ATOMIC_INIT(10);
-- 
2.47.1


