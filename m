Return-Path: <linux-omap+bounces-4672-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A2BD317C
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 14:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A239D4EDF68
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACBF2D4B5A;
	Mon, 13 Oct 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="bko6Izia"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BB221282;
	Mon, 13 Oct 2025 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360065; cv=none; b=Yo5LdMZa2yRKoWlDw/m9CIgjOaJESAPWssVN/PkrSdNCI9KmBuAMJ6ydkvOz6BHiqtrqlA/5B1KSZyJVlciPuFzjcqdS7j9d54itfU0bF2eESwPjTPwUQZrK43GtEnCERmtv47Vkt79e+nMI19Ex+tUfVVdvNtyWxO/WSkPKFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360065; c=relaxed/simple;
	bh=L7+PxtlhY9is9LjywV0tCfdUqVR49ZUEWQMdnkVGxBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZvtKEUfHf/GgrnaCClPpWY0n/ir3aj4HPjjciFAZ14ezLPmvsRSsNPDOX9rzaJX9w+fvXR/rs3mX/GhB629Vxs9yiA9fedAuunfFieXqrdKy70n9mL8yk6zcJSMoe6uNJXRPHqH798AkRrXrCTFRO0yYfUw+25wgdVQ5Teis1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=bko6Izia; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yfm/7rIRxrdQchuqCwWdJAFp75V4e2SbGSDW6ClnPLw=; b=bko6Iziag3XBdxPNe1n7hUydwV
	zyEFJjI39w2KYt/2gNH4/YesyyN0SnzYw04NIMN79aupO9+PKhXRxLSdfR6UtdNAaEdCxoOsSACId
	zQfLRxI/KxxeAi0tALO36CEQI3ehayW5Rw0sRa/8/gpNHbpOJ9nF4MtUoZnkcgQ2h9frs9RxV9nfF
	+4HKrBl1C778yVW0OjFSx2WmDSR+MHIXJ6Wi2GGgio02rZiAeEkArDfmJTzx97phTQiMlvpC4xVyc
	J8MFfxXNfLRIiDZsmSu3M5Nih10HqWbtP3lIsmKd1cHHJCopA62uxT48VU7XZszKfa8+sKl4a8LKW
	MA+k1vQQ==;
Received: from [122.175.9.182] (port=8361 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v8I46-00000004TOu-2ksu;
	Mon, 13 Oct 2025 08:54:15 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	danishanwar@ti.com,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com,
	parvathi@couthit.com
Subject: [PATCH 0/2] Add support for ICSSM Ethernet on AM57x, AM437x, and AM335x
Date: Mon, 13 Oct 2025 18:22:42 +0530
Message-ID: <20251013125401.1435486-1-parvathi@couthit.com>
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

This series adds support for ICSSM Ethernet on AM57x, AM437x and AM335x.

The AM57x and AM437x IDKs support two PRU-ICSS instances, each consisting
of two PRU cores, with each PRU-ICSS instance capable of handling two
Ethernet ports. For the AM57x platforms, the PRU-ICSS2 node has been added
to the am57xx-idk-common.dtsi, while for the AM437x platform, the PRU-ICSS1
node has been added to the am437x-idk-evm.dts.

The AM335x ICE features a single PRU-ICSS instance. A new device tree source
file, am335x-icev2-prueth.dts, has been introduced to define the PRU-ICSS node
for the AM335x platform.

This series is based on the latest next-20251010 linux-next.

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


