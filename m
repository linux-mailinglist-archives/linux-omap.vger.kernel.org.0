Return-Path: <linux-omap+bounces-4088-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CF3B00FD2
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 01:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112B01CA7490
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 23:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64633074B9;
	Thu, 10 Jul 2025 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZlGlZz8"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03307307498
	for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190964; cv=none; b=brFlHC0A3GhjAcwqVPF6e9pDXoYiFAxDb5bcUmLa0L9hI/xv0/OZ8Bdv4eKUTLxhn8QRDbUJjZcGIbbpKRuUjqnXSz4U/hC09WFGwZCrGpCh2Rm8lpVRbdmuOeF28nBAPhbtW/v8cUluOIP8nd82s0h/Qf+ObhIa/Zqv+REwHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190964; c=relaxed/simple;
	bh=jwHUuIfJpkKtUxi73mEQY+91PJvNh9g5xkFpUZRiga4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecB9BwcZXQJjpxEbXXKeKBv+K2HBdmpwdptHX4WKS7ZbsIHwtAaWtvXxjxLJ8sEa9bBrZaEvLbIbOX8lpcYDlSJ3yzB9vGFgliczY1BSJOxD+oHv7+slXcIQFttZdvaBDSTnqEZgBHHhgr+lRSLK0JsYZOSQnNNBe8A4Nr31WrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZlGlZz8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
	b=SZlGlZz8vRD5dg6oHkP2LdXGUo4OeMBz28p7JsRA7pjIEMJ1rJ8irlr2/cxKYbiMpjXeTn
	8Se+7u+gCVr3VWitF/YZrybNV0/trVPxJe553euzJmWr3F5bj6scU/Zs1pulrKobnSKjWH
	PNBHhPqgdwJVOi/aMaUfSwHhkETAsrU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-0sXvnL29MSaNab33JjoRKg-1; Thu, 10 Jul 2025 19:42:40 -0400
X-MC-Unique: 0sXvnL29MSaNab33JjoRKg-1
X-Mimecast-MFC-AGG-ID: 0sXvnL29MSaNab33JjoRKg_1752190960
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-704a8024e6aso865016d6.1
        for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190960; x=1752795760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
        b=rBn0XG5JwTk4N3o+mEUrowKXai52vI2eLBgUmVjqfOHN9yqrsVNf3f1jphq/t8HCx6
         Zoy8RooZ4D3U07UYcMyEoBt3UNkG4k/D13Gp3TTPg5m8MHCGOeyS5DCa+ExLix4kvohr
         629vQFtCNXqOM8nha7tscimuISci6TwAidLykrErjnM/btOIcWrAsxpDdL9bMRjpG9Mp
         sDtmETgumkDoMTNJK+2HmGurOF1aZf9DZGwhieLiiP/t+sCxvCfQAvGSc6Zlephs5Nmf
         6OqaXN4nnMPBhMaeKkaVOEs9HRUNsG3Prhp2xf8fBVhgzhK10DZEpKVqfpefpr4W9rMq
         i8bA==
X-Forwarded-Encrypted: i=1; AJvYcCVBkx045g90K9pQ2p9Zt83URqa0HdXg3SY43qIa1qSmjFajFa2i3Z2dyLcnGbu3HVtAfOIuUR7GFGnu@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGn3qIULPp0WuS06VebWLVbvY9JN5Rj61hoopwqIcuxqRV1OR
	xEBmpqzWnFivtNhL4lTqQRXbZMbwCMtCoTJXopi0XoT6PzOKSALkz8rCbmn+mKQJ1/SOHufMXW6
	VnTtd53etraQs9FWpRxxLb5ynZY5yn2z7Niu/oXR0cwmdGJzSxzjO5PVWTkuQ67A=
X-Gm-Gg: ASbGncuDsuVM3420JvuwTiM2wUlAYz3m/st0thGQkf6cgWEmJUmoTWjN17ljxJXkiuJ
	QUgbgf3hKw0F3VtNIeHtzn3+od3eWTZ75K9WS+pz52GfqDhwQ0OXcrkAp+ep8R31oMpefg7Y+Dv
	Pb5GpV1qwk+Bmfq3L0ZJhM1SYo41pspjANzbd2Q+fSBrvZ32wBxZbxSNST/ViKai2fBTff620fb
	mHrD/07oHNTMquntF/YolnUpRnPHejf2+sxC6YzkJU0Cn+RjhaKFyWTbQn6OQrNWIPV6f0JZ7/P
	h7Tgo7bEhrM1Xyb+HqkwvmERracioRrq/b9Ouq4BdxVCKi9yYFS4b74SthVNVQ==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206090785a.57.1752190960385;
        Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Qf90w3WAIU2WDAVl84idxN1ukujHZknm9tJ2hmS373+cRWGc+ayHL6trz95Fv5oRIp+Mrg==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206086485a.57.1752190959849;
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:18 -0400
Subject: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jwHUuIfJpkKtUxi73mEQY+91PJvNh9g5xkFpUZRiga4=;
 b=BvPcx1n0mHxD2gopIAIHjnh1g8w2Bjp39wDL14lGnKxt1a2WhjWjIRkC4v+Ur+bh9HIHtBv/h
 TZtY3GXOwDxDw5NimZx9GggwdDZr1X0VaLAtH8tcwEpCQzCkO8UueKy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-versatile/spc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 790092734cf6155daa63c44a1e5af00ecef30737..812db32448fcd415fa1a60f8bb971661369151e1 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
 	return freq * 1000;
 }
 
-static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *parent_rate)
+static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_spc *spc = to_clk_spc(hw);
 
-	return ve_spc_round_performance(spc->cluster, drate);
+	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
+
+	return 0;
 }
 
 static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static struct clk_ops clk_spc_ops = {
 	.recalc_rate = spc_recalc_rate,
-	.round_rate = spc_round_rate,
+	.determine_rate = spc_determine_rate,
 	.set_rate = spc_set_rate,
 };
 

-- 
2.50.0


