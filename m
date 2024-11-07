Return-Path: <linux-omap+bounces-2606-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1E9C05D2
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 13:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 818E8280FEA
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 12:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E97D20FAA9;
	Thu,  7 Nov 2024 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqiJdeb/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7720EA2B;
	Thu,  7 Nov 2024 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982584; cv=none; b=dzKcZu5Y/dNTUKRanDzqzFLhYbbWjzYVcW/LSMmOGW+rYxIzGqQmc/qL9TmC/RlFU4oEP+uIwDm6bjY0X3r6E6cb/uHatsnKVtymXbhxVV//96GakUknyCqiH0UIyX5tdr09J8KJTi2+kyaTwZl76whoCmr21LnvoA7j+vzOqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982584; c=relaxed/simple;
	bh=HYE0o7h4YzrGMEJvvWA9I99aQMcFA8E5/vep+qX51f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KN1Tudh/6XhMlonX6deOgPTstaFjf4QZVW73dB/37nai0ZhnbLsv8MHF/lM8GhLiO4lMeZbXZELOoEhstlaQoQnFCmepce5xiqqxAnuiOTaPCRs6tdV3G95XV68NEqbfn6rnp7qlmJRl1a4hq9TeorByTn4/s/GuKzcS/xAAAn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqiJdeb/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E657C4CED8;
	Thu,  7 Nov 2024 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730982584;
	bh=HYE0o7h4YzrGMEJvvWA9I99aQMcFA8E5/vep+qX51f8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqiJdeb/eYkoyUnlqpG33DQZFIXgIJEOH4SndWthoAVKUmQ0SgMQNYsyWROPdoBHm
	 JKroqnMGl87QiBI9KxWHMGWlVSV2LgHZ1/1RJ9TF94cz0SIuPQIRQq4rBd1LnpWOZy
	 QfTTHP88IyMDJ/RX/BzWHyab54aCZj0hT2a4QeGm+9Tz4Cjw6lPWClcUliCp3+MJn0
	 9z2hHJkjLliXNM3CmRRWhclhQFP/oXfNn2JWBcNPLgRsKUSNzmXqlT0YzTixkY+7oh
	 yIvYveA8tphAPDeEvby2d951UIbyDMjZ0wKBIPdRKguA7UpiUXPMvP93u0qNHmZSB2
	 9nwOCsGizY5fg==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 07 Nov 2024 14:29:29 +0200
Subject: [PATCH net-next v2 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2014
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-am65-cpsw-multi-rx-dscp-v2-1-9e9cd1920035@kernel.org>
References: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
In-Reply-To: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2927; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=HYE0o7h4YzrGMEJvvWA9I99aQMcFA8E5/vep+qX51f8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnLLKxhkAuKcBmCjcgRA9KUkOz7LoNtEbxpP05W
 mXSOLBkqwOJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyyysQAKCRDSWmvTvnYw
 k0BWD/9QrGILbsNstVCEarNYG8xXxeBcsnzxHAttg9YiJqkgzSpQ5KFWWJHio8Dqn782TriT5OB
 PBOmAZyE2ZYIfj7RaFqqLgCWGtdIx6r1Xnm4bW4nZHdp6SbOOBNmvdLZ+NvEQVB3gsQrfWZfHHE
 YBBF+dFwaNcKDB0pnHPB27J4++ZghGJW8RI+7cWlFj3nHl3BnsGq03c9gRzyEazYpavqVDlX8uZ
 X4VolKikrKIcMxBtfJ1SYwcUDqZNBB/RhZpp4prDj8QSPBHXIDxcvXkHVcBBCBHxy9P6Rof2qCL
 w+Z0klrgCdn+by09uRsH92FCUnNAIoH8qYHw8+VTICXxuoPESZKQdWUN89kAV2964DOmoQHGy08
 5aqu4IvfnK88jnSKS256f3CBXnWzGCFODkIKrDbN8H3BIJBKgQduyUwE0JXiQzQKAou0EQp904u
 iME9WRD4SJz6S/60nAJcoyzsq74yZBzFtA8PKWAXk3IQimYeOll7XU5mSN1Z770gruXcDDkVY6+
 YIr3z4Nm+fcLzXHWddiYEAvLiQhM8CGmnh4FxBtM4iQuD3AaZ2T01mgwKvlVThiFG3g9dOjAKaz
 H3L0nkkAabWRVPX2Vx23xNkCH0aPydcmZ33/OjTsZ+UJOoI0ZmBw/OIOQ+wDPPXq7mBLFLuoF05
 5ao3Fl6ihk93SSA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

IEEE802.1Q-2014 supersedes IEEE802.1D-2004. Now Priority Code Point (PCP)
2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
at a lower priority than PCP 0 (Best Effort).

Reference:
IEEE802.1Q-2014, Standard for Local and metropolitan area networks
  Table I-2 - Traffic type acronyms
  Table I-3 - Defining traffic types

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 8d02d2b21429..9f79056b3f48 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1692,26 +1692,34 @@ static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
 {
 	int pri, idx;
-	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
-	 *    Table G-2 - Traffic type acronyms
-	 *    Table G-3 - Defining traffic types
-	 * User priority values 1 and 2 effectively communicate a lower
-	 * priority than 0. In the below table 0 is assigned to higher priority
-	 * thread than 1 and 2 wherever possible.
-	 * The below table maps which thread the user priority needs to be
+
+	/* Reference:
+	 * IEEE802.1Q-2014, Standard for Local and metropolitan area networks
+	 *    Table I-2 - Traffic type acronyms
+	 *    Table I-3 - Defining traffic types
+	 * Section I.4 Traffic types and priority values, states:
+	 * "0 is thus used both for default priority and for Best Effort, and
+	 *  Background is associated with a priority value of 1. This means
+	 * that the value 1 effectively communicates a lower priority than 0."
+	 *
+	 * In the table below, Priority Code Point (PCP) 0 is assigned
+	 * to a higher priority thread than PCP 1 wherever possible.
+	 * The table maps which thread the PCP traffic needs to be
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


