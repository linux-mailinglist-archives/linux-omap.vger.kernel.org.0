Return-Path: <linux-omap+bounces-4179-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA12B20940
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 250223A8315
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FE72DCF56;
	Mon, 11 Aug 2025 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mai4RK6f"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEC2DBF5C
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916530; cv=none; b=BlGtW5SNIBGt3IVsotL+Z5pR5LF8DCfufUh+oUjpijJhm2deVM1wAyjsTYWuuowLIAMxHGEMReHVN29KFOaSA5p8LSo1qF5Q/pzPXGzXL+f9wIXA0pze3qdW/AWZRlayBY0cSdrwZHEOTfJUBVOGs/7uF0GZlltvgODLFvQ0wsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916530; c=relaxed/simple;
	bh=l6XgJ6W7yha/WW016u8LdUqKQRLgIir6odjd16bnNlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKBTn753kGnsLZ3V+4GtP8DtX8+dmmLGcewvGn4x5E304qnd/yXpQJNkY/Q/OZewGHkNy1VIxB2znWOlmJsuJ4E+Ygx+l3YvUFvLXSxEKnYb/PwBP+t/Lw+dIHaBfhWZxY5ZUmWW7e9XtiSWo5TtfAbqW0ZBhkzuYnK6L/mlJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mai4RK6f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEtISiukDB4UA/wwqndztsPEY9t1/gC9650XSLJtvzw=;
	b=Mai4RK6fSxtFRKB6I0iiewOn0+RhulAGlNDsDzRx4hpLX3tj+ec3i3RP7rceqetxLIYRnK
	bk09WhCKdlSbS9zfqiW2XqZR8ATI5XEIqo84G3GtXZzpQ2YcuCFcPKgr9c+K/2LPNA5++j
	Hiv+Y/ryXl4Gbtl0hToEEEOqAEFeRe8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-nYRV7yb2OZWI3E1RUjUINQ-1; Mon, 11 Aug 2025 08:48:47 -0400
X-MC-Unique: nYRV7yb2OZWI3E1RUjUINQ-1
X-Mimecast-MFC-AGG-ID: nYRV7yb2OZWI3E1RUjUINQ_1754916526
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af156a27b1so169846461cf.3
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916526; x=1755521326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEtISiukDB4UA/wwqndztsPEY9t1/gC9650XSLJtvzw=;
        b=jvS9mEtrQR7yNIZ/o7x5cVFf7l5fQEAKoIBY/rUWD11F4vMAdw8JPq2CKyTtfZ4hAo
         dKzXqUos7q4ocivPopqYS823BttWzw9YT9IDZ4oYr7hV30zmc5lajh9BZ4yixR0AlXiy
         2fc2zalR4CZx6fVU3XhkIVp8u5Cky2boUyJ9sjeEsAOmnjHJQmpZF+cb+0ZOvjzhO3ES
         weUMSfH5Jtt7DkuEq44tX5Tsvn+NMVBQhERsQaBGDVM+JwwWCke2mB4FwybkzOe3qAVl
         rGhzRnsbkdcHvW2KLUhBXrC0cb0cOnjKWXbocfebXtw4qE1loQGIXrjNypYZW7wKdipz
         NL6g==
X-Gm-Message-State: AOJu0YwQCtH9PsQUitc6mStueKXDJZMUxcwNwu9m6AsA4ory4f5pcori
	iN1lFVENexmYUNBVidK1QMA31fPDVyy1MiQgd63FUyboV+H0nmcfYUWgnnHuXyMLWm8oV+cVDbl
	KgeJ2xs6jREGCa3czDaqjGDDnkRvuHwK9+bkHDYkSp4HjFhaLZsmdl2pRCodigu8=
X-Gm-Gg: ASbGncv5SJiwEi0ZFKZ+mKxHgh4fC1BB2JTf0Gf44/emjh9KJLrwflpJ5custH/Iy9l
	RQKETPg3U5dE2kO7ysARNf+qEnggJaxTOMEpRa5n5eUBELL5CTOTmAjBfJOvIewasquCcAHlxc4
	mDwSwotbEPeHfHp43pPjHzPUQTWzWCj77PuWvRpNnyMaQK3jyg+xaFX60C1H7UVm7w1sgz//MIh
	h7KTYLKWCP0oKbK+jQF4lLlAfThFQJCmnMmdx8S+QwKJ0QmGbhblu/hy2WZhR6PpSmE5Wm6aVWH
	VXjSfhcvocmWqZXWxpoossSXCoOnYWEhsVLSC6aQvO73xFNyRTAOY9kUM32JmpfZ5yPBypkJ25s
	/Zo0=
X-Received: by 2002:ac8:7d46:0:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b0aec61311mr154359161cf.5.1754916526312;
        Mon, 11 Aug 2025 05:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuajLdWHinQz1T8shERDjeevHqOrAQDwpblwaApX8japUOJDgE5x28sAgJW4p3Ei7BLjtm8Q==
X-Received: by 2002:ac8:7d46:0:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b0aec61311mr154358821cf.5.1754916525875;
        Mon, 11 Aug 2025 05:48:45 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:11 -0400
Subject: [PATCH 6/7] clk: ti: dra7-atl: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-6-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1630;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=l6XgJ6W7yha/WW016u8LdUqKQRLgIir6odjd16bnNlg=;
 b=n2iLjG9nS7jOmK+UVJevc5Xa5r8KpCC7ggEeWCcVvPhhhsGoThO6dmi5mnXDQ7f0SjWodiNh7
 OICvVHC6qGwCevKiZrShkiskzIyE+56+lWC/ZlUJVesZbHlGF3hDgyy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/clk-dra7-atl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index 0eab7f3e2eab9edb18a5f881ce329db1abdb5be0..b02f84d49b966ec0e14a4bf89e39306048b964b6 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -120,16 +120,18 @@ static unsigned long atl_clk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / cdesc->divider;
 }
 
-static long atl_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int atl_clk_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned divider;
 
-	divider = (*parent_rate + rate / 2) / rate;
+	divider = (req->best_parent_rate + req->rate / 2) / req->rate;
 	if (divider > DRA7_ATL_DIVIDER_MASK + 1)
 		divider = DRA7_ATL_DIVIDER_MASK + 1;
 
-	return *parent_rate / divider;
+	req->rate = req->best_parent_rate / divider;
+
+	return 0;
 }
 
 static int atl_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -156,7 +158,7 @@ static const struct clk_ops atl_clk_ops = {
 	.disable	= atl_clk_disable,
 	.is_enabled	= atl_clk_is_enabled,
 	.recalc_rate	= atl_clk_recalc_rate,
-	.round_rate	= atl_clk_round_rate,
+	.determine_rate = atl_clk_determine_rate,
 	.set_rate	= atl_clk_set_rate,
 };
 

-- 
2.50.1


