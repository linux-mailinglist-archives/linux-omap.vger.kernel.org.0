Return-Path: <linux-omap+bounces-3700-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FCAB5461
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D58227AD61E
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B4528DB4D;
	Tue, 13 May 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quYHpJec"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDF1C84A0;
	Tue, 13 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138393; cv=none; b=GY/lvEVIy3Sk8csYECIq+LPLeue+oeN0ACOmA5v7JxuMwO742xH3ZsAVKX3Gp5bCeb3qIa9qAjc9DfzSXom9+/Mr2D4gOKZqsFoU3QB9zkBH/Zh27gboSY/pZxSjk4iFwIEd1VahctHZiBBjTqsWknxbKfLU9Xt2eVqAZ1NnnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138393; c=relaxed/simple;
	bh=WwRX2OejuzC52IouwPlF8ikN471u8m0tJYL5AHiFFZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dsYoqm9DoX/eJnKcK+/TQHROnG7CLHClqo4gYZWFaANS7dK0KCY8RE0ZHaAvC+KNEkEw0poTSxLybO2GBrOr8lkxuaxZzRqsb9y1rA7iWjVqKDaBwzO0NWYyfFIO33+4aruD3fIz47velCeBUSXAayvw8EppNK3e8ayhvqdmdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quYHpJec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E34C4CEE4;
	Tue, 13 May 2025 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138392;
	bh=WwRX2OejuzC52IouwPlF8ikN471u8m0tJYL5AHiFFZQ=;
	h=From:Subject:Date:To:Cc:From;
	b=quYHpJeceb7NAVqgllAbARouzyFJ/MJGF0S6vzsUbkQcIvXknG5uCUJpOvaJrH+At
	 usJVlmMqdwloNaUv6ZZhgxNveioXcYIWUR48M2/UxD2iV98AQE8uu6WOnnyyvEfSLd
	 IYbxbL68NubUoJsrwIvPlU8h57j5af+qIaCN863k3i+HzNwpGUJhwoToOBptaj6P9Y
	 ZM9+wzdE8RFeCd5REBFbYLnGO5l3GvRF3eyEoWrsiEK1SXqEL68N5v/WMphE2BrYFR
	 cLyPmB5Pj+saMm/hysXD85mJgP367ElO3YfEfgarW1wEfNI+glDwCcgXDpvp36qi75
	 KHIB1P1ib0TSQ==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v3 0/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Date: Tue, 13 May 2025 15:13:04 +0300
Message-Id: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFA3I2gC/23OwQ6CMAwG4FcxO1tTBpuZJ9/DeBiswCIOspGJI
 by7yzwYE45//vZrVxbIWwrscliZp2iDHV0K5fHAml67jsCalBlHLrBEAfopBTRTeIFfoBl0CCC
 lRJStrpUxLC1Onlq7ZPTGHM3gaJnZPTW9DfPo3/laLHL/hQu1B8cCEHjdGjJ4rhTS9UHe0XAaf
 Ze9yH+G2H8u8mSIUijSaaqoqj9j27YPGA7CCAMBAAA=
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=WwRX2OejuzC52IouwPlF8ikN471u8m0tJYL5AHiFFZQ=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdU0UZBtndJE4vH9lH8ZTl3FkmTYAClNI1cU
 AooF6jlH3WJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k6ZND/0eEwTieqMEnUR66/H/wsISnBo5LcMaTIcCgHaht/YVVR3sZlEm5droTVI7uglO/+5fVMI
 JNk175rhjvP9UiAa89nPr3+n1SZrJABLGcEDPPYTueHkBKzhg4RHxc1pfh4qiJVQgZyQNDaeer2
 cWnQfr1946CNQUwcKjmVHfv6gzT0wDrb4IrqsZT8hrnQv62Igc/LJWGOwivOOroKmE57/SgsIY4
 CeKUNd3kQPgF+wZXCZR5Od7pO1SY0JshJNjogMmug6mftdP22uZdelIVcPYvJIBd9sQWWxOCIpR
 pTIGx1AI4gSCbHOL9xEqg5SLktWAtKFR6qXTIhvn4QualgSqpU7ogG8lctUNZphfyvL+lbfuh6J
 Zkn2kBmAem+LXd8XR7GDf0Tt4zdswF6rb865Vg5ksALMryGFPNw9PYkI9lw5NfVRIJAHyqQIyOw
 z9XzsBfNRA4UYehmjNIullWS912GUqvE/7Z1iXIhCx61/5IVtbOCWEPkE1z5oJLPu1Un4uzYKyW
 rhhfm3kg6Ml095EbBiPJapeG46+ub9aDFE1tGeXKzonbZ344Gw+p94EMCcQEd0ENCDrrL5Bpl1x
 BXJLzOp60tFNHDpMJqOL/rMfisvg6A8gWXf0Y1kw2PqpgWHzGU5IFL6Eqwp9c07TumltC8cjUEN
 XbXadsEwhwoaJtg==
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

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 353 ++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  32 ++-
 drivers/net/ethernet/ti/am65-cpsw-nuss.h      |  16 ++
 drivers/net/ethernet/ti/am65-cpsw-switchdev.c |   6 +-
 drivers/net/ethernet/ti/cpsw.c                |   4 +-
 drivers/net/ethernet/ti/cpsw_ale.c            | 214 ++++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h            |  37 ++-
 drivers/net/ethernet/ti/cpsw_new.c            |   4 +-
 drivers/net/ethernet/ti/cpsw_switchdev.c      |   6 +-
 9 files changed, 579 insertions(+), 93 deletions(-)
---
base-commit: 9f607dc39b6658ba8ea647bd99725e68c66071b7
change-id: 20250305-am65-cpsw-rx-class-666006fab9dd

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


