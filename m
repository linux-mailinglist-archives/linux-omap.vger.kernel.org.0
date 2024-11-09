Return-Path: <linux-omap+bounces-2646-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D659C2C0C
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 12:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A43281683
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED12013D899;
	Sat,  9 Nov 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW8hIB0D"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852401474BC;
	Sat,  9 Nov 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150019; cv=none; b=jIblocJgjw2waFeRBG8s2M2izB/+JmePgoe5ygz84FNdIQo4X9lahidtCJV/xKSJp3xQcYZ5vjBlt+4l8PK4pjAPaFxXVzF1O137RiVz2ZKl/sokywZu7ehkgWJgpyYP8pv9vDO1tP4fQ0KS4g303vMS2hqcaFzrnJsjlV5N+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150019; c=relaxed/simple;
	bh=ziESfODPrqoYhHSPyeBZm6XYU0dEEiMc4FyxcAeJJfk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sXwvkhqO66YqfrgPaVBEnMb21vigWZvEfaxVHU5nuNrpI6B6dg1gg4rfjE1HJOhngq3hyTExTnmM8rmjDKc3gtGYG/TRx//NLHyHJc4VDsi84s6Zy7dZcP773KgJwMjA4Zxj4ANojFYc33XpBglxSFE3vPsdOcCd86pcHI3do+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FW8hIB0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5DEC4CECE;
	Sat,  9 Nov 2024 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731150019;
	bh=ziESfODPrqoYhHSPyeBZm6XYU0dEEiMc4FyxcAeJJfk=;
	h=From:Subject:Date:To:Cc:From;
	b=FW8hIB0DKRPqHiHSD2pPFKDnvJTOH04/jnI/UOVzxpOhpEOGJlk6Vcy44N+A1XsTj
	 U8Pb3cNpRxS1wQfKc6QLOG6YEvoRQ/SsO9+3JucY4afh32g1JjmyMKU9OxrBefAzPh
	 9HtxsbjsZ+D9g3/cI2vP7lKjWqhhPjQV5vcm7JKLR90gUjWoRwnE0cNW0D+ra69FYm
	 vptYkPKjkdRhh8gXy8jZdJffbgvWgcWIAiEy/lpSRR+Vs3prkOZ/FsIapml/jsZOhj
	 tCazzii7r84PtFKuhdMD200H8CvDvYmxlUUwM0mmNbm9Gaslexzr3vmWul3PCEz+G1
	 LbRWDb4kPALEg==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v3 0/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Date: Sat, 09 Nov 2024 13:00:06 +0200
Message-Id: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZAL2cC/3XNQQ6CMBQE0KuYrv3mtwUEV97DuID2A41QSFsRQ
 7i7DXGhC5aTybxZmCdnyLPLYWGOJuPNYGOQxwNTbWkbAqNjZgJFwjlyKPssBTX6F/TPLhhwM2i
 vRkDESqikrDONLK5HR7WZN/nGLAWwNAd2j01rfBjce7uc+NZ/9XRXnzggyFxXeSqlVHl+fZCz1
 J0G12zoJH6h8z4kIlRQoTQvBKJM/6B1XT/heNUyEgEAAA==
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=ziESfODPrqoYhHSPyeBZm6XYU0dEEiMc4FyxcAeJJfk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnL0C7PtCNPfc2NSmMGtXs90PkD72Qr50jeV+xn
 jiwmqDj956JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZy9AuwAKCRDSWmvTvnYw
 kxWVD/9hEclcL1t3Fr/Vi2Tm0+6O437WAebcRZWyyugA5R39fhIL3AlH7g4Mv+3EJRp6eyNMr0w
 6sBY/xk2VJ+vAemBLGRVYu2zeoFWPU5jl+v2iZjZNv8hoH/Td/net2MGlxa3QRvRxphqEv+4gtA
 q3S3XuD0PCpIx4ozrYIC0YtZf4FBHc0/GHRsNoD0Slpz8rXbDTVJF+FhVvxH+Ycwq1jjbuasIvW
 XXdcpAiGJihRD/n2ngX3WqOzJ4Ani7qkRkMlKml9ju6N1J3kAO+04/aJWqtCmMK2va6zVGD1w/A
 44JhUgC2Q6dnY3g5pUEcZmt7qifYtbKEncDaz1Dnu333Gjn+WhsjBjC2Ky2VSZfVpCZb1oPVRDL
 AI0KPqnSIlcWSKE/V+JrKXoOyGpNP0TKRRoRkucPyzvwL8FNIQ28KUuLSZXqNXu8WqaQvN55Zhk
 4kChnZzDhhjh2gz4koDnKRw6DI1At+5Q64ngBFxRPWQgL5eNx6rr1SPaU81ScEek3R84rXaAVod
 4XFGPRr5N3hBGXg9GoJ3NSsi6qvUOa0yJYM6NDsBkk+06ro73T/+VKtGuR7CEVTOiwcslAXEKxF
 pDtDpV4lkzZAMyuqcesE8gSYyZmv0t5XCON0Ph1tf9zWwVRdFBwKYywoaoCwyt53ecXtKXI9GFc
 9iGfHrV+vuyGrIw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Configure DSCP to Priority mapping registers so that IP precedence
field (top 3 bits of DSCP) map it to one of the 8 priority queues
for RX traffic.
    
Also update Priority to Thread maping to be compliant with
IEEE802.1Q-2014. Priority Code Point (PCP) 2 is higher priority than
PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
PCP 0 (Best Effort).

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 54 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.c       | 36 ++++++++++++---------
 2 files changed, 76 insertions(+), 14 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


