Return-Path: <linux-omap+bounces-4914-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74CC572B7
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 12:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC663AA4AB
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 11:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E7C33B943;
	Thu, 13 Nov 2025 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="lule7x3c"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35632D5C6C;
	Thu, 13 Nov 2025 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763032879; cv=none; b=Edqnq74hyEISfnQf5Eivit3z4+eAjf2amgvW+sxVTXGST7oOssCt3f0J7bhemQA9uaoxYNxxGMNCMpJo0AVFhAgEk6/ISdKPdF8F6ZRF91U+XztVgIzOgQgmnT8SMuOMHV1awvczfcq9R+I3xbTbTe/4O0dfBl7e5aNHiZsjPXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763032879; c=relaxed/simple;
	bh=8CHqPv7wXWbkwcfY8JwF/tXEnpUTJdKgfHsxA2V8yvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+5oUR6inrcJsXL6TizNMgtPkXHy3etLyXWk8HRfi0f2whiw7T5vN23GhIEswSAU1kPA5F7YrdFX4l4no3i6JR0xSdW5eOwhWwOZtJaWg9Fk2bNQStb7eZ5ctYvHxyBKaUnpa09bxJdwQA06eqHRFoMM9DKNRg6jigv9D71Rj9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=lule7x3c; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=byDR1fe+RkZbydORahZWwZfPNqQzlEtpY91gu23avaI=; b=lule7x3colzf8Odh4dD0x9UGHv
	z97LhXsxKEAAzbAH2RETlW3PakkbDniWny6bAs5HkJKq6Lw7V5pSxp+3Yen4Q4J3sSmtVCwoGxwpm
	B5xX4ZealQMuNNDh85q3vXNkOB1UeZZkhlWSPjXHGBAV9XQxT0CyrFFKrHHTAGdnk9SLvxCWObbNK
	M6cAuskheyMtRKCmaFL6ORtckmVPnC1x/vKRzmu1Z8J6qzcp6x+kB0aTMhTyQ2kKXF1qGFrpB152/
	sZLpLLbUXFP3lT1EhHHNW1oFWhjhVkxrHKai5t1y3ZKkgu+0ppkyxepW/OXOieID5d8oHpgO4+tVa
	Y+lfAm1w==;
Received: from [122.175.9.182] (port=53373 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vJVO7-0000000Geg5-0y02;
	Thu, 13 Nov 2025 06:21:15 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	afd@ti.com,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com
Cc: andrew@lunn.ch,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
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
Subject: [PATCH v3 0/2] Add support for ICSSM Ethernet on AM57x, AM437x, and AM335x
Date: Thu, 13 Nov 2025 16:46:01 +0530
Message-ID: <20251113112049.676806-1-parvathi@couthit.com>
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

The AM335x ICE features a single PRU-ICSS instance. A new device tree overlay
source file, am335x-icev2-prueth-overlay.dtso, has been introduced to define the
PRU-ICSS node for the AM335x platform.

This is v3 of the patch series [v1]. It addresses comments made on [v2].
This series is based on the latest next-20251113 linux-next.

Changes from v2 to v3 :

*) Addressed Andrew Davis's comment by placing PRUETH nodes in a new overlay file
am335x-icev2-prueth-overlay.dtso.
*) Rebased the series on latest linux-next.

Changes from v1 to v2 :

*) Addressed Andrew Lunn's comment on patch 1 of the series.
*) Addressed MD Danish Anwar comment on patch 1 of the series.
*) Rebased the series on latest linux-next.

[v1] https://lore.kernel.org/all/20251013125401.1435486-1-parvathi@couthit.com/
[v2] https://lore.kernel.org/all/20251103124820.1679167-1-parvathi@couthit.com/

Thanks and Regards,
Parvathi.

Roger Quadros (2):
  arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP
    modules of PRU-ICSS2 Instance.
  arm: dts: ti: Adds support for AM335x and AM437x

 arch/arm/boot/dts/ti/omap/Makefile            |   5 +
 .../ti/omap/am335x-icev2-prueth-overlay.dtso  | 190 ++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
 arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++++++++++-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     |  11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |   8 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      |  10 +-
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      |  10 +-
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   |  61 ++++++
 10 files changed, 444 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso

-- 
2.43.0


