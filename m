Return-Path: <linux-omap+bounces-2684-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 557899C8C13
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 14:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F5B6B2BC14
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AFF2837B;
	Thu, 14 Nov 2024 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKh5Stmc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F0210FB;
	Thu, 14 Nov 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591431; cv=none; b=UCPBDrHP/bsIThzWye6XF7KsiI4SfSVzJ+uOsNKYzICkTukr3t/FiT0m3PqCBfTm3DKySEaaTtDZygSFcYoI9EeDVg4sff89lbNiNQ43vyM8UfA6xzD+vU5+AyhgRytF5D48lyFnk5t4r89kK08FCjZPE5X92fqCaTFMjmbczo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591431; c=relaxed/simple;
	bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoSX1HfxWY7JeaSLubn1jUWIv41uuni1Yr6KZX4jFIWBgWnBj+GlUZNDI9mZSDef+tdGqOeklgV2q1UMe6E5raLIY/ZK+BqInZwgmyPdAyKekbcknk+P0+SlK0/QZin4844sLfxoJK62abzedpLNF2u1b0R5ysNGIBcscshpioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKh5Stmc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF32C4CED8;
	Thu, 14 Nov 2024 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731591431;
	bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qKh5StmcVBtM/I/ZSER9ZsAy93sMeBbJguRosTsmTZ2N/tpBZujoXRsnBMCbwFKYE
	 0eecR2BFdinknvUuzO3vhO/Wgkpjby408lYVps9nQoEZZtwHCXaBwOcdBIP1s1ul7Q
	 F4dz4xAR+sq/2t2r5eOYYlE1TAV52jUtmvmsDVyRUe5uFLVX4tpOSgn329h6ZDkP6n
	 Xiy7A+wrPnEQXzOPgNJhl0vbRm853hlo/K8oFlPtMKTC4Ilyd7CxDoMIq9FSb91uzN
	 DKn8b1aSEdQWjsGCBFfwVAp/YwtARxFggSOXbYQtB3kZv6G3VvFeVN0xvfwS4Sh+oa
	 IjzNFsUtG5CdA==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 14 Nov 2024 15:36:52 +0200
Subject: [PATCH net-next v4 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2014
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-am65-cpsw-multi-rx-dscp-v4-1-93eaf6760759@kernel.org>
References: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
In-Reply-To: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Guillaume Nault <gnault@redhat.com>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnNfz/v8cIP3B7VtnfeDCJMZAu81vTLTi1HM1W7
 3r4QxFCer+JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZzX8/wAKCRDSWmvTvnYw
 k2zED/9GragteYn3PLE5hfVQ+5wvS2F4PIBWzcKKjEZKm8mMjZvEqWlPQQGpg770edHmHM8Cn0l
 ASSAPukcG1Ja86mclzWNITqY/MI3EqUY/w1H+XoBC4ik7oDtniHLE3I3LKJZlHtddKw5awvx8e2
 zFvqm5KRNIyIhfuLlS2YEpYLOwsu2BA9L7M7tPzEwvvnS0GcfkrZnS1WdSQlSFq55BBZw3qIgMt
 Er0LEiR3L3cXmfYZtt4w9nXbTSrQSY19n31WgXNubfhfBtH10TF6b9SMLTa2kt3uBCuuPAg2iV9
 /8SOabUMY33IU9dY8U30C4q/Ya+NIeDa2ceBz/bWw9rZD2sb0oy1CPm92MxEOa4c48Z6hG0kngB
 rJ5D7Gt9RLxR1yNECDWraQLhL8Zod/lQOOvsl3yX2cMoSp5VM8txhwIwvmTGY46jEC0C4LcvWDV
 MX4nQtN00H0EOb9gONgnaF3yAmXee8NOsiC6xne6rHXP7LIP+6+nQMv2OS1VCfmIUNrIYdhgxPI
 cLEukDBvi2k51OXMqHha8GtLHdanAVHOPEbZ1rRd3V/OOvmJu5rGy2/pp2MaKBr353/iK7Dze3g
 3ojKd+B/4RVn/zGGTRaA+ksmpqfCa1s4gXO49SnhnMJiDdmcXYBPg97dkID60aCnijLWE2q7+c2
 jbNdm7vNXNsyaPA==
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
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
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


