Return-Path: <linux-omap+bounces-3045-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B7A073EA
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 11:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5615A3A6F89
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 10:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ACC21764E;
	Thu,  9 Jan 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="S0kIQWv+"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB384216E37;
	Thu,  9 Jan 2025 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420194; cv=none; b=dGNbSIby84yy0gWHlcetezQb6pUMK8KyyDJ+31wJYHuK51CHyXGzEd+UE4gq41aN51rGXtEhxOkwti84EDtDagBA6gHJo8OZSXl8RLxUn6j+xfdBRarnqUKb7WEJhhkpS1eduXXNNjD0vLfc01dRxJpYu1zp7Jn4+cgkLsQXLD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420194; c=relaxed/simple;
	bh=onm4zJn7MyQ6YUGH22+as5NstLjiZZN4eKwR7lNl+To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MiwzEGrs8rdUC8i4hY3DHwsP9kzwGofyFIz+1xle0FuzQ4d0zaIVYBydF6GM3UC3oYxoGQBk9tZRvL42O/1loG7HrWADttwrZ/YbazozQa0pa6Hmqe6vCJ5MAxN8x3KTiaa09InBYyI9pnPkuHGAwKdMXRM9jwR/j+yfFU3QlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=S0kIQWv+; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6t1cVsmBCN+t39+NHF9BN+vdKzGRs+qPanQcu9WVnh0=; b=S0kIQWv+3gA19DcEf0cungI2wS
	5bewSBSx8DTrwkrfv7lzpMsp1IbDgvzL3p5kHIEbF3+qx0Eq5Gt38F50cvciCBzR/0dsQQDCwhPfL
	aSmQ4hq0c0xYpaXGjq7vTp1nLnaTW1nyCoTKwVY9FCaPHxCNVIOvLBSBeT/ePFMbq6dic+eXtiJ1O
	2VDqfW5R+EzotgEW/YoJGOe9WUXFfUYQEmDvWeh+MoSPcWYuHg4SXe46YHx8prxFJFcxxpXolO7KD
	nQlqnChmyTJBV0Dpw8kT7N0/UVTiwDoPOzr2J37MCljpnf996yWportlAGOb2veILg17L8CjK1yBT
	3MD86HiQ==;
Received: from [122.175.9.182] (port=16507 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tVqDB-0006Xj-1X;
	Thu, 09 Jan 2025 16:26:25 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [RFC PATCH 00/10] PRU-ICSSM Ethernet Driver
Date: Thu,  9 Jan 2025 16:25:50 +0530
Message-Id: <20250109105600.41297-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
Megabit ICSS (ICSSM).

Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
fundamental components/drivers such as PRUSS driver, Remoteproc driver,
PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
Linux kernel. The current RFC patch series builds on top of these components
and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
the TI AM57xx devices.


TI AM57xx series of devices have two identical PRU-ICSS instances (PRU-ICSS1
and PRU-ICSS2), each with two 32-bit RISC PRU cores. Each PRU core has
(a) dedicated Ethernet interface (MII, MDIO), timers, capture modules, and
serial communication interfaces, and (b) dedicated data and instruction RAM as
well as shared RAM for inter PRU communication within the PRU-ICSS.

This set of patches is a follow-up to [2]. These patches add support for the
following features::
- RX and TX over PRU Ethernet ports in Dual-EMAC mode
- VLAN Filtering
- Multicast Filtering
- Promiscuous mode
- Storm prevention  
- Interrupt coalescing
- Linux PTP (ptp4l) Ordinary clock

Further, note that these are the first set of patches for PRU-ICSS2 Ethernet.
Switch mode support, PRU-ICSS1 support, PRU Ethernet for AM437x and AM335x in
Dual-EMAC and Switch mode support with full feature set changes will be posted
subsequently.

These changes are validated on top of Linux next kernel by reverting a recent
commit [3]. This commit is breaking the Ethernet functionality on TI AM57xx
due to zero block size allocation in SRAM during initialization. We are
following up on commit [3] in a separate thread to find a resolution.

The patches presented in this series have gone through the patch verification
tools and no warnings or errors are reported. Sample test logs verifying the
functionality on Linux next kernel are available here:


[Interface up Testing](https://gist.github.com/basharath-cit/d845969ab300e9fbd327b09498b27790)

[Ping Testing](https://gist.github.com/basharath-cit/12391ea30bb75b02cc7cfb7bc4678b01)

[Iperf Testing](https://gist.github.com/basharath-cit/b27095917fef2fc6b437ada9f4262042)

[1] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/
[2] https://lore.kernel.org/all/20241223135550.6898-1-basharath@couthit.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.13-rc5&id=1a52a094c2f0821860d9ce15fffe01103a146f1f


Thanks & Best Regards,
Basharath

Murali Karicheri (1):
  net: ti: prueth: Adds support for RX interrupt coalescing/pacing

Parvathi Pudi (1):
  dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode
    support on PRU-ICSS2 for AM57xx SOCs

Roger Quadros (8):
  net: ti: prueth: Adds ICSSM Ethernet driver
  net: ti: prueth: Adds PRUETH HW and SW configuration
  net: ti: prueth: Adds link detection, RX and TX support.
  net: ti: prueth: Adds ethtool support for ICSSM PRUETH Driver
  net: ti: prueth: Adds HW timestamping support for PTP using PRU-ICSS
    IEP module
  net: ti: prueth: Adds support for network filters for traffic control
    supported by PRU-ICSS
  net: ti: prueth: Adds power management support for PRU-ICSS
  arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP
    modules of PRU-ICSS2 Instance.

 .../devicetree/bindings/net/ti,icss-iep.yaml  |    6 +
 .../bindings/net/ti,icssm-prueth.yaml         |  153 ++
 .../bindings/net/ti,pruss-ecap.yaml           |   32 +
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |    9 +
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     |   11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |    8 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      |   10 +-
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      |   10 +-
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   |   63 +
 drivers/net/ethernet/ti/Kconfig               |   24 +
 drivers/net/ethernet/ti/Makefile              |    5 +
 drivers/net/ethernet/ti/icssg/icss_iep.c      |   42 +
 drivers/net/ethernet/ti/icssg/icssg_mii_rt.h  |    6 +
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  306 +++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 2421 +++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  424 +++
 .../net/ethernet/ti/icssm/icssm_prueth_dos.c  |  225 ++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.c |  312 +++
 .../net/ethernet/ti/icssm/icssm_prueth_ecap.h |   47 +
 .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |   85 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  285 ++
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 +
 22 files changed, 4595 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_ethtool.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ecap.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ecap.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switch.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

-- 
2.34.1


