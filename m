Return-Path: <linux-omap+bounces-4085-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB4B00FCA
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 01:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA24F1CA741D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 23:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BED295501;
	Thu, 10 Jul 2025 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Syg7dlfq"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A12246326
	for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190956; cv=none; b=F//YRYYa0hLqKFCfbUecrPQO50BE1BlrCV33acL8uAiAA0f6GecRh3+nZUJQeCFsJ7y8G9CCgDew6nhOK8FqsVE8nTZNFrtHXLgm4Urf27M2s5Cfw9wFS5Rysx3JRCU2IIeBbriOeqAsq+B6VZBRJ9BJx5SycRtMgR9lomq+E8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190956; c=relaxed/simple;
	bh=al6nz9adATLIR7FYrUCMOsShOW+3Oeiwsw0ZybmNjqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5oVe6AV0k1aiQH4a+pRBy0I5mo2Mz6oYiQD+P0kv0CVc+d3X7jWQphPTYYylXv9/FsdRSzCbtQbrbP8LOn2vOGjz7Wdh1X5vHiDtNGvQDOpiIDbulBisM4YN+Zgw6gALBQM4DP3PQyDuve+O0Mmd5iPaQTP5pnnNXoXHH71FYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Syg7dlfq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
	b=Syg7dlfq0fc2NtwTL2wHQJZRivsOVu8TyZRqic01i8zkGwll58nno+8eYCVW3su7EIbhC+
	EgbF7fkhfN4hlXyUUbRFOuYgbrs+fntHmsp2dDrPgUrFlFn0r8MevaHlXO/zLJk08SMpTx
	jkElJ1D3fbeScu21orEv2oCVRfHeAMs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-uPllDnkcPpaXt1usUmnx3g-1; Thu, 10 Jul 2025 19:42:32 -0400
X-MC-Unique: uPllDnkcPpaXt1usUmnx3g-1
X-Mimecast-MFC-AGG-ID: uPllDnkcPpaXt1usUmnx3g_1752190952
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac45de153so21651456d6.2
        for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 16:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190952; x=1752795752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
        b=ShuQgPlkLYHMHGrOyeD1X9PsAkIY+2IpChCI+1pmClejZrNs9b3s/OdJI0rFiqgcNC
         w5EzPMbrQVHpTIxsH6qwyI7g+ND98j25enIplntEDGfdFZgFCCCAk15VcE3VWQ/i5XBa
         gWpBpyyHb898SguYCIlp3ixRcNNGREf86p5QawhmCBzx5JTzhP5+GOXPnRosrn/FbVUt
         oFKOxzqHBP1vWHEnwzWA9gZoa0kkCQesaCA1v4hkLVaN4qvDv9iIGZ/z00btnDZ77x45
         sA7h1c3Bgjgh/Qa5oGw5rm2IciuTxsblc8ZQeSViiuoXibywYmEeHqLJrsrig3C9X2r6
         5Ybg==
X-Forwarded-Encrypted: i=1; AJvYcCXEdFJkOdgf+7ggHPT2wSz9SJfye19Alvo4V/Nv9Pv1930XQ/zyxvda85w9SODQ/qlBdA4/C+kINJyo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx916Cpd4M2EcNm6iwFJ+xeGDpwBL5Q+soaY/5wnc3Wzs+kYGw
	ULgdz/9b2WvSfbmyMNgyKuoSyMM4D89GnLtuQa4MoXiKL+0Ayy4u6jf1bjKnoh62ZFc/c4mECyv
	6Y5qLAwgDPnclqjbOs8Cbpx6Hz3wO2N713g0qeasem6HHLJmpOY4hEzjoiyyMqhc=
X-Gm-Gg: ASbGnct0/vMbUjKEcTgCbqus+r5NuXcnR/Yfn6C4zpnwhktc8+HXFlHLwR7f4jrWLQ7
	oYdjScI9cAshi/m/LfYC2vfvUOajeTCHjpx9U3DPRng7Phtui34nEMRX5f6cHcI3th5SBZVlyKG
	eNSuV7DTdsjr+DVVSByM5OrOx85BnXtHX+wufKKMMDQwq/tyH2CzmjfmMlPN4+WC7n/iapCnyZk
	inVRYYDWUnFdgzajsUQ/o05ATYK3xDEJZwYX4p9oeRBvC9pTNllA0zmmgN+f874XY9Hv+xppQuj
	/9NH96sioDHmjeRR9qzO6UEK1qgFYpNcLG/WYsmplW+2nCA0Q59x86RmHh0peOgYczSGAkLAuxW
	rJMM=
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570856d6.28.1752190951837;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPET4l5Q7pb7AJesD0qMFA+J1X+JY68upvMvP5yWTEV64eVycbSgaCQEqLya1yThh36Ihxg==
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570546d6.28.1752190951467;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] ARM: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 19:42:15 -0400
Message-Id: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhPcGgC/x3MQQqEMAxA0atI1hOo0TriVYZZlDZqGK2SOiKId
 7e4fIv/T0iswgm64gTlXZIsMaN8FeBHFwdGCdlAhqx5lwadzhWhn36oyz8GVLcxsqXQ1pabljz
 kdFXu5Xi2n+913bQdPmNmAAAA
X-Change-ID: 20250710-arm32-clk-round-rate-e52d845e682c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=4739;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=al6nz9adATLIR7FYrUCMOsShOW+3Oeiwsw0ZybmNjqs=;
 b=3Q0yi8DRBblqOemRVD6yfPZ3j82f3KJqt3sROeWm+I3JnvzPuG213PuuABwJdF06b5Zc7bIdB
 TQ/efS5E36aDaYQpeIWnskVhTOg8xT7IYWoLqgf2UhPz/Z0uU8VOGHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the arm32 subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      ARM: versatile: clock: convert from round_rate() to determine_rate()

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-versatile/spc.c                |  9 +++++----
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-arm32-clk-round-rate-e52d845e682c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


