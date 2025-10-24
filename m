Return-Path: <linux-omap+bounces-4755-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7293C081A0
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 235494F229E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478E02FABF7;
	Fri, 24 Oct 2025 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrcstpGC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB91993B9;
	Fri, 24 Oct 2025 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338773; cv=none; b=MZ5rbkuK4Fe3I8vAD8dkstQ+wCeQNi0nu7KuFoas2FRNj6WrcNFX1cVREMzPHckPUyJlVQpqbMSJFjxT6p6NBW88C2/aTrdVjVpqD2Vwo3ynirwOXJBHWst72+t7dIjYkbJaXRiLxwKmdd/h28UnPy3BPAJywBiQy626ISOd7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338773; c=relaxed/simple;
	bh=1cEn5EkVxOeFdajbMeWOdHmfRz8KZQgSrkq69UCUNas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICkE+bVbWCqe8/ka32WIwzOBJLGS2wrup3+BLUcNnVcFklHCxVxGoryRWk8qKI1/uQRkjdTcdkWtGSh0K9SF3FtuxNbtmcKRnu+WKuuxcuQu9RUyga8wzJL/zzkhQhOWmoneCzJAZENSRkFdDRhQmfsClYxH5hFl1R5ahUwglAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrcstpGC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6506BC4CEF1;
	Fri, 24 Oct 2025 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338770;
	bh=1cEn5EkVxOeFdajbMeWOdHmfRz8KZQgSrkq69UCUNas=;
	h=From:Subject:Date:To:Cc:From;
	b=VrcstpGCn7t7z1hRFlY/VtyXDcEY53f1IViTEyzAUEXPCz8/cLr+iuE5fI5qhiMx1
	 tRRquxMkACMH07c1LE4+SQkLTG65W9j7M4MTqD1RF/IS6jG+GmFG1LuLhOSfuYYjzQ
	 qMcqVnCoWUmvOhUEooYtpFiMerDuT5yJgKoFhQ4BJjOhlG8h/kZy7X987waWvF12Gj
	 RSsVrP82+aAuo+Uh2Eob5+hp8qf2Tp02qF6smR3P4yQlcuhPlR1iynVJ/zvtYHzNPe
	 OgTZgHAfR7p/7aV4Em8B81iR1+bSG1Sc9MdRo8J/k4+xIr0yhEc75kxvvE3uVYk58C
	 5v2mOfQnJ4T8A==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v5 0/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Date: Fri, 24 Oct 2025 23:45:59 +0300
Message-Id: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfl+2gC/23OPQ7CMAwF4KugzBjlH8LEPRBD2rgQAWmVVKEI9
 e6EMgCi45OfP/tBEkaPiWwXDxIx++TbUIJaLkh9suGI4F3JhFOuqKAK7FUrqLt0gzhAfbEpgda
 aUt3YyjhHymIXsfHDhO5JwB4CDj05lMnJp76N9+laZtP8DTMzB2cGFHjVOHR0LQ3F3RljwMuqj
 cfJy/xjqPnnMi+GEsqgLS0m5Z8hvgwmZg1RDGm4M5arja70nyG/DTlryNcfpeE2jBku2Y8xjuM
 TfeBMkIsBAAA=
