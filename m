Return-Path: <linux-omap+bounces-4174-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DBB2092E
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9674422A60
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D79E2D3A71;
	Mon, 11 Aug 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKaVTRNv"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374772D6608
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916512; cv=none; b=RdFDG6Q+Lx2D4ZfmxCbXPV4KciWtSYS5/tAGaMYP+BsENusqK4THwuoVnCpRP1YYBxZ/6JU0ZbpDzqKa8bZepvKHDAwJOWMFAYIqLIoGhSL4KxdBWpoWp+l4qT/LgphupX5oY5aiatAtXh8CM9twxld/ibXi2W3B43A0GdafpII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916512; c=relaxed/simple;
	bh=797B/i7zAYqS3C3fUwjFhBm7v2UlPo/3f5vR7+9WseU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWFp+GN8OaWVEXJgHPZWrFzhnji3594qzglUwAnZURrLzyIbVDXuoPUzPBCpShxONT4gp+Tg//X9sKDC4QytVHSxMgp3OIeMjcCopF543jJTv0N0C0Ka9OjhKnVb9DneelgPhCe+R/xoQTclhhW2UXUhicJHlLJkLd8zZoEPqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKaVTRNv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjrMZnWuasomCOeyOdrJf6baH8sgZvlHk16pzYaYGG4=;
	b=DKaVTRNvXCzrZ+rfPqMa2LtjykOeqOSfisXBl3Joo0nqfNiNlA6xhZ5YkOHjq89gYovPtu
	TCnAyKVAdX+/7HQNwqqByytO53AscIMPwFcfR49pV0J6xWsWMmumW9EeC2/xfqjGQP3C7S
	kqTctt+5Mf6gTqhiBbIzjHNqDUawV/0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-6Ab8vS9-Pq-yFy-cUniBjQ-1; Mon, 11 Aug 2025 08:48:29 -0400
X-MC-Unique: 6Ab8vS9-Pq-yFy-cUniBjQ-1
X-Mimecast-MFC-AGG-ID: 6Ab8vS9-Pq-yFy-cUniBjQ_1754916508
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06a73b580so63863861cf.1
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916508; x=1755521308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjrMZnWuasomCOeyOdrJf6baH8sgZvlHk16pzYaYGG4=;
        b=BBZSykNQ4Kd4XpGVwA6kIYYW+m7euz6zF+eURBTg6zB2IuXYLljmS/yHB5cFLcPKqB
         IPbaEhgsg+xB5+OoWjeHzoVGijO6oe2ZHnvyVuzwiSzYqOpdSdc/wCUpU+ZhYlQB+Cz8
         0ABXLqkXB/o9c3BGlbM+WmMH27RLZ/rAnYbnlAeieO1ElqotFTun0ZSCLlyEqLScIKsE
         DwkquJsRAdF2PMybidkjIeAYaj59BR/AT34EOuDyrrbP0CLhiZHJ/DWySnrgRGR3t2v/
         t0kjCkKjEJlbQdHo2eXeFq3sWi35kzEP4Enegq9RzV7c3HBPEA6EiQ0qrERlV9kNCVGe
         bz1A==
X-Gm-Message-State: AOJu0YwPvu4l7HtcRD5N4pJ68TjO6+FbN2K8T4o0p4O1SIzexhBYER08
	rMgBMjo3Ec3jXbaG49dUPpCOFjhw73dhh39SXnfsKo35VDz1Wsx89Cl0KfmKuyqFifLOCa8CeLg
	vut/IkRVns/y5c0rjcznmi5QMqZWfzbPKK/SpFbGgvXTZEm0ZdLwflETgHJT0XxI=
X-Gm-Gg: ASbGncuyz0eZYWFs3BwcXQeZxtHJOmPLjwDFLXOBrndlhQK2ZfUT5hTU8DJ6CojsH3i
	+h4w8lwQEtBL9b44DbQvav1o35Fb3uA534pgJCnx38w7XrR1QlbxF233gAD3XsO5IPzLgNfgL/u
	vK2LvnJDp532TS22QwBZlCUL0STavhUaGHrnjz2V7b4uMrbZ6l7kJSBGlThKrJfI3T4LuPUPvMG
	EOdrsvfEtzIoyAZWJVEVFU1ZqxaveXGW8Oxp5JT6kQFS2xvi+uFM9uBe38JWRAKjBXV/a4kFmWN
	iQ/uonuzex4tMHn9qjKK1KJfwPdKUYitU8bhIOr/72g/fz0nP6rMXaEsBppVm24+i0rcYQ/40Xz
	TX0w=
X-Received: by 2002:a05:622a:1347:b0:4b0:62c6:74c3 with SMTP id d75a77b69052e-4b0a081698bmr223865731cf.22.1754916508368;
        Mon, 11 Aug 2025 05:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ6N8H2X/Bvn+Au+kqGnuF5oeyYWPX+3WMtIqSB8DTDsMJq8v6IX3eOUhsgPzL8VhHHDNq8g==
X-Received: by 2002:a05:622a:1347:b0:4b0:62c6:74c3 with SMTP id d75a77b69052e-4b0a081698bmr223865281cf.22.1754916507766;
        Mon, 11 Aug 2025 05:48:27 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:06 -0400
Subject: [PATCH 1/7] clk: ti: dpll: remove round_rate() in favor of
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-1-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=2854;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=797B/i7zAYqS3C3fUwjFhBm7v2UlPo/3f5vR7+9WseU=;
 b=f6AxDfpy+RCAm2k48bLMU6hHsZhiIhyDPP0Xu8DVBbm+SnUO1/phMmAPOVEmJhxdvCZ+PrTeV
 420mVDpwyjfC9nn3pdrhSYEiP3VtgDwWcEOhdEyNFp3IV+ZmVRFc1tT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/dpll.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 3386bd1903df6d6cc443c9e087497167682da8c4..1f55554e0d73ca0323459e8823125b22623ae4a9 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -25,7 +25,6 @@ static const struct clk_ops dpll_m4xen_ck_ops = {
 	.enable		= &omap3_noncore_dpll_enable,
 	.disable	= &omap3_noncore_dpll_disable,
 	.recalc_rate	= &omap4_dpll_regm4xen_recalc,
-	.round_rate	= &omap4_dpll_regm4xen_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -48,7 +47,6 @@ static const struct clk_ops dpll_ck_ops = {
 	.enable		= &omap3_noncore_dpll_enable,
 	.disable	= &omap3_noncore_dpll_disable,
 	.recalc_rate	= &omap3_dpll_recalc,
-	.round_rate	= &omap2_dpll_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -61,7 +59,6 @@ static const struct clk_ops dpll_ck_ops = {
 static const struct clk_ops dpll_no_gate_ck_ops = {
 	.recalc_rate	= &omap3_dpll_recalc,
 	.get_parent	= &omap2_init_dpll_parent,
-	.round_rate	= &omap2_dpll_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -103,7 +100,6 @@ static const struct clk_ops omap3_dpll_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 
 static const struct clk_ops omap3_dpll5_ck_ops = {
@@ -115,7 +111,6 @@ static const struct clk_ops omap3_dpll5_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 
 static const struct clk_ops omap3_dpll_per_ck_ops = {
@@ -127,7 +122,6 @@ static const struct clk_ops omap3_dpll_per_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_dpll4_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 #endif
 

-- 
2.50.1


