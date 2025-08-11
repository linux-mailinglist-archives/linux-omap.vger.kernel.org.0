Return-Path: <linux-omap+bounces-4173-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1245B2092F
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3006B7B3775
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A180E2D5A16;
	Mon, 11 Aug 2025 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W5/8AXDG"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1222422E
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916510; cv=none; b=C4ulcK9OX3/K2VbJ10kltfRm2b1/zt1FR+l/IABBUGMy22HpLkteY33ydEQJYgYS88qrBGtftQrQsS6BpvaKc4F7qLTN2Srwf4jsb9IQxmLwBT7pLLpCdT2OlEPRYQSNfA4ZmETEu4G+rP9rjOWOmX2urEZNjBIw550pLAwtbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916510; c=relaxed/simple;
	bh=cqJ32N9ZWBFFgYuIa8kCGQAJuxb6TvKIlNGxMSGfO8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gjA7o33xS1jrssa6DbyGO6HqbXoqrOrrKTSL10u4WZUaSVBrukY/mwSZ4cXiDQJp/81TB0+qA7jmUhOQ15z8cf6BI+JOpCjiJR8EAScRprOWXFqAgpnrJQyS9o9bcATWBlnSyYI+DKpFeY0R+0nVKQzm3A7FeCeCYcexLqZ0ly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W5/8AXDG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FVdbSNIagJ2AolR/n555Dm6E/MX5DzDYoQczNEFjwZw=;
	b=W5/8AXDGReM863G3QxbFxT8v95qFUZ6Mpkkw0HAcN3xM2Aox/EC2JGzOS39VcEIlRyPl6+
	KE/QcGmtVhZZSWyU8BlB5kIqSUrjhi8YoJGpY4SRMskER81Oam7wOMKW8+5CWd4udoJX3K
	82c8k4sSxjR4ZR6HgAXYA3OGadJBy24=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-9YcrkuKRMhuxCa2OpG9zag-1; Mon, 11 Aug 2025 08:48:26 -0400
X-MC-Unique: 9YcrkuKRMhuxCa2OpG9zag-1
X-Mimecast-MFC-AGG-ID: 9YcrkuKRMhuxCa2OpG9zag_1754916506
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af156a27b1so169839081cf.3
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916506; x=1755521306;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVdbSNIagJ2AolR/n555Dm6E/MX5DzDYoQczNEFjwZw=;
        b=MtIeseV6xKvBgYTgWmPANosbFATJ2EvhcOh6VirCItTY+s/Z2rXtciVOjmEfDklufw
         y0VADDFKP3j4W29NlGj8JwjFG6A0BKCkfGYhpr5EzA7QgKBAK/6ia+73HGdqqbphvqW0
         ayejgpSja1DDNM6qFqYIba65gd+eYbjRZJoezwt8LuQOtWB6XZrLSBP6kFRqwqqjycnQ
         1Pu+7mFBYpDEH1wa67u+Z06qxZ7UoSb616YvL5fFooKMCt71D53HpaMU2gApDjBzSK4v
         YpFdOJy55A0M+IY3Y2Uwu/Wl2Kq1zqIZsHEGbLvQKs8HaoOxtchQ7ydBLmYKcWYPtRig
         Hjpw==
X-Gm-Message-State: AOJu0Ywiy684JO44RxlMmMnra3zxOiEeODvRdtYXNdOFzeaKYeaGSail
	GEcKD1V6lVSt1VlJyyfZfC/+tX+hDP/MJxqfSxPLRLS66DObVSAabpuf8cAU5mZkCmt4wgFfEhc
	JwuaNvMsN0lUzjNpkhoeNV/tvIIxFzyS313k4gV0P8l9izKYLFTPFZPLhnpw0COo=