X-Change-ID: 20250305-am65-cpsw-rx-class-666006fab9dd
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=1cEn5EkVxOeFdajbMeWOdHmfRz8KZQgSrkq69UCUNas=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WO6M6iNT1vg8GhZe2FZhg2zWPav+1exf+zQ
 OjdzleXH6KJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k4eaD/4lXG/w6ZJlltsISC9fckqhI2RrWKnFAptLxwC+5I9mJNAeG4ZHHZ+mwMZB34kx5W76hdD
 SYr4Q68uRvVuAFEVSyH5E/sIIBcRIj6bPclFFv6H4P0HTLPU5rKM3p/j16Gb1exAOvwW6qVnmn2
 7Rgawsr9iXoxISKfyNSVzKHO8kBlgkMEKGkb47RDHKjLQxmQHB2MdO+qXgOFU/CDvLIXdz2/CBQ
 GdutsrKGFfv4FYuMoTpUVyuBMEweL8QWCElBzfX042YYbyIn6ByKkb2GE3ZJoq01Rg/+Ft4Vd+W
 4SCFyRyQ2gF5aUJ+JBH1RH9KqCnoHmM1hHuLF6bLO45iX5xPxBteTUNNALgA5E3WvYn0gGtvXmO
 OxkHF74U3vA+bubNc40jaqdN/BvAnal7mB4Re0MYyxquhdBiH5k0GxbfabXmK+vhYLER93OiLcw
 84J1TgimXLV2lBrhj1dXCJmix/emz9W4oiYAjSI9tZeIKLHGg2aLoKxriRyBmwp/HoIM6/kY6tJ
 5HCgeyHcR6wyFbsKS95Yk3Q0PTE4eg26dLqGqGHJBBBrL1ZGE/4dE61/s/HnGFUIcNIqiXLg3/O
 tPJsIRr7J8lqoDSYacFrYPZdh5BezxQg2mQtFodwROyN7FUd0pjVu46UggqbXgRCSuBlRTtNe3C
 mMyjgL2AOGMW57w==
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
ip link set end1 down
ip link set end0 down
ethtool -L end0 rx 8

1) Ether source address test
	ethtool -N end0 flow-type ether src xx:yy:zz:aa:bb:cc action 5

  Traffic from that address should route to channel 5

2) Ether destination address test
	ethtool -N eth0 flow-type ether dst yy:zz:aa:bb:cc:dd action 4

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
Changes in v5:
- support RX_CLS_LOC_SPECIAL by plumbing our own logic of offering free classifier entires
  for rules when rule location is not specified by user.
- Updated commit log message for remove cpsw_ale_classifier_setup_default() on how
  traffic will behave by default.
- Link to v4: https://lore.kernel.org/r/20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org

Changes in v4:
- Added missing mutex_unlock in error case in am65_cpsw_rxnfc_add_rule()
- Stop using devm_ variant for kalloc/kfree for rxnfc rules as we explictly
  manage freeing.
- Dropped unnecessary print message in am65_cpsw_set_rxnfc()
- Link to v3: https://lore.kernel.org/r/20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org

Changes in v3:
- Fixed bug in cpsw_ale_policer_save/restore(). '* 4' is not needed for
  a u32 pointer.
- Fixed reverse Christmas tree order
- Moved mutex acquiring out of am65_cpsw_policer_find_match() and
  at beginning of am65_cpsw_rxnfc_add_rule()
- Link to v2: https://lore.kernel.org/r/20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org

Changes in v2:
- Error out if VLAN_ID > 0 as VLAN ID based flow routing still doesn't
   seem to work. Drop commented out code.
- Limit lines to 80 characters whereever possible.
- Change struct am65_cpsw_rxnfc_rule.location from int to unsigned int.
- Add information about order of rules evaluation and multiple matches
   in commit log.
- Link to v1: https://lore.kernel.org/r/20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org

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

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 395 ++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  32 ++-
 drivers/net/ethernet/ti/am65-cpsw-nuss.h      |  17 ++
 drivers/net/ethernet/ti/am65-cpsw-switchdev.c |   6 +-
 drivers/net/ethernet/ti/cpsw.c                |   4 +-
 drivers/net/ethernet/ti/cpsw_ale.c            | 214 +++++++++-----
 drivers/net/ethernet/ti/cpsw_ale.h            |  37 ++-
 drivers/net/ethernet/ti/cpsw_new.c            |   4 +-
 drivers/net/ethernet/ti/cpsw_switchdev.c      |   6 +-
 9 files changed, 622 insertions(+), 93 deletions(-)
---
base-commit: d1d7998df9d7d3ee20bcfc876065fa897b11506d
change-id: 20250305-am65-cpsw-rx-class-666006fab9dd

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


