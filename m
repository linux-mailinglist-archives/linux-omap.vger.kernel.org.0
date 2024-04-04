Return-Path: <linux-omap+bounces-1118-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E78986B0
	for <lists+linux-omap@lfdr.de>; Thu,  4 Apr 2024 14:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6AD1C25C47
	for <lists+linux-omap@lfdr.de>; Thu,  4 Apr 2024 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4623686630;
	Thu,  4 Apr 2024 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWdQNQqt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188984FC8
	for <linux-omap@vger.kernel.org>; Thu,  4 Apr 2024 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232034; cv=none; b=X/WBwLfryJLEICbVbUelcmc6lP4VNHXXpZ+GtneMPdWSoSq1IVAc0WiMbXEIdouIajFx7O4oFZwo9lAEKPEXCvG/qaGqHO+pi57oqpUXDkifWY5xTkYWUlcaBnixyqZr5MYWf5m5NHlVa46HmUDvTkTSJSHE/FwZ5Y10djxprmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232034; c=relaxed/simple;
	bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnzyO0kfu/nWq5sH6cWCdA+RYbXoh08cUJCRtqlOXUATt6Jla+pjd1r1wJFppQBsyZg6oCK89EQCiGQStyC5YH7MoFUqAJboSHsExTbYxJyH9K5CxDIB8Ry/V59m0KwhANpYV01WEpPz+TEVNLz2L/qYqfCCcMROUy5dXq+Qut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWdQNQqt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso1035671276.0
        for <linux-omap@vger.kernel.org>; Thu, 04 Apr 2024 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712232032; x=1712836832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
        b=eWdQNQqtJNKTIzZb8i1fghgfJPeHP5f+XzjXiGOa7DL7y97o5ik0tS3BBfoktgc+BP
         FdSfQ+c+1UmD6OCRQT/mxQ633wAS1jHY1pNdvqaAdgReXhYpFLEZ0yjNOX9Dag7ikkdy
         C/ZqMf3mIMouZnVp8TC9hT4xWHgcgWH/uR1ESxR5Sj/xvRYtaF+mVB3doeF0wVscLZz/
         Vvm+L0sxSGukbY8ON0JAL3YLPWejJrbhVMdUORSlFrbHvJmAmF2anhBDHsPiwjMmQSyO
         6/ScnNVcPZRl3pBfHT6yvODLSS9zy43z5T2Il2xRitwcqpYnO2veS8maN8tCz5JRDpoe
         /apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232032; x=1712836832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iw7mOeyVDZ0niVvfjQyNmrucbFUKpaFK5zyc7QXi4E=;
        b=Pf8SdSn1jqNnVZJcRE160l7Kn05onZqMoyZJWohLd4F0QrLZ5np9M+77KN0kYnu9rh
         NLzdClikz/IM76s486HW1egOMtiuSkzT7vnKDdhjc3DFaf1rrOb+OdwIDqXb9h+xRblt
         Zf2Xq++hUCOosJSJJQWdKsWAht2+r/MPKcaWG4EpBUZsluSInFCH8uo1/Btr4u2pRImv
         ZAbusMbIASIrz4QmyiM43n+TtfmnV3IMW0Ifa8IGLE/k249dbF+PuZ6OVjry2F9h1c7k
         TmSkodWmEiKKMWudZzRHBXecMh66H0wJMgiI97Ne5bEyq+RI76y1N8XkIVZ57l08qGDO
         +WuA==
X-Forwarded-Encrypted: i=1; AJvYcCUUJcJMg51D7vmFv9/8NrkA/EeORo03yrBVyRYh4U+eWzQG10bx82mGlK18eXdoOdYJ2cZ2DlMwHYmrP/9mDmLyuLJ5s1y1uSqRDQ==
X-Gm-Message-State: AOJu0YwMMwC/qw/k+uqju4Rsti2XBnRrycEt1t2URGhmGsJvCkmdWupf
	zkImdRSZdsXefYWeYDPrfuolZ2RyBJ/htTjTn+mKHx2bqcPQBYuu/EhkESsBNcrpfWCEYEmOnvb
	i/Axzsd13GjLnEKvHuRP/EAoQBkHGjnUNujNDWaLbbbpP8X7b
X-Google-Smtp-Source: AGHT+IFDnGWYkUjulcl3b72iVoeMkRwAikOQXFL7/ONb9PVXD/x1iz8l+R04Quu2n+bUEuz2YG/VA0DhNbH70FEGXro=
X-Received: by 2002:a25:a3c5:0:b0:dcc:8c7d:970d with SMTP id
 e63-20020a25a3c5000000b00dcc8c7d970dmr2174589ybi.47.1712232032207; Thu, 04
 Apr 2024 05:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl> <20240319110633.230329-1-matthijs@stdin.nl>
In-Reply-To: <20240319110633.230329-1-matthijs@stdin.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 14:00:21 +0200
Message-ID: <CACRpkdaBXtR9m-ksn=rAwD3+dPDN_74zRVM183pam0zk=bf9Nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Tony Lindgren <tony@atomide.com>, 
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 12:07=E2=80=AFPM Matthijs Kooijman <matthijs@stdin.=
nl> wrote:

> The pinctrl-single driver handles pin_config_set by looking up the
> requested setting in a DT-defined lookup table, which defines what bits
> correspond to each setting. There is no way to add
> PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
> code to disable the bias by applying the disable values of both the
> pullup and pulldown entries in the table.
>
> However, this code is inside the table-lookup loop, so it would only
> execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
> which can never exist, so this code never runs.
>
> This commit lifts the offending code out of the loop, so it just
> executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
> skippipng the table lookup loop.
>
> This also introduces a new `param` variable to make the code slightly
> more readable.
>
> This bug seems to have existed when this code was first merged in commit
> 9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
> versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
> the lookup table, but that was removed, which is probably how this bug
> was introduced.
>
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>

Patch applied!

Yours,
Linus Walleij

