Return-Path: <linux-omap+bounces-3712-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869FAB6AE8
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A050B1B60F96
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1DB276026;
	Wed, 14 May 2025 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4yO1BKu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3E1E9907;
	Wed, 14 May 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224269; cv=none; b=pi0ulaBgOiHCTCENWRTz5YibKBIVVVrgkDv3ubXCSz9pTMu32kHk6rB+UT8tdAZJNePlHjSa3Nws/qHHBaiQi7B44FNDU9XlMeh48hBBy8nGfJwEPLdybkZ1lT29o73NljocUZcCX+lCVK1AU+Juxet6XDMmjfv/88vMM6NnoPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224269; c=relaxed/simple;
	bh=IMI7XcBNITOA6tp+zs2mDyyCvnd3trWYsfe+j2E5QPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GACgkujQ/i1QAXg4UnJ5mdEHEJ4e/1ix9ty+4Kao803nsIjkhEdyyq+CwGJvOcYPy/4oUKx14ilzD4II/EhMxxq3NjJZvNfo2rnjOnHpNRLn0PhTaDs/+cta9XtWZ60xf2reBLsF0ccDFsmzcuGXQIiVGtlFPWk1jGGn2HVhSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4yO1BKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51C2C4CEE9;
	Wed, 14 May 2025 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224268;
	bh=IMI7XcBNITOA6tp+zs2mDyyCvnd3trWYsfe+j2E5QPY=;
	h=From:Subject:Date:To:Cc:From;
	b=g4yO1BKuM5qBSOrzA8F1UhmZlKtYDVLGrAtBoF3DyA1b3PjtIbss9aUPZyadYZ4aj
	 NshnDXsUqJ1Q7UOSGgNNfoS99vz8lm0VArTfwlCvvsKmaR4CV8LeJ36m2BWg01lazT
	 ViRp6q7kbQqEfgTtOpyDe4rzDDFwOhkz6ec4zTjJ1ck+8dGkXWpYgj2b0Im6peK43/
	 rV1wSMHGo7sE+Nod5JzPD2lUNnMX0aQHcS65LfNl3ZN7VsbqCzCF8++sadFkUiXZpK
	 G6zM06xEWo1UDxYSJOkFmSX50r8OjZz1hRI8po3rwcUiZHjAE+LGjBznDMliQIjLnS
	 AuRsP5DEbkw4g==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v4 0/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Date: Wed, 14 May 2025 15:04:20 +0300
Message-Id: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSGJGgC/23OPQ7CMAwF4KugzBjlH8LEPRBD2rhtBKQoqUIR6
 t2JygCIjk/P/uwnSRg9JrJfPUnE7JPvQwlyvSJ1Z0OL4F3JhFOuqKAK7FUrqG/pDnGE+mJTAq0
 1pbqxlXGOlMVbxMaPM3okAQcIOA7kVJrOp6GPj/laZnP/hplZgjMDCrxqHDq6lYbi4Ywx4GXTx
 3b2Mv8Yavm5zIuhhDJoyxST8s8QXwYTi4YohjTcGcvVTlf6x5im6QV0HJKuRwEAAA==
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4111; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=IMI7XcBNITOA6tp+zs2mDyyCvnd3trWYsfe+j2E5QPY=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbIVVJV5+hMkMLdXJBRlKzjIGnWEyz1Bgkhg
 iCM+cQn6MeJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyAAKCRDSWmvTvnYw
 k+wSD/9Q5fJls00EfnOZlCTXUxdmbkUrHMZOSIrPm+E1jmNtJF9VLozdqshYCXRUsZs3JxavvdP
 LLwIZ1fw+w6jUPWUeSvHjDIa/znGAcgyltdfOukJA1eF7GpRwZAgmlXxG7Ne8b/0XkRQZ5UeYCJ
 Mm1PAcd866ZQKzRa+FBUIKjezTI89F+VWxlhP1AO2IETXsUoJl3mD9yNkUTEIUGZFxAPtaVTVd3
 nYZdmk9sWDtiZ/zaZxmIW8fa96z5LmSklWfiEM8LcqVJsqeDyFUFI0R02Tf9KbZEv3Wyxna1rH9
 qDUCC80SQUZrw0NsQeS2J4XmHvEx3YO9au3SOi09W1sd081quyKryucqXISrx8cL8+qWrIarnoD
 tSXyAnj8rc6gKAcbUyfurYZL5dSqepx+Ip9/mynMm9dT7rVBZdGwTIUaY9K9vywp4XKRw4E2PBb
 P9JCJTr8bMXiQPmK1+Y2GrRryyiuR54Mn3XEDijaAl/bGO8Vru5n9yCJBAHFEm6R4C5xb0gzO7q
 Wn1qr1u5hdGKbybsL8mMayO5JCJ3NmCqIkUjKx3DPr7NRQxJCAYSj+w0NEZt6+Clzs7Ls1SiG9/
 IytMope/cIAWIgqA7Rj3yTqWS511s4Y9IhvlPujO0PmPNzQpZsUpgr8H0zx5fQWX2nYiE1rURI1
 aps0BSJbw7Trv8Q==
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

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 357 ++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  32 ++-
 drivers/net/ethernet/ti/am65-cpsw-nuss.h      |  16 ++
 drivers/net/ethernet/ti/am65-cpsw-switchdev.c |   6 +-
 drivers/net/ethernet/ti/cpsw.c                |   4 +-
 drivers/net/ethernet/ti/cpsw_ale.c            | 214 +++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h            |  37 ++-
 drivers/net/ethernet/ti/cpsw_new.c            |   4 +-
 drivers/net/ethernet/ti/cpsw_switchdev.c      |   6 +-
 9 files changed, 583 insertions(+), 93 deletions(-)
---
base-commit: 9f607dc39b6658ba8ea647bd99725e68c66071b7
change-id: 20250305-am65-cpsw-rx-class-666006fab9dd

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


