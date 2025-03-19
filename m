Return-Path: <linux-omap+bounces-3458-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143EA68DF6
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75122170A54
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383E82571B2;
	Wed, 19 Mar 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEYeT+qc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B95212B02;
	Wed, 19 Mar 2025 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391670; cv=none; b=rMdLo0XkdwW5qA4vsT2bDyhU8pAJYSOOXOq+LTXmfCNwWjofbFHeUedU2xM6LCoV8IdcIrNJMKWYUlAk66asSd/zOmzKswDuim5o1hb/W0OeUJ6JEwlLxyq6+Gawi+RI5d+Uv9/YRGDkglhScQaiA41iRcPhNA/DN0S+HbB32uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391670; c=relaxed/simple;
	bh=cnlVr9ebe/wVCwlbNuUwa26VuO6b4XUGv9lN+d+DHtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RG8KTzAhGOTpLA2lkxYU778yj3mbx4CvXrnV+GMAYZ+5ZnieLlW/7e+l8+BnyIV4DqI5jTMDK+K64bcvcn9Dsj3uQyroColeNX3J/xfn9fXPLYQID555Cna5spswH9df9HS9vMXR8isYpbQ+x8y3iiN0YVED2OU5OZGE/HALzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEYeT+qc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E237C4CEE9;
	Wed, 19 Mar 2025 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391670;
	bh=cnlVr9ebe/wVCwlbNuUwa26VuO6b4XUGv9lN+d+DHtY=;
	h=From:Subject:Date:To:Cc:From;
	b=eEYeT+qcfd4uvezcRWIjLe+o9miRa24DnCspF5gb0r9Nis+WxpC1eQUTRNjdKGIzJ
	 LdpnOPB1UGc/1szYyYgGSLLflN8zGB0ytY5XyLoc9hsGFKhlJx5dzAuPGRirDGtjK4
	 Uo67Vb29HxS7tmxYncjGDc8CLpNdMRKayoZIh0IOKnf20zBPmzwtlE+WujHjuFZIS+
	 HatGyMshr/T6Yjvgoi1vEXtwfLn1eq12e3YpvEmyt5XIbmob78EZhOqE0q64cjehkD
	 3T1CH1u9ku0xtqd0Hxw1UUf4VE3tos/FVQPkbLoQQRDY0s/JL9xZQbrl6cLJsPpjjo
	 JQmaCCAC+vAiw==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next 0/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Date: Wed, 19 Mar 2025 15:38:26 +0200
Message-Id: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTI2mcC/x3MwQqDMAyA4VeRnBfIlAbcq4wdujZqQDtpxBXEd
 7d4/A7/f4BJVjF4NQdk2dX0lyqejwbC5NMoqLEaWmoddeTQL+wwrPbHXDDM3gyZmYgH/+1jhBq
 uWQYt9/QNSTZMUjb4nOcF84ja624AAAA=
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=cnlVr9ebe/wVCwlbNuUwa26VuO6b4XUGv9lN+d+DHtY=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slvwVxmRCQ3frCx1k2HBzsf4mqIzoYZp8KWX
 3mcTHmr9lqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJbwAKCRDSWmvTvnYw
 kwp/D/9IG17RvJG56TYva7/akiHCu6fxevUOlzC7AdyLuq91ev6Np4by+dGe0Durm3XoVpuI+lK
 KQE99ChNiltKbd6kXffFBclipZSZ8eh2hrMrqS5saxlEY5uCU2MWI5MLcuEP/eHWIU3fhqgQxuy
 2+DcjzWuxEsDWXFf41aPYwkwzMR+vZ/hYR8/x0+UtaPeI6iSrEjkLIjmi8XMX+2iSgCZAkwTpqw
 MhZFo2vQlnDNAfJSi5qvfRVBkdWFb2KiT3yn+SPbiLd0HANy0yO6EIjfQ8+nrtVWJctPvlIVALn
 VJOZQ0HZFBUuYxDZ3Qba6gwcVETIhUjqsHkN7qUAu5E6lLSCAby4nol81ANaG4hLhmGun2jPWTF
 IfbhdLbG7FgqBkss4+bp6PWhd2XXul4oj4YAf0wcWbhv+Mn9u7Q1+zPhlBHqgo5wAQBKN9YKiAw
 m2gxfwWiozlW7ppeVxh9RmsgzltJON2zQqtn6A4yCAEwjiPG5ri0doe0GwnUzGIfyO5cR1RpAwd
 1DJPNzRXxMHMQ3i6JqvUH/4Mjlwk713IJNdCU+XG1a+u04BBSG9v95I1uVb6WUIVdci8hbUqilg
 zPGf5U3Iz2FLHLTDUvp9iQlpaXVT+Ye6muq5s6wiM0FD4Qx+emsjTHEzxLv7YIWP6hrv+HMONkG
 +kccwIyZ7NGZYEQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Adds support for -N/--config-nfc ethtool command for
