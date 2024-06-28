Return-Path: <linux-omap+bounces-1611-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25E91BE08
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2801C2300B
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405661586C0;
	Fri, 28 Jun 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKBlDnzn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BE155A58;
	Fri, 28 Jun 2024 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576124; cv=none; b=WOOU7UfHskBgVsjIturvkYsZoBcqSaROuZknDtRmWOMQ7VpvVQV3MJkB/fBO/KI+CpLb/qzVZ3FAVWCVhu9Dq/udsmR5fYyGHVVStYwqFKesw2eSu035AD++DokqQ7RXVSgbk21wBzAWaOHFiJDGz9YVFBcqy9xZO4PddnC2I84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576124; c=relaxed/simple;
	bh=bOmPMTHrIWVUkNnpqDQtZcf+zWqKVvRLaoikfQSThkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ho82ABVmQNHhybzxAe+V56Q/twC5B/Xjwl4FcR1lxyBs3Ko9kvKsXSWkr1oiWCRxEn2xUPdM21elYAHML2AY7QErpZ6uuAplvLvNYH4a2uep5Lb3SVdj+izobRKkisY9xKXJPu6lx+DASKws3vBRfPt1/vITV6msqrant57pu0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKBlDnzn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20448C116B1;
	Fri, 28 Jun 2024 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576124;
	bh=bOmPMTHrIWVUkNnpqDQtZcf+zWqKVvRLaoikfQSThkE=;
	h=From:Subject:Date:To:Cc:From;
	b=HKBlDnznvR+wOlIjiaxqJ3HLi1PbUdzcLrngjwGPsNueMTYW5CDYbU89lzjMp2sEm
	 u+ikoTwRmU3DMQEQK+dLCi4XQNMd+FXx/zZSA8RqafckRCp9Y0vOS0Qu/S793mtO1j
	 Lttv1ANPm3tmrGuzA6VoAk97Qj4xKGnCVrae5eITc0FPw4EzW5GnlKA3KF389s0Yn1
	 SUl2Mf/SfuKa8bzJnlAKlgESm2Va+PZT2ZUdw2p2ViV+0aibTMm77uuxVRHSC3WNCj
	 VDr1cADJx0N03GfQQCD0tXNJNSa5/OyoJHzM+NGfk/HsF2lh2y1JAnu+Fub+ml5eLf
	 4+yzCR8QLcM8g==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v2 0/7] net: ethernet: ti: am65-cpsw: Add multi
 queue RX support
Date: Fri, 28 Jun 2024 15:01:49 +0300
Message-Id: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC2mfmYC/32NQQ6CMBBFr0Jm7ZhCoBpX3oOwoGUKE6GQaUUM4
 e42HMDly8t/f4dAwhTgke0gtHLg2ScoLhnYofU9IXeJoVBFqbTS2E66QruED07vMTLKhs5o6+4
 dtRUZSMNFyPF2RmvwFNHTFqFJZuAQZ/meb2t++n/hNUeF6qZKo6zRrrPPF4mn8TpLD81xHD/uQ
 b2BvwAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=bOmPMTHrIWVUkNnpqDQtZcf+zWqKVvRLaoikfQSThkE=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqYx9qr9j2NMEe0WGJL9jOOlwPTfn30bt6yQe
 BZ6QvJ97H2JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mMQAKCRDSWmvTvnYw
 k/i9D/4vnlk9lbtuS0mCSthC9qzME4i4dBc4uevjNynUmAQI1htDbIJBq4/pKKSbRSeHqge7MnG
 U0QW/kte22lalTZ9l70UdMAgs1coUy5ywqaqDN6A8g9kzJhLdWLU3ZlLTGEKDaUcmFqy6ZqWEmt
 bqWYvEgBxmyC83EM/kLwd03Hx1djMyMRnReJsCR/n0t5etL87FcJPRxZ6xmtA3nQ+r4cynN96AA
 26xFgWdK48lQWGGldodA5f8sB1FnO9BRq1W5xUZDoqZuVHmD9ofFgx1Ewp9Vic92H1OL/P1mXap
 btKEh+mrVuwR2NT6+p6C9a7Z14BBAeY//D5jQaPgxisLYW6ZcvAnTk7MmhNJSKLrac81TLN3bXy
 ZA/KjDL4CTGfF6NMyisLfsokHqhOvNSBXym25v6gitM4dApb9rbVDxFf58uzswPYhedSjbuvQ1f
 B+lXpdgGzoks6A1fBR0pIVKcTFZLl7ubCQdv7Z9K5jBmgr+NJLB7u97jS2PPz00d4I/koXdCzqR
 hiAagM3zq2Q+HMsASVPJkqBePppCmzoMX7rsG0ZLGFBeeDDfa6u8OL/VfsgqRxMObt5lXHzJX39
 OSaWet6CznpmbXLt66yGH0QKWqhNeO8LEpW0agI688VV8ioLqEAsrcegte6ylFBZnSI9+A9bpOe
 Z3qBzxQW0avhXPw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Hi,

am65-cpsw can support up to 8 queues at Rx. So far we have
been using only one queue (i.e. default flow) for all RX traffic.

This series adds multi-queue support. The driver starts with
1 RX queue by default. User can increase the RX queues via ethtool,
e.g. 'ethtool -L ethx rx <N>'

The series also adds regmap and regfield support to some of the
ALE registers. It adds Policer/Classifier registers and fields.

Converting the existing ALE control APIs to regfields can be a separate
exercise.

Some helper functions are added to read/write to the Policer/Classifier
registers and a default Classifier setup function is added that
routes packets based on their PCP/DSCP priority to different RX queues.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v2:
- rebase to net/next
- fixed RX stall issue during iperf
- Link to v1: https://lore.kernel.org/r/20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org

---
Roger Quadros (7):
      net: ethernet: ti: am65-cpsw: Introduce multi queue Rx
      net: ethernet: ti: cpsw_ale: use regfields for ALE registers
      net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
      net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
      net: ethernet: ti: cpsw_ale: add policer/classifier helpers
      net: ethernet: ti: cpsw_ale: add helper to setup classifier defaults
      net: ethernet: ti: am65-cpsw: setup priority to flow mapping

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  59 +++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 361 ++++++++++++++++------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  35 +--
 drivers/net/ethernet/ti/cpsw_ale.c          | 273 +++++++++++++++++++--
 drivers/net/ethernet/ti/cpsw_ale.h          |  62 ++++-
 5 files changed, 583 insertions(+), 207 deletions(-)
---
base-commit: 84562f9953ec5f91a4922baa2bd4f2d4f64fac31
change-id: 20240606-am65-cpsw-multi-rx-fb6cf8dea5eb

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


