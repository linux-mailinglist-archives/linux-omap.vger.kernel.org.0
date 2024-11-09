Return-Path: <linux-omap+bounces-2647-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD89C2C0E
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 12:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02BCA282161
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B0C156F34;
	Sat,  9 Nov 2024 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4xVwyUG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D621474BC;
	Sat,  9 Nov 2024 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150022; cv=none; b=mitKPQgi0Kd102t9yUQSIqijDc3UqYC+XwSrG/BPQTXN8kuhrWgITG8tc7D0920A2hOpKW18iAYBlYTXp3GR5pJuEaHicNPYKGtmbBkl7BW77P+ulojW9yMjJpMlAzgFs6SwftFs0wgWoy5gFejiJKDJYaCFt2dU/VhLwOC8oUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150022; c=relaxed/simple;
	bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtInFj7J9xRXpCUV7cPOVtDrYbwixES2m58Mhtx0n43cjtpiQnZ/svmefBmD6oe3FhCMKu7EiYTdQVteUkHr6EvzCbgXZskgBsBrfGrv9KfpG/dR9fkUmlj0KhZplIqgXwjVhqss9QL1RlHmd1DiMz04FuNZGnFU3E6yHoOY7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4xVwyUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A602CC4CED4;
	Sat,  9 Nov 2024 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731150022;
	bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U4xVwyUGntD3G401bT/ozIj63X6LlJgvaSVu0IK8x0DvAFTZd2MZg6PlnZ+E+7hHM
	 Gy6Sz/zz6gmAv1F+Fj6JJKx6gQkrikkuOTCm5xdlm/4JyU3JLqWF72sfwYenLHKEFV
	 //XLYHzIQfoboob9TOBQBoDEYNwWeuL4XB3lfrdqQBRtUk9m5FXG5iCXVg2vmXGd9e
	 N9wG5kU04pLP2UZjjEYTfgEoUSs39xhWMZ9vgE9XWNYJBAhLW/ncdcyD9YZm+YHYR9
	 xH+Ofb2eCmThCI7PyTi+sxXUYwvr1t06Bld/lJ/X1AT0g4JSRH1oohHnviDgM30SGE
	 sj4WpHTGLKKtg==
From: Roger Quadros <rogerq@kernel.org>
Date: Sat, 09 Nov 2024 13:00:07 +0200
Subject: [PATCH net-next v3 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2014
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-am65-cpsw-multi-rx-dscp-v3-1-1cfb76928490@kernel.org>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
In-Reply-To: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=nH5ZbJEfnNtqpVAJdxQPimoXQFIYYcfa/hUchSNyuLA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnL0C/ZvSqh4fZ5XX1yNqY7iyl1erdOCyhClcLe
 tqTz85Ya3uJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZy9AvwAKCRDSWmvTvnYw
 kxd0D/4hHEBWHfFKqqEJrX6ibTbuep29SUU1LYdC/W/eic0dn8tBX8ccKFWKyiSo0hVQQFM/Ezn
 fQUZYQ2Ms1uuQ7RqGIHWpCGJKZbLNHFF8K40gpY+5WvHHu0Q0pNsNSsCkh66gyJhyRrM4RFvVsx
 LKlgF4zuRzOWhl57aEZVEJq5K5wvJWgl7Hnhwx7wQ9KjTyKIZuwjIKj3uJYnHJJxWV46EZYVTS/
 f3mUSpiHZLYDuJWvPoukiVjOlavlUXoDLwZx3mklsACdIgx6e21t8ilAkpmuEf1EMaIqYYfYlR+
 upwfJLF9euR6jTe0ClONa+K1ngITYT0ZxixUPLowR+Qeo8ZVmdZc4uYVty4E0cOn9q2P4b7W+eZ
 I64sIHuoIrqh1ZberjFDAO87tcndZm7cTK+bUDFQ5kKmEorLnJmtY3MQHUvQNc/NZxCTpoBzMxi
 EAa5sFOai5PT4/T6UMfgW8ola1bJt/nsA1q+d8DrrxBOrX1zDzYz+zTx2Y4+VGUTgQn0sYsIATg
 GGkkFK8veV1U3BQ8SgjDBYdTE4jpp9pss1M6+nEti5uS9dryltqNPp6SmXqggW0U/qxbEi1vHdK
 8jbeqS5ixQWa1bTplC0IhGM4CtyJytznvYKXFbIBSob6mzsPvYudPbv+SqRiTHrOKgbFoqf68sF
 uglAwpG/77sRvAw==
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


