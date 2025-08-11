Return-Path: <linux-omap+bounces-4175-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE4B20936
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4387B3641
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0D12DA758;
	Mon, 11 Aug 2025 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cUebUoAW"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859C2D8387
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916515; cv=none; b=gzT3Yz61Up1/tzSZD33D9XkUXf3k8EuPx454u0VKpJ/TjnLhwZEcA/ve6PbruAoYmh0+W+sByRpBspufW4VhqgNgekAUWhtyw1ShR3PUaSBz3QwKOD8tyfHuCIsJwNSoKO2HAxBeZ4vh6vHOYuOTI3y/dHubz6Bnib2FvczC3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916515; c=relaxed/simple;
	bh=Z/Z8aNwjy/UKmGQb7dk5/C7R8VIWNkrG3ytaz73rEYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2aXO2DC6KPrbrSnjIG8AY6duKNbQxvZmYC8uGLNxR8HFyuqsl8Adf3CCcvxUkr636pAiosIY1MKxpUPPwcnboFoc0NjkJMnntQheGYktunj+E1x3aqiZ0GpiaeMytt9gBrvow5yG1xOz5j1MVcPWwt4M5xrNad3zHv7bbgAnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cUebUoAW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BegFxwY4bB32r47TdTN8tAF4AdmY2JQsv44/XYcFCFo=;
	b=cUebUoAWr0mHr/zHYYFQCCwBX3bk9hu8cVIBRKsQYdwyqF8EbB5GUHup34ib0mx9ys6Lql
	IogW5KUTKJs8Ik5rMg/mzJkiwiLXwnJPIU3rl93W64pqHklBRwGffnQN4X6js3I5egHO5W
	R1QPUrYjuqkehWypjBu+vBTmDmtn+vM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-G1jSjW62NtOyUZu5Rxf8Rg-1; Mon, 11 Aug 2025 08:48:32 -0400
X-MC-Unique: G1jSjW62NtOyUZu5Rxf8Rg-1
X-Mimecast-MFC-AGG-ID: G1jSjW62NtOyUZu5Rxf8Rg_1754916511
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08431923dso111655611cf.0
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916511; x=1755521311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BegFxwY4bB32r47TdTN8tAF4AdmY2JQsv44/XYcFCFo=;
        b=il/VAG8/ZO/QUGJTTDl0EedZCX3GWvchqYM2DHweMf9HIzYPSjch84nEQNSpSHQqds
         o+p6HfuhmTAXbUmZ0BSyfbIVE9branDJjicZUOeXucHFC6+AXrfUbtdP0Fl8UHDNfDJc
         lHLeYitB4ayz111hi052yWWO1v0putaZ+Cc5axQFsEO1WZvaYsjH4fZne4FqsjcPXKbK
         JMsnJpgJuKp60MOs+ua4Lhi74uDX9KRYh51VSyJm9t4az72IM4RIKrkbEtRcJhIflbiJ
         Wt9BH6E/qhKEuEVr7JQ0A0dzGSPkk3uE3JKTBgFzNlKnEr1HZjB2x+cGSq0UvM+cGx5S
         QVAA==
X-Gm-Message-State: AOJu0YyFdaExxVhRJesRr8rZ3LHemnhYclFv5n/Zxc3iOkBHBW1Lw+BY
	Ge5yGb9iEQqz59WTcAHdh3vbZ9Hs0v5jYvTmW3X0gt8nUugtEXNDiZ2Flntd5lbASmTkVvqPK7Q
	+BqHwEu6d372pDHPw8mgwIMuTGryHF5oB+MBdNtgjmZSf9iZMZ1anuA0mSIMCYd4=
X-Gm-Gg: ASbGncttyMMlRWRNY3s99Dg9BFr8btjyZrNCG/krbjdcGIu3NxPotWV7hohR+VY9G+v
	baaNZLx97tGdQDO4vmuCZRUPDASTN4RR/g0WJDz6Bef0I1SvritrKqye2TDZnzqcHisR01Xylgh
	V1TV9+8jLrFLpd5ZbnKufWZ94t+Hy2p75urD2BYYTVdN8I7Q0Bwy1uIQONUbRXwdoKxPL2iOT18
	D4YK3mTt1hAtWAIjBrNemvveEzZGwsfaSdnhyaFX/MLO5QxvtAp8mjwlA8KRxQ6ryKYx6eaK8y6
	cduDAk4sdrkv0nukqO3FoJ+qtU1AL7KEoUqfmgiDKWHoUQbeCUAhGNa/NxgMhUyXry0VbXrDstG
	9u2s=
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr78690781cf.33.1754916511134;
        Mon, 11 Aug 2025 05:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8iAqFt+pVv6B/yoMCzQxz/7Jr3wwJUx8Cr8upJaSFiLU1TK2hQD/TeVZHYoxHNpp07QBXag==
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr78690371cf.33.1754916510574;
        Mon, 11 Aug 2025 05:48:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:07 -0400
Subject: [PATCH 2/7] clk: ti: dpll: change error return from ~0 to -EINVAL
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-2-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1755;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Z/Z8aNwjy/UKmGQb7dk5/C7R8VIWNkrG3ytaz73rEYE=;
 b=J9gUf0U1U5jq8sGZEfz6AEmIUDhkUmMSeIZZYSu0dbqaAVuS0vdyu5EjSZOZiuMAUcRlcCwZb
 Fe8jvzOxIOuDPrsHiJFffOGHuTTuNmlFlQ/8USEG6GDyc4rGrcWmgcn
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When the requested rate cannot be achieved, omap2_dpll_round_rate()
will return ~0. Let's change this to -EINVAL to make the code a little
cleaner to read. This is no functional change.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/clkt_dpll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clkt_dpll.c b/drivers/clk/ti/clkt_dpll.c
index dfaa4d1f0b64b8e3606d928af7cef701be3fc677..a8c0fc20f791689c74868b98810b1af2c78b18c8 100644
--- a/drivers/clk/ti/clkt_dpll.c
+++ b/drivers/clk/ti/clkt_dpll.c
@@ -277,8 +277,8 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
  * possible, programmable rate for this DPLL.  Attempts to select the
  * minimum possible n.  Stores the computed (m, n) in the DPLL's
  * dpll_data structure so set_rate() will not need to call this
- * (expensive) function again.  Returns ~0 if the target rate cannot
- * be rounded, or the rounded rate upon success.
+ * (expensive) function again.  Returns -EINVAL if the target rate
+ * cannot be rounded, or the rounded rate upon success.
  */
 long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 			   unsigned long *parent_rate)
@@ -295,7 +295,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 	const char *clk_name;
 
 	if (!clk || !clk->dpll_data)
-		return ~0;
+		return -EINVAL;
 
 	dd = clk->dpll_data;
 
@@ -360,7 +360,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 	if (prev_min_delta == LONG_MAX) {
 		pr_debug("clock: %s: cannot round to rate %lu\n",
 			 clk_name, target_rate);
-		return ~0;
+		return -EINVAL;
 	}
 
 	dd->last_rounded_m = min_delta_m;

-- 
2.50.1