X-Gm-Gg: ASbGncsEdyRh35LwtxrNjAtO4D/UwksS62x0Xbul5xKmf4QAu+yYJisQgIWilrjMrge
	Qp3nMLD+fKIeBTp5sl+Y1P4T0dhqmMF8fgAVp55oDx/GXEK4IBQaTOmDV+FDtyWMVzQwJWY1Lus
	g6ktuCoO91Q2uCHfwXcsWFJxNpcB8lr0rNk/4CSRX5eclqE24gspgZsTzufZWekC1ZRx1CtoNkI
	lHZ4GN0jF7fDI8i3gZsaWkYzZM34CyGiGnYUGx4Fseu2rMjTFyjG02FTmWAUlGa0fG0sE3VD/uA
	8xUrFKKjRQsVsOB6CWPL+ZUUGY4KWCe4UedUyy8GofMPw84SDLe1tk8zGGcz6Q0YqbrrxdBTA1i
	3cVw=
X-Received: by 2002:a05:622a:758b:b0:4b0:7ff2:5558 with SMTP id d75a77b69052e-4b0aed983e7mr151823681cf.60.1754916505363;
        Mon, 11 Aug 2025 05:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkxOo7nJ6Wh84McAPXJEFzgFBHPAA/IKALEAXCpP+AKrkiSZ4DIvjufuoXGXJc9jKIY/+FbA==
X-Received: by 2002:a05:622a:758b:b0:4b0:7ff2:5558 with SMTP id d75a77b69052e-4b0aed983e7mr151823221cf.60.1754916504926;
        Mon, 11 Aug 2025 05:48:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
Date: Mon, 11 Aug 2025 08:48:05 -0400
Message-Id: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXmmWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNL3SQT3eScbN2STN2i/NK8FN2ixJJUXWPj1JTUFItUM8OkJCWg1oK
 i1LTMCrCx0bG1tQDvdixXZgAAAA==
X-Change-ID: 20250729-b4-clk-ti-round-rate-33eded8e61bb
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=5710;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cqJ32N9ZWBFFgYuIa8kCGQAJuxb6TvKIlNGxMSGfO8Y=;
 b=4HA+t18cHtqglZcqhB0SvoxLL90DJqvu91+fbZ+8gQo/Uu2UYNxdFnmmmxQYt3dssNBcKufZT
 hWTuDdqNfnpDJ6TMvfiyRcSLsXKESXhyhFoDYuvHudY6XQlEjJnVEad
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops. The first two patches in this series
drops the round_rate() function since a determine_rate() function is
already implemented. The remaining patches convert the drivers using
the Coccinelle semantic patch posted below. I did a few minor cosmetic
cleanups of the code in a few cases.

I want to call out the changes to the dpll driver since a fair number
of changes had to be done outside of Coccinelle. I unfortunately don't
have this particular hardware on hand, so I was not able to test it.
I broke the changes to this driver up into smaller chunks to make it
easier to review.

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
Brian Masney (7):
      clk: ti: dpll: remove round_rate() in favor of determine_rate()
      clk: ti: dpll: change error return from ~0 to -EINVAL
      clk: ti: dpll: convert from round_rate() to determine_rate()
      clk: ti: composite: convert from round_rate() to determine_rate()
      clk: ti: divider: convert from round_rate() to determine_rate()
      clk: ti: dra7-atl: convert from round_rate() to determine_rate()
      clk: ti: fapll: convert from round_rate() to determine_rate()

 drivers/clk/ti/clk-dra7-atl.c | 12 +++---
 drivers/clk/ti/clkt_dpll.c    | 36 ++++++++---------
 drivers/clk/ti/clock.h        |  6 +--
 drivers/clk/ti/composite.c    |  6 +--
 drivers/clk/ti/divider.c      | 12 +++---
 drivers/clk/ti/dpll.c         | 10 +----
 drivers/clk/ti/dpll3xxx.c     |  7 +++-
 drivers/clk/ti/dpll44xx.c     | 89 +++++++++++++++----------------------------
 drivers/clk/ti/fapll.c        | 48 +++++++++++++----------
 include/linux/clk/ti.h        |  8 ++--
 10 files changed, 105 insertions(+), 129 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-b4-clk-ti-round-rate-33eded8e61bb

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


