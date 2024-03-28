Return-Path: <linux-omap+bounces-1084-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B505890C27
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 22:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB20C2A7FC9
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 21:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C9E13958D;
	Thu, 28 Mar 2024 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXvp4qIt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D613A419
	for <linux-omap@vger.kernel.org>; Thu, 28 Mar 2024 21:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711659755; cv=none; b=JgbR174aJMmJNPWF0KX+9hm8GbIi+2o0Ru+rHc8HFQHHyMSovPkDqK3v7rIGemXUIbIRg89qMSuFhGEPbqTc68peN8mzLE1Kpn0t99wk/RJTOjKdxcgmDKcXhAR9HdxNir/qGmWMwlmD40H+DOhyGDIQn6HoToDv22uwqOdZM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711659755; c=relaxed/simple;
	bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERf3sLntnNmSj9c3JIR3dwxl1LwIZbNUHAa8OG/Dd3KIeFt+jykpkefoRHLlvrOe1CMrTnJ47P5TykpBwkiOl8Q6j5/FJdjzDvbYYJ6TGlPvqLN6kFSdR79Q+xJHMut8Gie9DtpKRNJqo7hzHS4jRcJ/ur+aXp0HIIT5AlLBtpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXvp4qIt; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1389816276.1
        for <linux-omap@vger.kernel.org>; Thu, 28 Mar 2024 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711659752; x=1712264552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
        b=bXvp4qItJjy/TKe5Bu2Mc4jPEzYhOjvkcpHYEB0Y0+V73sau9ePGn96Ny9t5aAjwvp
         rTShvd3uw3a+ietwgrtvukwYl9VHu+Q2SurPoATPGWYY2YOGofBKfjRMFyzViCJrpt0w
         gbGkTXJZ3udaGQ6+kSKkuntA/4dzX+Dr5Ips1PyrO1mrJbi/ki8ML/7xTEm3dnllILqg
         33XfM2/+pN0fwXZekLXxbR4IZ4Zczwms7Om0e9a6z30HeIlmzvllofqdAIAPsvpixkI7
         oYlTSdvkIoa86YoEEHlY2iw6jvyvZ4JgS3riYhJc8oMVyR6cScLQ0JN9yVU+LEdvNGc1
         NO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711659752; x=1712264552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfpknSTxgoJfuD0raOrJ+PU0Mw7buY/9Y0NgXF+NxJM=;
        b=DPdag5PSrHmrxWCQsmu3lYRS/+HlR3gfHsxNk5uKklF1USspFaC4Qxwel2R0CY+e5v
         i50x/g9JNWoKfDVRmSRgsgVCb70e73DryxG17hei0eyMoR5mxGbDt7uMbUFZyNjKt8Ib
         f6VBEcKGSdkKLAsozrjpqZxrrOd/R+wfzbhEBMf0Sgz6zlXuNPbhWc4yyCYqaueSV+A4
         ZLW/DxVNYrEF9NHKRu6SRqC5waLre9RHkGdMLwHl8PD0InMds9MwCHkqFGIkjIxc6iTG
         2W7c25bg3InfQxUmDHAu37/wexqZLOpiVwDfYxTe/OtguLmiQVpZEe1M/sTU/awxAWQe
         JXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0xslVePtjjGorH5IeREl2M6J2YNsxiYEbxmULDPYN/RmHscLoXUMq+RdvnzD68Jpt7Hc+NZQWuaMTbdp8eAgj5jdZzo2ExfOHoA==
X-Gm-Message-State: AOJu0Yzw5aQuFQwStOf7+HC5d7HAh6lYEitk65l4Kky2uHR5p8FbG+Rk
	gI44bzbHW12NRtcSG7IwrX1QeTPWeK1rm/pm1txntHumSg4FKjHmgH8aFYs4OGllpLfL9lzMzje
	+SYpqmjZL78IS/tRf0DBJAEgxongsdX6Qa+L0EQ==
X-Google-Smtp-Source: AGHT+IGxi4OD3TX9YX4kd9Mo5TVa7H4x1/FtN94/Yz5tgRXdC1t7KKaH5XTDmHinOsqcgVfjh1lKeog0QOMLKiEl1bQ=
X-Received: by 2002:a25:8110:0:b0:dd0:76e:d630 with SMTP id
 o16-20020a258110000000b00dd0076ed630mr480682ybk.53.1711659752409; Thu, 28 Mar
 2024 14:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl> <20240319110633.230329-1-matthijs@stdin.nl>
In-Reply-To: <20240319110633.230329-1-matthijs@stdin.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 22:02:20 +0100
Message-ID: <CACRpkdaRM-uqp_Y=gT=FMC48=835dQnB0YomYkxR9ag-SW5cOg@mail.gmail.com>
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

This looks reasonable to me, but I need Tony to review it before applying.

Yours,
Linus Walleij

