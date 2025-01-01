Return-Path: <linux-omap+bounces-2935-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199959FF400
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 13:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282153A28F1
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93121C5F2A;
	Wed,  1 Jan 2025 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="WRk1bsjL";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="EudnyMcg"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6917543;
	Wed,  1 Jan 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735733956; cv=pass; b=aqvxCP2rFb/pZkIiunivkYuJ14vBnVPSOre6csPYHFIKHWhYGbv/+zRy/klpKihNZXYw0vCkEPG3Tsd9kOvfaA3P/fR+tgxL2Xyv+XGXAWU4NutKhQCxhPCNwe2LkWJKaPp9bZZZ3CN8NfrLDXMqkBk8GKnVLqNL5Kl7/nOJxWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735733956; c=relaxed/simple;
	bh=MTBX2RYCkx0iHZv49acRx/Duu4Y/mDelJkCckAZe4/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFMWg/vDxYCOG7AmIDru/VwgADL7KDrkw0NgF4hwDdFy9rXntq6Czj0fN65HjEHffhZaqrRqXBkNjntvFKLTKpDwLUpuUp4UJEa0PZIegZ8swwrlaDNC0R6TLuTRdO1HfSCV7qMgMV3KDWE7H22/CoW6raD2vU3/1O0kl3ekI+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=WRk1bsjL; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=EudnyMcg; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4YNTHJ5rlmz49Pyt;
	Wed,  1 Jan 2025 14:12:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1735733548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=;
	b=WRk1bsjLO4UAwAmdOfRMsxD5MXL9lCkJRM2aQoOkm+1md/lYap3s+7oCAddzsLlH4f9EL0
	iFzskWOo0HM6TVi020YUkB6VGOnWOgDO/l85gfyq6epTouCfj3oVTixgYZPzfDkzZaSTwb
	IiyvAn3dZ4zUUIBvvyAsQpkKByUZhGi9nHJ04mebnsg3ghKwlrom0OwzeZH3KlSYUqHz0o
	EztQ8iZYZtIGFHz0WZxaHWQRXxEkU8B+EPOSAJnp4jh7/FQ+Ik3nF9CQ+m1OqiT0OkxZDQ
	8tGvaMguIbsMhW1FE8Laa7jQq6uqpEQl2lYSM+VwayNDqBUfJKrc0VLw/65mmg==
Received: from darkstar.musicnaut.iki.fi (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YNTH53thszyVQ;
	Wed,  1 Jan 2025 14:12:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735733540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=;
	b=EudnyMcg1iQcq8/ZEjhKmchdAPzlfM3cdj36jVGhDUvaTLLxAfYmdWJ4ca/R94pTAUIe6G
	1utTBYxucBtu/o0Bf2Gpe1f9IL9pbtguIUsRB0A4y4HKwxw+cuaymYuOlKd/pnTuy6Xujj
	Aia8wzvhUB62TeEPapgXby+4xz5+x7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735733540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=;
	b=qZ82c404DqARVAuSM6CpuHBLoU1MTfqvthsQKlUV4S5YtYAN3p+r3qtV9GbSzWDOuAg57o
	ur0U9cIWmDxTlFTpIGvx01WHfs59Bxpl20+m4URJEKXUFaGIHacNVpmU5gPKR2NhxClkpb
	3DlMiU7gB06j4FnZtLSMLAmycwa50Lw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735733540; a=rsa-sha256; cv=none;
	b=yBfjHO49fQMOaiVUon7Yo9JINkjs65izR+TOKUK6XUzD57y+WqslKPQmiDZzXtcNGTpASm
	g7KtWhlEdphRsOMbQHb5sSV9guk/9VfIS6rlqCjJzk5KgtvGkX0qtok4mcSeKfauZnv1Pt
	8VzaiNEoo47StTQPPsaya0B5JVrB2yI=
Date: Wed, 1 Jan 2025 14:12:15 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
Message-ID: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Retu IRQ is off by one, as a result the power button does not work.
Fix it.

Fixes: 084b6f216778 ("ARM: omap1: Fix up the Nokia 770 board device IRQs")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 3312ef93355d..a5bf5554800f 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -289,7 +289,7 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
 		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
 			    GPIO_ACTIVE_HIGH),
 		/* GPIO used for retu IRQ */
-		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
+		GPIO_LOOKUP("gpio-48-63", 14, "retu_irq",
 			    GPIO_ACTIVE_HIGH),
 		/* GPIO used for tahvo IRQ */
 		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
-- 
2.39.2


