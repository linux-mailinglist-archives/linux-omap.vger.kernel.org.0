Return-Path: <linux-omap+bounces-4177-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66293B20939
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7826417AD4C
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406622D46DD;
	Mon, 11 Aug 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqV/Npl4"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642622DBF52
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916524; cv=none; b=c6i0876qKerwj08NuRCxuevNBJ1j7hwMmhWXDGY3AKE5OBsc3a2PqD3Z7Hmqg7YlJI4lCyvzCq9VrmgBIzYD9YMHwsMa0cGon1g9PIdHj98yloBagvojAh/4HCtZRheglnWyJKfJ5syyhfICrYIzjnRlwwTK5Jkyik9PjvSME4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916524; c=relaxed/simple;
	bh=d4r/MgwDOiJAMmN6yEZ45olvnlGBMIdC6u8+ioBthwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kx94dZFhusgL2yisc4s/e/cdWXFH/ACTzoox8BdDVR1/nRcgirUi1CJO6sy4NESu/9Sa2ZV/7Yld7V7x04zVuB/jRXt6yUSpKAX8qyrtFDuRQ26/HfDI7KKYjT8zyIVsqLvWSy5MSkb36zcizxfQQKsmAD4sB4o3/TVc2YsSiGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqV/Npl4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0FabGW93p0o5EPz68evGzI0JKQlCaJUZlHooFwdD+8=;
	b=bqV/Npl4hmVau0WR2bWNZaGTqsnJUiqRA2vXaaHuGNgM15FDk4J9AopetSFCFAq9GR6zv2
	mPsYJov0PVgi+jyWvuTpV5PeHuxyiPm1JhK2Y2lpuoAU06EHy6up+Flzyfm6OauGput0AT
	TJjk1UXe9E0pN7lGdHfKoIgpyub8sho=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-79tbUZDoMBW48Psm20RFOg-1; Mon, 11 Aug 2025 08:48:41 -0400
X-MC-Unique: 79tbUZDoMBW48Psm20RFOg-1
X-Mimecast-MFC-AGG-ID: 79tbUZDoMBW48Psm20RFOg_1754916521
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e82a101470so803269585a.0
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916521; x=1755521321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0FabGW93p0o5EPz68evGzI0JKQlCaJUZlHooFwdD+8=;
        b=wKu2H2/laYqIoR3FgDDAoKj6FRhnjP7jmIrBfUXyr964ooTyHrHXPlIQGh8PG09V4S
         HHr89pLof+r1vCBUl4uGd9tnhGL+wzZ4nj7Q9UdvLyPP+wy7Uba4nfoqUsv1c8kpnsCJ
         IEFRWateVLy1uvXZSrzdPSwoLCBLRpGA4AM8uAfjwlbfyvxpyFjEiJ+CClJxl7fNywpt
         jn/GZimR8X0vgKdzJ1bfFRnqDoFxjrmBJIqLpoe5YpNDPRPYlHhw3m0PiHqhgJSw9MEg
         LFOoqNENcz/i+CFA2YRgTjhcYjHBHS3+JgIbf/JbFCr/OcR+iUng/XFE3zyJPN06KQOO
         BNZA==
X-Gm-Message-State: AOJu0YzJ+RvFgSXONsH4K07nE4/KORQqQfFtzYQXpELZezTpXO0FAgQL
	3wkd+t8l/225FJa93SEVEyjvO4lxdISclZ84ZOLQng0hj5iNnCj4/d60kkNdX9ejDPGeUXQryvh
	1l/IJs1/5js4jtvisbB2uGLbTm5f8X6sCSHzayNvraNEiBZ6sBZozyobS/CW8g7E=
X-Gm-Gg: ASbGncts6N2iSARlZv6oWpzXjODwl3a9gtrEit88nA622udRjYec9j9IKDUkopFSzgF
	3vaa4y0EeraaMi5CnXdEbMD5tq29rfhpbV+P/A151lxfpYFQ1vqnU6EA0bRgMtQ1qxR0kXxKbF7
	tXW3urWDmcHPwppLk/RLQqGpn0LKYhayNwSp2gYjNeNOA3Is7ix6rOzfrgNX2qqsr/Zi69ia1nj
	3aHKTQeddfDAaC2M4EQH9xqrMDPdEeZ0Sa03Mahmn67zYolTBY08y1veeSASR/uLxwCHZLJz5V+
	prRU4IXsFN6g8TuyaQiK9KaINLTJAhsoKSMOeGSuOOt4J7ij1Ib3SCMNGl/fegVcx2XLU04Y67I
	dHzA=
X-Received: by 2002:a05:620a:4556:b0:7e8:34b0:6dcf with SMTP id af79cd13be357-7e834b0732emr1628906485a.5.1754916520753;
        Mon, 11 Aug 2025 05:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH5IG1XDFEMzQnjy90UyXWsCI+yyADgd+lMpmJS7oWuILs7scGAfZnwRui0gk7c+GtmHKWGg==
X-Received: by 2002:a05:620a:4556:b0:7e8:34b0:6dcf with SMTP id af79cd13be357-7e834b0732emr1628901385a.5.1754916520169;
        Mon, 11 Aug 2025 05:48:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:09 -0400
Subject: [PATCH 4/7] clk: ti: composite: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-4-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1303;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=d4r/MgwDOiJAMmN6yEZ45olvnlGBMIdC6u8+ioBthwU=;
 b=ZXYI0k5UF214vcjvF2S5pTp2vZZGvwDBNbWPCyvcQChrwBFslhaaWy3Uye/F5OEI+WDcrXqb3
 bukwMYnrZdVD6xRhNkTv4k1shexBAsgCQNHEasZdWAnesixMa26c530
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index b85382c370f7e49ae320c6c47152a2675ca36645..8cba259188d412fee179efe0ffc5df627e42e3eb 100644
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -26,8 +26,8 @@ static unsigned long ti_composite_recalc_rate(struct clk_hw *hw,
 	return ti_clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long ti_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int ti_composite_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	return -EINVAL;
 }
@@ -40,7 +40,7 @@ static int ti_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops ti_composite_divider_ops = {
 	.recalc_rate	= &ti_composite_recalc_rate,
-	.round_rate	= &ti_composite_round_rate,
+	.determine_rate	= &ti_composite_determine_rate,
 	.set_rate	= &ti_composite_set_rate,
 };
 

-- 
2.50.1


