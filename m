Return-Path: <linux-omap+bounces-2585-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671E9BCEF3
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 15:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D274E1F25AC7
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 14:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D1F1D968A;
	Tue,  5 Nov 2024 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYuB6fZ0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D771CC159;
	Tue,  5 Nov 2024 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816309; cv=none; b=IXDBGb6hSDwAuLdOF/k8wTLiP7o9kjgFr3f3A2keNW5tKk/pVuP8D6RlQxzu7gZogWtiVpufve1lcu25Sik/aHTeVL5KHKwp0/dj484yJe7RWvF8MxuQBZ3BX8jbvDNelcBZ5Y6Jk1RuRzX1hyTuXX0ssCMJw02TcKvx/A34yJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816309; c=relaxed/simple;
	bh=b2XR5Pakav/3MMo/79kII62sHng+0aTMFbd6LpYwJQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIFQlaqgpOmwIufabXA9kfPEywWyn/tcToTFHxLVgmuTmtPYIVRwHeK1xleEnTBf0hoBJYNerE4JYn4wtSrD+72P3Tf4cELYjXDK4LM/HN/V9BC1J3RWUgSxdtHphmkrK7VXxFBQg5NQbew2+lKRZUMpMNymmxiiMMW4JMcZzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYuB6fZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C40AC4CED3;
	Tue,  5 Nov 2024 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816309;
	bh=b2XR5Pakav/3MMo/79kII62sHng+0aTMFbd6LpYwJQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nYuB6fZ0xTQmE5Y9J/sjvdWY4t7Oz0iktzb7nA9F4ruDzYNKHmK1sODDpSptFdfmk
	 GbB6UnPwTvgpYyNwvOlwpsy20KHFyifH6AWorhTgNVypuvo0qRTOPE0jHNBQXEPF3D
	 GQzq+7gXD2ET8Xa3UDLakbnuOhNMgRnEEezhefgO3qJBybZDCqgw7z+FHsLqJ+u9JI
	 c/9a+zijVsDw1mE9JOTJCFRIgvQ5vi5Qbfb57WLT0kd0kiXJUx2jy2Rg3TldFp+pvJ
	 I0ZQJmEkK1Ax86qp7S/5tIQ4HAH2/bJPaPix350np4KftiAwAMBIne+FAMKwLEM06Y
	 D5rNIXp9geCVw==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 05 Nov 2024 16:18:10 +0200
Subject: [PATCH net-next 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2004
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-am65-cpsw-multi-rx-dscp-v1-1-38db85333c88@kernel.org>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
In-Reply-To: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=b2XR5Pakav/3MMo/79kII62sHng+0aTMFbd6LpYwJQE=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnKikuSWkVynddpVzDQcbfGiY0uzntGrTPcoqp/
 FLmLzolG52JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyopLgAKCRDSWmvTvnYw
 k6XzD/9B9agCSwTd8YHk+L42x9il02Kywol4fg7yGFJO+2YfSNqcrAEmnKJ20bbOTDhHBR/YyGv
 hrEhK3lc2623BkC8b2moHNLNlSdFQj198YyXvOj/LCCdc0IPVRo7UKS3F2rbuQF054fsCwBy8wN
 efn4uyNV94l3jydwpID95RscFb5rmTEqcAgGWGZRC/x0iNP191F9jtPW/SjaHQixBfAPlgy+WI+
 9p+c0oGj+AlzTAkETAQaA1x1gZQCjxNXyLuz7CaKkSrL8BEe6tC4UGHj2wTd/7xKcTuZhVYJyRU
 mhIjv2S4+REj0rGRIF5QrcprBYff1bpN0M8IYIX/VJwSNuZDwc0Ot+R/suZfiw7OBimUnqJdcR+
 LXYg4ilCgtxIR0H4SnHtouzsAAjYXPM0+JHKLy3w3s+B+ZpN+MGIl1RfyDamlBozB3zlIqfYldE
 vYg+McGB10gGmsBAXO1QFB/zKUkOxqdrXOp/bYz7RGD7QOhITnHHxbt4iYQjYquoma4hk3edhbo
 bavN8NR+mtyg+qiUd+IXL58nPrlKC+wTgpZDX1Ka9N+fIdnufSBEC6d0HWAInGqDsch3Cssywyk
 sU4UBBUsK3r1FZtpZb3QU1vfM48IFE06nTeoR+bSQZgGbwMKroW2TtO6sAmDIhG3t16KLPgY/Ht
 QMWu6L4YkIfVSNQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

IEEE802.1Q-2004 superseeds IEEE802.1D-2004. Now Priority Code Point (PCP)
2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
at a lower priority than PCP 0 (Best Effort).

Reference:
IEEE802.1Q-2004, Standard for Local and metropolitan area networks
  Table G-2 - Traffic type acronyms
  Table G-3 - Defining traffic types

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 8d02d2b21429..7dadd95cadc5 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1692,26 +1692,29 @@ static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
 {
 	int pri, idx;
-	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
+	/* IEEE802.1Q-2004, Standard for Local and metropolitan area networks
 	 *    Table G-2 - Traffic type acronyms
 	 *    Table G-3 - Defining traffic types
-	 * User priority values 1 and 2 effectively communicate a lower
-	 * priority than 0. In the below table 0 is assigned to higher priority
-	 * thread than 1 and 2 wherever possible.
+	 * Also: https://en.wikipedia.org/wiki/IEEE_P802.1p#Priority_levels
+	 * Priority Code Point (PCP) value 1 (Background) communicates a lower
+	 * priority than 0 (Best Effort). In the below table PCP 0 is assigned
+	 * to a higher priority thread than PCP 1 wherever possible.
 	 * The below table maps which thread the user priority needs to be
 	 * sent to for a given number of threads (RX channels). Upper threads
 	 * have higher priority.
 	 * e.g. if number of threads is 8 then user priority 0 will map to
-	 * pri_thread_map[8-1][0] i.e. thread 2
+	 * pri_thread_map[8-1][0] i.e. thread 1
 	 */
-	int pri_thread_map[8][8] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
+
+	int pri_thread_map[8][8] = {   /* BK,BE,EE,CA,VI,VO,IC,NC */
+					{ 0, 0, 0, 0, 0, 0, 0, 0, },
 					{ 0, 0, 0, 0, 1, 1, 1, 1, },
 					{ 0, 0, 0, 0, 1, 1, 2, 2, },
-					{ 1, 0, 0, 1, 2, 2, 3, 3, },
-					{ 1, 0, 0, 1, 2, 3, 4, 4, },
-					{ 1, 0, 0, 2, 3, 4, 5, 5, },
-					{ 1, 0, 0, 2, 3, 4, 5, 6, },
-					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
+					{ 0, 0, 1, 1, 2, 2, 3, 3, },
+					{ 0, 0, 1, 1, 2, 2, 3, 4, },
+					{ 1, 0, 2, 2, 3, 3, 4, 5, },
+					{ 1, 0, 2, 3, 4, 4, 5, 6, },
+					{ 1, 0, 2, 3, 4, 5, 6, 7 } };
 
 	cpsw_ale_policer_reset(ale);
 

-- 
2.34.1


