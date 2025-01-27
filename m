Return-Path: <linux-omap+bounces-3234-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE09A1FF97
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 22:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DBAF3A4FDD
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 21:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E71A83EF;
	Mon, 27 Jan 2025 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkAyMAqx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4365748D;
	Mon, 27 Jan 2025 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738012883; cv=none; b=ak44b6krJmaDIDmsjFXJC0FaYKUiz2rbv2Ef/wWeRVQ3khnyMfyQ/r5/wkHYxDkxjIF/g3cpo6SwbjpH5ZBr81fs+Y352j+04hLu5vs7tzT0/vaA72j74DPDJrKqBFxA5bysUWk1EhBKQS2O1IkkOFa2M6UngjZnjhYr6KGQ8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738012883; c=relaxed/simple;
	bh=PL1TbQb1g+ppyf3wSy+3zObxyT5BxiqnK3GBCoNcWf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5II0qUkjIHmA57ZIBj3cn4LvnCrkV34iXpbN/UQhcARI7w+ouQicQrKnx8rOo8PnnRMTpwKbcydKaqWXJE+dOHUiIDdY31fLvmdl3ZBeK+l84UOB9ou7TbJ5ZQQ0NUtRyI4fMiToxispK5mWSPh4MRm/+/jw1zkWfZDAf4XwBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkAyMAqx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3a26de697fso7351280276.3;
        Mon, 27 Jan 2025 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738012880; x=1738617680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PL1TbQb1g+ppyf3wSy+3zObxyT5BxiqnK3GBCoNcWf0=;
        b=JkAyMAqxEwG7H+XLYMDA0yTiC18+/jaRnIAib2uJ3a0Fxpr57LInjsnTuKckxIX+uZ
         eJCU8kSuwFEPVXg3g4lmIMVklxPCVzZKaFvCOYvpKSxhs89Pt5KLnGGOSWwkpiWvbd6B
         y8FtJ3ut+glO1l7+pKKTdy/JNADfTZN/3cK3SMvakEqxK3TjRFPlYd6kq/dGeFLeuR2/
         3rNcUiRS3U/drn4XaGZjlIxkDNa5LtUQLLONOJHCrtJHwMkZNCKWsjLQrQ1dxEVSTeP6
         utHBL2S3tOkARJMfhm5G7WWKwHShkFLBtIEqOI2opfs66tKAsTADtdk4PuT4VMAeDdhx
         8qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738012880; x=1738617680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PL1TbQb1g+ppyf3wSy+3zObxyT5BxiqnK3GBCoNcWf0=;
        b=l1x8829JH/CdxwIojvY8F/U+G9x9leh6Q5OxmxNUtUvauqS2KcNUIYlBoroutRRVQW
         wJuiFQxuxOydHR8uL2zgMZRXdbUe3eIubK3K8ZZnKZ0fayI5z+im4j8uQmb7KJ3UnYfA
         aYiUYd7Rh4ihNUy4Wmc3ZURbqITc0iPVCadFU97rzeFoFguM5a4I78gUlj8dJ3y772o7
         RoyjmXuVIE3IATWCSVv0bqyWBlnv7NE0ywZ7eUMJ8DoZQy+/Sqd8GYm8CWShKcqpleJE
         PIIlGXfZYSqFHkGlBKBYUPRm361HUge59t6NyX68OBN4TtlwxWfCasxMzUbydsYmo7cu
         d+lg==
X-Forwarded-Encrypted: i=1; AJvYcCVDLoY7hNRJ9K5fsMzNyI4HFp8AjdWMXEdainiQc2y8kbu7l1Lo+IuaA2lHmAijv/SOuEonuNbW58xx6Q==@vger.kernel.org, AJvYcCWXHv4bwULA+SlU1MK+76jMVfj7ac/OV1i6eaiCdoH4ZeOhIiGypA7b2jHPY9bLhcZRCJPAQvFVYio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr17Hs7TxE7j04vWlpCPtysbt3Sxgzp0k4GMFnPHuAF9RwVSap
	3+AIijy5mVzudrPex775jt/KZkM8On/xW/5/HdP2Xe6xkqSgoRm8cD2uVUaOvjdj5ZBPKqUyPQN
	uf28zDaYRf7GNyDLB7xLWkzd6nOY=
X-Gm-Gg: ASbGncstExyNQ4SWnwNO5crCJlHdaE4QJvuycagtwwS8zdQWgrmB2UOL/DbJ3RPwxSB
	GAlTcD/ZOTGG4dpV4Mm9zrwsykjYjgCHSNJjTaYiDqy4cSK/qkGj11JFbdewpzAg=
X-Google-Smtp-Source: AGHT+IH/HhASTiNXiTjhItGFZPEp955TXF7rgcm9jgfJ+GFNKYnGtVVJa4qB0i3QgPzx7tq91Sxn7CaLCTu5B1QZ9wA=
X-Received: by 2002:a05:690c:6711:b0:6f6:d428:39c7 with SMTP id
 00721157ae682-6f6eb932f75mr342667137b3.37.1738012880504; Mon, 27 Jan 2025
 13:21:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr> <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com> <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
In-Reply-To: <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Mon, 27 Jan 2025 15:20:54 -0600
X-Gm-Features: AWEUYZlslurJupiuQyF0rn_pOk3MR89Xie0CC6eybyuCfYms-s4zOeyhoEDKMQs
Message-ID: <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: Romain Naour <romain.naour@smile.fr>
Cc: David <daowens01@gmail.com>, linux-omap@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"

> Thanks for testing.
>
> I'm able to reproduce the issue locally (using a kernel 6.1.112).
> It fail after the first sleep 20...
>
> If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the issue is gone.
>
> About sdhci-omap driver, It's one of the only few enabling
> MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using a newer SoC
> but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.
>
> I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compatible) for
> HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been added to
> sdhci-omap driver to support SDIO WLAN device PM [1].
>
> I've found another similar report on the Beaglebone-black (AM335x SoC) [2].
>
> It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled to SDIO cards.

We've been chasing this Bug in BeagleLand for a while. Had Kingston
run it thru their hardware debuggers.. On the BBB, once the eMMC is
suspended during idle, the proper 'wakeup' cmd is NOT sent over,
instead it forces a full reset. Eventually this kills the eMMC. Been
playing with this same revert for a day or so, with my personal setup,
it takes 3-4 Weeks (at idle every day) for it to finally die.. So i
won't be able to verify this 'really' fixes it till next month..

Regards,


--
Robert Nelson
https://rcn-ee.com/

