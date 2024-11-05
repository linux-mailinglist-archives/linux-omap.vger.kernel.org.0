Return-Path: <linux-omap+bounces-2584-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C29BCEF0
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 15:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1730A1C22262
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 14:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BD41D8A16;
	Tue,  5 Nov 2024 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pw2IwZsF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5373F1CC159;
	Tue,  5 Nov 2024 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816306; cv=none; b=runiH2B1z4cKX25AEpJMnalcJoykh+TuPH6N34UptIC7u8YK2BX3y9PtZ8+9kildaFVh7BJtUX8sp8M78jHgIdGBCDx7dNfwCI/GItG9W7PprtF+LdhChsDXK31SMxZO5LPL+y1uevVimns4D5VzqMxa0r2+KCiVSt68bSZdp9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816306; c=relaxed/simple;
	bh=/IJQT2lrClcKBM+GPqybd8ruoU/xBBYmxY2KT9BpsXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JJHOeAeftzvWgFi77qQkf0RPli9La7wxXKn3S+oJMIFd2vQy8B2iJ0gX2H/q+3ssKJN5PPzdVJhnzMeso6VNuEkJjQUhj1vMAkpN3t60QI/wIFvQsmx8Rns3cmCGIalW8hTKnexjexdf4tiavYesvRFPUILI+jE5PfH3rnyDRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pw2IwZsF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C76C4CECF;
	Tue,  5 Nov 2024 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816305;
	bh=/IJQT2lrClcKBM+GPqybd8ruoU/xBBYmxY2KT9BpsXo=;
	h=From:Subject:Date:To:Cc:From;
	b=pw2IwZsF6/MhxN6z8pXRGLYVIhDYVy0Kkmnrb+yBB1dFj5ZLp4MQnr26apfJpQ2/d
	 ehTisbkiyQ2JmOQOaaXRKSD5uQnu55dJK8lXZX06LjSwzvEc7jup0IFRie2b4+LNQ0
	 CmW6H2ZOxbtsJGhZOvR6Hue4UUHamZl7AWhzdJP7eybnWqvky+w6uZSTiQApADFsXW
	 AYY9EcWPg3hgBFJRgN2viBKGrZXYNsw0a4LS4+mXDb0HHLRhHJ/vLVsYTMJqyTnvyM
	 iESM2ipCEUHPDW8ZOjez96asfGoWBYZPhkoHbbMxrKqrdGJZ0Kv5rJHgjVYhmbzjVI
	 /nvj/UeaRjMCQ==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next 0/2] net: ethernet: ti: am65-cpsw: enable DSCP to
 priority map for RX
Date: Tue, 05 Nov 2024 16:18:09 +0200
Message-Id: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEpKmcC/x3MQQqDMBBA0avIrDswCerCq5Qu0mRsBzQNmVQD4
 t0NLt/i/wOUs7DC1B2QeROVX2wwjw7818UPo4RmsGR7Y8igW8cBfdId1/9SBHPFoD4hEb2t790
 8BoJWp8yz1Pv8hMgFI9cCr/O8AMdXIpVzAAAA
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=/IJQT2lrClcKBM+GPqybd8ruoU/xBBYmxY2KT9BpsXo=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnKikpHwJO5sv2bstifYuj02CszLcWqZJxQtVZI
 ZjfSEqtzOeJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyopKQAKCRDSWmvTvnYw
 k3r0EACwQMXfDaNevgtXbtSgOdYVrNbtA0VeIMyaW3xgG2+MeXE09sNCTE9l5GkwcA9Ejf8M9d0
 fYTZC0cr0YjJwEMecVHp1eSQgqJg5QPHvWhB4KWJAbs6x7qp83Yj6P04p/Mq39MHmR5DMsuTHoX
 wQZ2NaewdJuvhfv5PytE5hRdBruowX0wyRrXqk6poo30iRya92imsy68dhabgeRh3zP+c621Z6D
 edZl8CQuFqNRqpMLSnX+kICoYa1DwV0ELi/bBSwD42auc50KYf6FJfCMc5r5ClPtQj2UI2yejVL
 F3aQfHHvIxXRAkSuky8IZNVS0iXfwfzc7Y3exk6IgL9mIAbBdypxCabTBDCtO3GnsaNG9Ag7LfB
 YbD5AIAYk3DXQ4W//iQhZFfxV85gsQ5BQFwIjOPYD7ZkR6tpQc3UM7E5bx3rk+nJVMCkJJfjA0F
 r6fh/7aa7sz4hUYR+xzQO8WHcxIzHyIT6UozPy7CrzwgMwti2QFY4WVImHp/c8u8ciqbiQhs671
 EkRkusv9AB2lTpU38HIiRDu9qCW9HvR3bbh+L9CLA4ZfbHjTdvNxU0ZogXuPcGvZqm+YYsLdcfb
 k46wNS921WIH3nQkgqbKC/vaFmTfbR4jCv/BEPRG3L9Z4kzscLY1fnteXVwoOk8agkEEM5npG2s
 p+GhvwnUkyYUw0g==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Configure DSCP to Priority mapping registers so that IP precedence
field (top 3 bits of DSCP) map it to one of the 8 priority queues
for RX traffic.
    
Also update Priority to Thread maping to be compliant with
IEEE802.1Q-2004. Priority Code Point (PCP) 2 is higher priority than
PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
PCP 0 (Best Effort).

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Roger Quadros (2):
      net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2004
      net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 50 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.c       | 25 +++++++++-------
 2 files changed, 64 insertions(+), 11 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


