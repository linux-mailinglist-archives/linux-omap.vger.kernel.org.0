Return-Path: <linux-omap+bounces-2605-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94509C05CF
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCD51C224D1
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 12:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12E820F5B9;
	Thu,  7 Nov 2024 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+Y+g0wY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AD1DBB37;
	Thu,  7 Nov 2024 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982582; cv=none; b=H4kN+8gMiN166vOPf+axeT+bM5oOA++6baQ/NYjI+hyatn/JKZ9gAncJaVRqG4HdH4l4Kn9f5X6W4bO8DuIp1w8EFM96GMnJ1f8kgzcqTXNycwWxYpzYt/QKREIGNLoxIMGXXBPoKm2lWTpagPIS5mxQTRNfp/oAolr3xXy4JKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982582; c=relaxed/simple;
	bh=os+S4R0i/ksRi9FWC0W5naKPnq38pWtXjDCAipzNZYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YMu+pDiUebTUSdGCSAVTXWeNdSkpa7bfkRsmnwTqGvElrF7GiXk0h5EzijD/pTgjNB/ffu3FBopoRRvZam6VR8P6HTjFkCmAHJ3vS+a2WZaXuIg7j/Wr2laFZRgk5er2U2UwuXwAkcM45ClNJn7mgCc2BXoNyjn7GU1C8cMygdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+Y+g0wY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14567C4CECC;
	Thu,  7 Nov 2024 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730982580;
	bh=os+S4R0i/ksRi9FWC0W5naKPnq38pWtXjDCAipzNZYA=;
	h=From:Subject:Date:To:Cc:From;
	b=Y+Y+g0wYQv6Q2o/xv2btaS+lLJ1HhSMMhx5EzfesoK00H4mEp6hA/YqDoNsDJqLxb
	 orTmPRc0OyIheS7L/NBC08QBemDa/GpEhTpp0eN+jh/uHJlRvuxlFPPsjoWYrvNkuO
	 1411CIn/c4bKqtuloqTIKKf/PgXaq3asNYRyMpV91lm+F/bdzQ/rOFUNbkvCwZNQKj
	 AEmtdovVVOBDg4bIJqR65ktLioH+NEAdsrR384bZAj9aj9rZSnGNeZucn9VdmF6v6w
	 s+bptFrDIuRUCPM5dXOaEmIVc2qXsxt+kX3HmDf8JzpJ1tfXprtolHD1KRTzCud2Cy
	 TQz0rcyDoOKnA==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Date: Thu, 07 Nov 2024 14:29:28 +0200
Message-Id: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKiyLGcC/3WNywqDMBBFf0Vm3Sl5qISu+h/FhSajhmoMSWot4
 r83SLddHg733B0iBUsRbsUOgVYb7eIyiEsBemzdQGhNZhBMlJwzju1cV6h9fOP8mpLFsKGJ2iN
 jrBO6bPvaMMhrH6i321l+gKOEjrYETTajjWkJn/Ny5af/1au/9ZUjQ6lMpyoppVbq/qTgaLouY
 YDmOI4v7+9vmckAAAA=
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=os+S4R0i/ksRi9FWC0W5naKPnq38pWtXjDCAipzNZYA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnLLKrFDvxFp51yGkYeXI8J7yWPLoWQwYmyMQS0
 fXTXnOxl0iJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyyyqwAKCRDSWmvTvnYw
 kz6iEACWho6ockquzCDpqzxUS5T4v5oNLDOzNUEaqXdnU6iKyyOKOfS7SgRXijaO7KnBwsSdPUh
 piBGU11vptFbAzqd4A8LWkPGHOm14JMei4sO2RBh9ShMDtWSBtFp91kr82efYu8bE+W9Qr3q1QQ
 0ps+R13I6OFWE1gA4m2QCVuhLHlIXEZkmvcrG3d7zeaTsH7CTlo+ZvIeaKFMggn3wNiUJ3+qjMv
 zWkyygg1WU3k7Acd9o+9V1C0fzkSN8YHPTao/MWjTfZtKYBNzRIaY96QLnUfD5VCJ2aOlu2kxgR
 iu4V2QJbkjrExkVXXbncCGIWgGtqZn3HMQyGwF7rAxeHsrIHq6u6YPhDwJKcLyQWAzPk6tchQSw
 qKeo66UtJUn58qPtd3C/kTBVFYrWHWzRyBZypAevAfGgmQt/D0R112ZJy5vSipEEXYiSVpqme01
 XNyA5v5zup3cGYkTvAwxFfkDEah78uuupZ5ghJYsAlowwTJQCLghlEgxeVcob11kt7z8KmHkFrl
 UVKbefnLNsmXOaPYUtc+ikgX99WXuDbTPHli+oZZeTppNI1XkyAeBAkqjBdVinaZt8FmOuJSPTJ
 pFG9B9DIAj8eVlfLZ324TztkkzcQv0kpEtC8KbU1uWy3vSgpMxC9M8MZH4h/L2rEI6Eoc1OYr0/
 N12hAPQTBRSlqBg==
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
Changes in v2:
- Updated references to more recent standard IEEE802.1Q-2014.
- Dropped reference to web link which might change in the future.
- Typo fix in commit log.
- Link to v1: https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org

---
Roger Quadros (2):
      net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2014
      net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 50 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.c       | 36 ++++++++++++++---------
 2 files changed, 72 insertions(+), 14 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


