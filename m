Return-Path: <linux-omap+bounces-1618-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3891BE22
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B46F1F21A85
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8415B13D;
	Fri, 28 Jun 2024 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olG4b4wF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83926158869;
	Fri, 28 Jun 2024 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576150; cv=none; b=WhoEYK+4vEoMpx2Cm2quli6UL21nlglrTz4bIyqtv9VEeS6+X1ObsBeN5CjrFA8G/HCgDvxh6AS3FmpJuI4m6HSZ5bEWu6Z3xPk2VTngWgw0bmRLh1sadlQzpRGJJAPq/MtmIMRC/RhO54rwUHEq3WJ92FFdMPYcyTJbnVKj3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576150; c=relaxed/simple;
	bh=FKcirLR/pWoh2OgNGlCJD8YMQ8eyfijmKpfX7z0DNkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bu+UQSFdmpfOPph6iPkcLQ1Z/DupvimT5jUKGGcdFBY7bIRsN22mWk1rJlsivLm93Kpb0tuLJF2KxAF8W5Ym3J0fjmAY/Etb5o/H8dx7yehPKR+BU+hUw/N294STpJvSvHUnYKbm0Fa5wGbekJI9TKhqmaB9wOy7p6EF0fzC7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olG4b4wF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FFCC116B1;
	Fri, 28 Jun 2024 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576150;
	bh=FKcirLR/pWoh2OgNGlCJD8YMQ8eyfijmKpfX7z0DNkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=olG4b4wFfXJfaStDN/4bJiyDG/w5tcYVmMOtiXpEq/KAUVAmT23oQrwE/4vhHAmj8
	 B5n+IpIHnFdEOUmLqKyStcsM9DaVGRKBVjR5uJp6ixlH/irOy18kb8p3gFLEcVTOSU
	 LRM1E5cUsSwnpRBvzG+DNLOltvXw/+jUPEQYpiuopdKqR8bkhXBg2STDFV8ICneQ4s
	 lNly5slGUJb0OimxsxNRvp0p7saXjhb82Gw4Fs9FyXxMqH5h0m9SkpYW+z25dQykiD
	 tSAIPnnO7K/vyb/BC4hg+rwrwwte4Ovg58NIAMGRbfMCpjVb0I08UcdgFnKXcizzdB
	 e9c0uTGHSZeZA==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:56 +0300
Subject: [PATCH net-next v2 7/7] net: ethernet: ti: am65-cpsw: setup
 priority to flow mapping
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-7-c399cb77db56@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=FKcirLR/pWoh2OgNGlCJD8YMQ8eyfijmKpfX7z0DNkk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4mV0BG4LD3+QOVeLqgS4vNdoucjP24yHt/
 r0sqyzoirOJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 k+jvEAC5gkLelvUnn2oekW5QJf/B4N4rJcbVFF4MKJ4JTr8e5+Ck/m0OIhdb5QxzVEqvtbfdIUJ
 VuidoxD+MSvvC3/vOi3+jXLKCDYywovWfl9H8mRNW2M7wFfx+sPkGR+nainGjv7EzlMzr7VnYgp
 G2ktKg2TXgAtDz1M5EAIMYA97Hc8QyKCUOPt/i1Mvgpqha+CNs1oYVyS7J2MNuGtrNkwmjk/NDV
 8uWXZwYEsgKu8Th4dI88HU9aSML9RntP0I6idU1JI0Uqr8AgUedRrLJdPczQfdgMVLeM+kRuqup
 fVEvNVCWaNy/LynXHogJ+qJYd00ex1v/+q0i1GMBAG9FTQ1K1O2xDd744oYtr9l+/VFjZejxpAh
 RmDg1wR/D1u80tFs2tUpJRW0iUip4dTDD2QVLAuGq0F8EZ8ZTheRIyDXrg5uyv+OXbIMNipZ/zE
 fbYNQ/N6mu4QuNkgyucjRq+BIUszuVzT+7YyVGKp9OEWn7kbHsWpxQyPhw6TRQBuVECe9ilSLC6
 duiW953aKB8zlHB9cu8NkIlm8DP6uJ9GiJaARLd/4uztRA8uRpMOa28FRS/ioCkvlNn7gElulqP
 gGgssrAiuwN1pfxBLMzvH70Y4uL2qjcwzFvqdH4TcrozoszasIcofvlOZCupvpGGNEtfmWUAAHi
 Iydf/6vTqH6pNZQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Now that we support multiple RX queues, enable default priority
to flow mapping so that higher priority packets come on higher
channels (flows).

The Classifier checks for PCP/DSCP priority in the packet and
routes them to the appropriate flow.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index f6c664dfc1fa..49925ccd6b31 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2492,6 +2492,9 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		}
 	}
 
+	/* setup classifier to route priorities to flows */
+	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
+
 err:
 	i = devm_add_action(dev, am65_cpsw_nuss_free_rx_chns, common);
 	if (i) {

-- 
2.34.1


