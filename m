Return-Path: <linux-omap+bounces-2683-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072E9C8BEB
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 14:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD3F2857F0
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C52C17BA6;
	Thu, 14 Nov 2024 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZwywoWp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914B3FC7;
	Thu, 14 Nov 2024 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591428; cv=none; b=jkgK4bOt2E/SyUo8mlftIpgWj66smlYz5F3pGWPcuFW9S+INIIs3JdI4sFlE0D301k/Ve7+Ww5OUvEVbZB6xtFYe4QZoVg3194JvoNbXzglkvllhHeOMCrkKpSgo8W/D35s/7XKoTS5Jk1Y6XUvlqAKIQJ4wWrRradk5vEn+Qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591428; c=relaxed/simple;
	bh=Otr49HiqCIUBuYxc55Qdh4UxZrNlr0pBF0Zbv5EShtw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ntcYWE7+pwg59hMnckB9t8VYWeCzAMzAytElBl5z2vX9wZ80n+R9gmYgJHivw7cvD/nF/tJuzorbtizbdFIVN9KRZHDNpnPJ30bRqHLzlwMRxvU0BVgs/gjvxKjuQFK8R04vTdJwqF0LpOdNsz6n/Z1oUfSHds3+bEcsCO/8Ry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZwywoWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837E0C4CED4;
	Thu, 14 Nov 2024 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731591427;
	bh=Otr49HiqCIUBuYxc55Qdh4UxZrNlr0pBF0Zbv5EShtw=;
	h=From:Subject:Date:To:Cc:From;
	b=YZwywoWpA9qmQI8J/Z/HuGj5JdCDYJIPPGULaPITCmeYlvoxKSkQpS+TemifZx9ue
	 Mb7xSqq4wf7A4DL5NVu7SfXFuH7T/21qkbO/IngBvgcaKKFbR/VPlBi7WNJaqT4Ue2
	 KwJGvdffcYEGmq7JOa5bJVjoUb9NpgOnuSx+775ZOsmj1FYFE8pyg0EOAP+WJCR7Cg
	 G/UdHi9Hhli6aM4bf2jl0znYJUUhEaZ6KCAQupO//6fQuD9vPAM3aMD+M6NGOvYiEu
	 FFmJOjz0PM4W6Z1aqD21cXOj7N446FFiTSj3UXjcZS8smpnwslL0PuYo9iHALc4APy
	 tJCV1Y8UzTy1Q==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v4 0/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Date: Thu, 14 Nov 2024 15:36:51 +0200
Message-Id: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPP8NWcC/3XNzQ6CMBAE4FcxPbtm2/LTevI9jAdoF23EQlpEj
 OHdbYgHjeE4mcw3LxYpOIpsv3mxQKOLrvMpZNsNM5fKnwmcTZkJFBnnyKG6FTmYPj7gdm8HB2E
 CG00PiFgLk1VNYZGldR+ocdMiH5mnATxNAzul5uLi0IXncjnypf/o+ao+ckCQytYql1IapQ5XC
 p7aXRfOCzqKb6hch0SCNGljuRaIMv+D5Dek1yGZIG6auiy0UJnGH2ie5ze2dGCNWwEAAA==
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Guillaume Nault <gnault@redhat.com>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Otr49HiqCIUBuYxc55Qdh4UxZrNlr0pBF0Zbv5EShtw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnNfz8gMLsHnPA8JDXBA9DdypHaNiEPUf14Y7sX
 oZ5/GdZ2S6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZzX8/AAKCRDSWmvTvnYw
 kw05D/0YYivwRAa5sUpBX8N0e/skK5+1BzN/f9Lvrm2Mi1vVhg8/UQXcfR4tT9wCo61N+AIEfKB
 bDULIItecpGQlKO6cP2TNoZ4a5PY6X8AnUxJXzDsReSUhJTnfuicAAkn6B72yUs+2WXZtpXq2kP
 e+vBSUc7yOUZ/WUY7SrqmBsYQZH6AiVmaW/MUnK9nmgCFo/JD3QREdJSxSoOxnhM4NwLX8HLTrU
 A80IkVZXwD6Q7yfRlzKYgGwouiPsW64eR2gFIAC59iyzsEHBF2HbGq9W0DVFhP7aYText5J/J7z
 pbiH8maIPZmDZb2bbnlbEjffk0WALTv0lv0KD9nTnA8aA6bDpxnRuqCalp9cM6P2BSiLYkVnWLl
 Gl9zGQkYHA4JnPzg0g01dJiINrwL/9gwWw3xht+nyiluJPaM5xjKXRFITbfQiQeZMniGtgAWUoW
 X8rEsvse2AkTk59dfTa0Se9LYHt3uHwPfjljIaxWe2YY1nrIK4WFt5eEcg3JhvmMjyPVtLCCubj
 4yvpYT8s2T7Uzj9j5ImYf6LqatSbyyV5ldDCo+5BFt73C8FG2a5/jV0Vbg41FLAgVrCINM00mv6
 gbXjm5n3+AlUEH3ucAy2HEMDC3pnolpRaXO72+vQ9CWL66CcgjZNyN1GVhfw5Jdcahl9ZG0UBj8
 j5xL90iCSo4eG+g==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Configure default DSCP to User Priority mapping registers as per:
 https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
and
 https://datatracker.ietf.org/doc/html/rfc8622#section-11
    
Also update Priority to Thread maping to be compliant with
IEEE802.1Q-2014. Priority Code Point (PCP) 2 is higher priority than
PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
PCP 0 (Best Effort).

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v4:
- Updated default DSCP to User Priority mapping as per 
  https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
  and
  https://datatracker.ietf.org/doc/html/rfc8622#section-11
- Link to v3: https://lore.kernel.org/r/20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org

Changes in v3:
- Added Reviewed-by tag to patch 1
- Added macros for DSCP PRI field size and DSCP PRI per register
- Drop unnecessary readl() in am65_cpsw_port_set_dscp_map()
- Link to v2: https://lore.kernel.org/r/20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org

Changes in v2:
- Updated references to more recent standard IEEE802.1Q-2014.
- Dropped reference to web link which might change in the future.
- Typo fix in commit log.
- Link to v1: https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org

---
Roger Quadros (2):
      net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2014
      net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 100 +++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.c       |  36 ++++++-----
 2 files changed, 122 insertions(+), 14 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