configuring RX classfiers.

Currently only raw Ethernet (flow-type ether) matching is added
based on source/destination addresses and VLAN Priority (PCP).

The ALE policer engine is used to perform the matching and routing to
a specific RX channel.

Test cases:

Increase number of RX channels to 8
ip link set eth1 down
ip link set eth0 down
ethtool -L eth0 rx 8

1) Ether source address test
	ethtool -N eth0 flow-type ether src xx:yy:zz:aa:bb:cc action 5

  Traffic from that address should route to channel 5

2) Ether destination address test
	ethtool -N eth0 flow-type ether src yy:zz:aa:bb:cc:dd action 4

  Traffic to that address should route to channel 4

3) Drop test
	ethtool -N end0 flow-type ether src xx:yy:zz:aa:bb:cc action -1

  Traffic from that address should be dropped

4) VLAN PCP test

on Remote create VLAN with ID 5 and all traffic mapping to required priority to test. e.g. 7
	sudo ip link add link eno1 name eno1.5 type vlan id 5 egress-qos-map 0:7 1:7 2:7 3:7 4:7 5:7 6:7 7:7
	sudo ifconfig eno1.5 192.168.10.1

on DUT create VLAN with id 5
	ip link add link end0 name end0.5 type vlan id 5
	ifconfig end0.5 192.168.10.5

VLAN pcp 7 vid 5 route to RX channel 6
	ethtool -N end0 flow-type ether vlan 0xe005 action 6

  Traffic from that VLAN with PCP 7 should route to channel 6

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Roger Quadros (9):
      net: ethernet: ti: cpsw_ale: Update Policer fields for more ALE size/ports
      net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_add_vlan()
      net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_vlan_add_modify()
      net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_add_ucast()
      net: ethernet: ti: cpsw_ale: add cpsw_ale_policer_reset_entry()
      net: ethernet: ti: cpsw_ale: add cpsw_ale_policer_set/clr_entry()
      net: ethernet: ti: cpsw_ale: add policer save restore for PM sleep
      net: ethernet: ti: am65-cpsw: add network flow classification support
      net: ethernet: ti: am65-cpsw: remove cpsw_ale_classifier_setup_default()

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 348 ++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  31 ++-
 drivers/net/ethernet/ti/am65-cpsw-nuss.h      |  16 ++
 drivers/net/ethernet/ti/am65-cpsw-switchdev.c |   6 +-
 drivers/net/ethernet/ti/cpsw.c                |   4 +-
 drivers/net/ethernet/ti/cpsw_ale.c            | 221 ++++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h            |  37 ++-
 drivers/net/ethernet/ti/cpsw_new.c            |   4 +-
 drivers/net/ethernet/ti/cpsw_switchdev.c      |   6 +-
 9 files changed, 580 insertions(+), 93 deletions(-)
---
base-commit: 23c9ff659140f97d44bf6fb59f89526a168f2b86
change-id: 20250305-am65-cpsw-rx-class-666006fab9dd

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


