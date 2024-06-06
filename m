Return-Path: <linux-omap+bounces-1483-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFC8FE61D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B1D21F25546
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FA819597A;
	Thu,  6 Jun 2024 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpmuGGf2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032F1953A4;
	Thu,  6 Jun 2024 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675789; cv=none; b=HX0wPKEzDbGUTX77QCkZmp6+gUiVcKER+GIBw1P9l+NpE+BIWVzxNbUh2vQFOHiFBTXPynrCC9rEMHesI1UI9wHDRcTXG1wCdG9nAQmBigUqWBrIy20FREYkoXOo2hltXG8HiHWJdxAPLobKXLi+V2OQiVQJ4QXchLqYMaY9Ko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675789; c=relaxed/simple;
	bh=X1m6b6lelnlNBB+WcqOljMIeenc6jY9qHrvKkYzdDQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tqKV1LmzTUCR77XPmizT/JkfnlwPsk7XHGFhFLgm2xE+ZpKT6m3uEOdFUAgaCgT4OqnXLA7kK6yKBHvAeDxWPeYsUzg9JY+OA949Kuk+Pnz4Z8DUYEx94eYywU28855pej9QHo+2s0pJqx7JxhULihvQr2IjOs81N9LQVjlJSmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpmuGGf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0B0C4AF1D;
	Thu,  6 Jun 2024 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675788;
	bh=X1m6b6lelnlNBB+WcqOljMIeenc6jY9qHrvKkYzdDQI=;
	h=From:Subject:Date:To:Cc:From;
	b=KpmuGGf2c+L7sS4JA9DpFtcYrsjYU3zBxW95LKTUNxYECbADNSSRgWTU6o+zm8aZ1
	 lc/5hxEUkbtcDjiJPKd6yIM0C4iFP0YrYr3bmD42J/ivTZ498oJrTQSxZ359dd4KI5
	 4ESwDvFxb2DIL24FjzPkJvCVTQPvap9WZjwLd1jqWHh9zzv4pJsrkGuQr+KDvlhvY5
	 CMRjUA/28YjCy9IJrHm9Ch8XZ74dQSRNxH7Rj7fIFo/r8i+PCLjGN91sP4aGHnqYDt
	 VKtENtoSoRd/6Fg1B7B6eRfOncHuEP3A4WacW8/yMu58ZsZak3VDSjps7rP6PuIA+s
	 TfUbJDkPyfjVw==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH RFC net-next 0/7] net: ethernet: ti: am65-cpsw: Add multi
 queue RX support
Date: Thu, 06 Jun 2024 15:09:16 +0300
Message-Id: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2mYWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwMz3cRcM1Pd5ILict3c0pySTN2iCt20JLPkNIuU1ETT1CQloMaCotS
 0zAqwodFKQW7OCnmpJbp5qRUlSrG1tQBhvBqscgAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=X1m6b6lelnlNBB+WcqOljMIeenc6jY9qHrvKkYzdDQI=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacAETk11b9CoCcsF4T8hXWudESgQWgRlNsrs
 ypx6I/ni0yJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnAAAKCRDSWmvTvnYw
 k/xtD/0Qg2wSJ84gHz13CawwmbxCntS8LAShukgHheXdAXEvM6620f95TSiBtpzCHjGrv9jgjoc
 L1wEh972EsUde9YB99oiss24dqtJ2v4LLlW/gTFODCKr0V3SNmrF8Iue4nzTwYrLxVW2NQN9LC7
 yOxl5fTkgICLfuFh1f7cv/oleMUeSKtUqpMRiWNVRhFH7Fb8F58mLvzU6ZSvKtbaWN4eDOdClRY
 GJm9IGpC7JHgRYgkwtdEGzMGNZKu0Hs4wtt5ju75jYgrP8/6iFIUI6mqCuvdNMEezHeEpOJI8Xl
 9UQ/u8uaJFSncEdhxiT/tg3eg+ngaoGS7jZEmYOKQL0smqqdYyPmSgtsHZhWMhHGuJeckbG9Mn9
 DuEzraB0aXjr7nTfJTYzYGVNS6iTouVz9/ZVH9KJmMTt5bqdvOo7av4RSZAm3PIfCZ6qtAYg/0I
 7+r7Mgz3qkCPJvzBZkVrMrSAQ/HmwSHtHyu3MhwZvFZlvG/4h6gYBPxnyQ7xXsNX73au737Tr7R
 O3RbVliDR1BsCHqMrFDe3krxWxuezFwaB4+Nr9Q5OULkjs0B6Qp+utZvpMMSZ3rDF2/uL+meY8g
 CVvGjYuO0DXurJjt6NfLU2WmIlddSWBsKTXAOD19XZYwWOfx5fWgYKZDrPHcBYJSzCTMWOj79Hv
 kTNOdMzXeb3UwVw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Hi,

am65-cpsw can support up to 8 queues at Rx. So far we have
been using only one queue (i.e. default flow) for all RX traffic.

This series adds multi-queue support. The driver starts with
1 RX queue by default. User can increase the RX queues via ethtool,
e.g. 'ethtool ethx -L rx <N>'

The series also adds regmap and regfield support to some of the
ALE registers. It adds Policer/Classifier registers and fields.

Converting the existing ALE control APIs to regfields can be a separate
exercise.

Some helper functions are added to read/write to the Policer/Classifier
registers and a default Classifier setup function is added that
routes packets based on their PCP/DSCP priority to different RX queues.

'RFC' because I had to revert the RX coalesing patch [1] to
apply this series. I still need to work out how this will work
together with RX coalescing. Series is based on v6.9

[1] e4918f9d4882 ("net: ethernet: ti: am65-cpsw: add sw tx/rx irq coalescing based on hrtimers")

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Roger Quadros (7):
      net: ethernet: ti: am65-cpsw: Introduce multi queue Rx
      net: ethernet: ti: cpsw_ale: use regfields for ALE registers
      net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
      net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
      net: ethernet: ti: cpsw_ale: add policer/classifier helpers
      net: ethernet: ti: cpsw_ale: add helper to setup classifier defaults
      net: ethernet: ti: am65-cpsw: setup priority to flow mapping

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c |   5 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 197 +++++++++++---------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  25 ++-
 drivers/net/ethernet/ti/cpsw_ale.c          | 273 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/cpsw_ale.h          |  62 ++++++-
 5 files changed, 437 insertions(+), 125 deletions(-)
---
base-commit: bc4f675ad79dd6f081e36ca45b27eac8ee60e29f
change-id: 20240606-am65-cpsw-multi-rx-fb6cf8dea5eb

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


