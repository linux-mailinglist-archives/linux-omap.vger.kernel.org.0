Return-Path: <linux-omap+bounces-4823-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80091C2BD5D
	for <lists+linux-omap@lfdr.de>; Mon, 03 Nov 2025 13:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1A33A7E6E
	for <lists+linux-omap@lfdr.de>; Mon,  3 Nov 2025 12:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2FA308F33;
	Mon,  3 Nov 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="2tFdT9lH"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6A2D8360;
	Mon,  3 Nov 2025 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762174131; cv=none; b=Iytb0X4vytTuF9wegRsiIkRQaIeF1fQpM+YXwfP5C8OKxN7EnpUdiGoLR6Z2AyESeQQjWpPq8vC5flPE84gHsRPlAb7r22LTtSuUXxbcVfHf/1c3+zln7WKVgxHgdwIJfxEEVKLxC54+3xK3YiAoJFtfJ89avLR6wJSRdseA1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762174131; c=relaxed/simple;
	bh=IdboKY1PXrAGO4syzkQNEAjYzB+o+QEgylf92LdeBrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQf4TmDUtUAATcqBUnzY0AUNDBt6gSKuugOQ0j62ze9RhRuuqQqAsaCO1CCwjMXJWUY0uXSTKA5RonB85XBgxs41uEapgwGusYXasRgmjiOxLhfJLBM4Q26VEqrMnWgNy/XID4vnQGAolRvVJ9MWL74FWy/c8OpjhBUv3CWrRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=2tFdT9lH; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Nxcpn3Hue00ov8/8RT06Ws2hq4Ob1LXYSYCqOo+CjUY=; b=2tFdT9lHy2ok+cgcrmkWs3jB8F
	jE4Isj+ka+TpLW+yweBh8xOAqS5epzOkHAjveR/lVHYI0CzFbZanZefWzhgPgxGccIbTDx1aJPk5n
	fmvTkmnRgD9aMVq8iVwx1+ARgZxor6BBVv3EO+cxvVrFqDILmToIcB78KbREbzjc8+Uf5CBFTLxyX
	rCru5wc6S2BasR6gc62cHpdY/rgfjjKBElgAzF5OAVO5MeXtkVFWdDGZGlzWxPRtqrHTjAM58JAdI
	aMUIWPGQr/+O5Z8mBtEKV90/bQFulmJ57FH51a0wDtGUQKKL4/7HJB4hXFaqzgds6fCeKqTmWmced
	5O1Ds9cQ==;
Received: from [122.175.9.182] (port=21157 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vFtzK-00000006SBs-1h7P;
	Mon, 03 Nov 2025 07:48:46 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	danishanwar@ti.com,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com,
	parvathi@couthit.com
Subject: [PATCH v2 0/2] Add support for ICSSM Ethernet on AM57x, AM437x, and AM335x
Date: Mon,  3 Nov 2025 18:17:22 +0530
Message-ID: <20251103124820.1679167-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

This series adds support for ICSSM Ethernet on Texas Instruments AM57x,
AM437x and AM335x platforms.

The AM57x and AM437x IDKs support two PRU-ICSS instances, each consisting
of two PRU cores, with each PRU-ICSS instance capable of handling two
Ethernet ports. For the AM57x platforms, the PRU-ICSS2 node has been added
to the am57xx-idk-common.dtsi, while for the AM437x platform, the PRU-ICSS1
node has been added to the am437x-idk-evm.dts.

The AM335x ICE features a single PRU-ICSS instance. A new device tree source
file, am335x-icev2-prueth.dts, has been introduced to define the PRU-ICSS node
for the AM335x platform.

This is v2 of the patch series [v1]. It addresses comments made on [v1].
This series is based on the latest next-20251103 linux-next.

Changes from v1 to v2 :

*) Addressed Andrew Lunn's comment on patch 1 of the series.
*) Addressed MD Danish Anwar comment on patch 1 of the series.
*) Rebased the series on latest linux-next.

[v1] https://lore.kernel.org/all/20251013125401.1435486-1-parvathi@couthit.com/

Thanks and Regards,
Parvathi.

Roger Quadros (2):
  arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP
    modules of PRU-ICSS2 Instance.
  arm: dts: ti: Adds support for AM335x and AM437x

 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 .../boot/dts/ti/omap/am335x-icev2-prueth.dts  | 533 ++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
 arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     |  11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |   8 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      |  10 +-
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      |  10 +-
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   |  61 ++
 10 files changed, 783 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts

-- 
2.43.0


