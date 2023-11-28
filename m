Return-Path: <linux-omap+bounces-58-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA17FC064
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 18:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3939B21662
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC4239ACF;
	Tue, 28 Nov 2023 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2261BE
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 09:38:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822j-00064O-V5; Tue, 28 Nov 2023 18:38:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822f-00CECZ-R0; Tue, 28 Nov 2023 18:38:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822f-00AIhW-H2; Tue, 28 Nov 2023 18:38:37 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	netdev@vger.kernel.org,
	kernel@pengutronix.de,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Rob Herring <robh@kernel.org>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Marek Majtyka <alardam@gmail.com>,
	linux-omap@vger.kernel.org,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Simon Horman <horms@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Wei Fang <wei.fang@nxp.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net-next v2 0/4] net: ethernet: Convert to platform remove callback returning void
Date: Tue, 28 Nov 2023 18:38:24 +0100
Message-ID: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qcEdChFt8Lt8VDlYj26EFx9vmoZ6FKJwGC9mdw0KmLc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlZiWQd365uxpTW7I8bQ7foyRVSPmc1LIReTize +O0ViiGM/OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWYlkAAKCRCPgPtYfRL+ Tj0sB/9sJ19oqpZ1ThW/3kLfDa9kujMph5iXATKcA8NUC1ygaV/wDzLIULcPuskxesUejZKHa9Z sTe6UukWQv+ZPdkAUyzaRyz1v4EsXIez2NHHClTfz3KiKDDMdgNMHos9gbAXd11vfuakI63xkoL oJqSr2MxIErTTgF5iezSRiSM/BIKFUSU1ooztcVyb3N3wodQOlSHjN4dIiWNdiW2GAOPF5jp/Z5 ai0Yppj+rUjQiO6NgPKBvaOOMhj/5t1it3qaLLZuQq/VQHOvyUHB/RTOTCjizPQxUket0dcjTDV HgdBJ7a7QovCNqWJ6wiChx2UEMurR8ht0vDots7Pn6bxrenK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org

Hello,

in (implicit) v1 of this series
(https://lore.kernel.org/netdev/20231117091655.872426-1-u.kleine-koenig@pengutronix.de)
I tried to address the resource leaks in the three cpsw drivers. However
this is hard to get right without being able to test the changes. So
here comes a series that just converts all drivers below
drivers/net/ethernet to use .remove_new() and adds a comment about the
potential leaks for someone else to fix the problem.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.
The TL;DR; is to prevent bugs like the three noticed here.

Note this series results in no change of behaviour apart from improving
the error message for the three cpsw drivers from

	remove callback returned a non-zero value. This will be ignored.

to

	Failed to resume device (-ESOMETHING)

. 

Best regards
Uwe

Uwe Kleine-König (4):
  net: ethernet: ti: am65-cpsw: Convert to platform remove callback returning void
  net: ethernet: ti: cpsw: Convert to platform remove callback returning void
  net: ethernet: ti: cpsw-new: Convert to platform remove callback returning void
  net: ethernet: ezchip: Convert to platform remove callback returning void

 drivers/net/ethernet/ezchip/nps_enet.c   |  6 ++----
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 15 ++++++++++-----
 drivers/net/ethernet/ti/cpsw.c           | 15 ++++++++++-----
 drivers/net/ethernet/ti/cpsw_new.c       | 15 ++++++++++-----
 4 files changed, 32 insertions(+), 19 deletions(-)

base-commit: 8c87404c76c1911a7ec5b61bf3b2c3858cb95de1
-- 
2.42.0

