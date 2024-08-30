Return-Path: <linux-omap+bounces-2068-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9E966CA8
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2024 00:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672301F23B89
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 22:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210B018890C;
	Fri, 30 Aug 2024 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRSRONkE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF37165F0B
	for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725058030; cv=none; b=mloVk9y1lCWwO6qdCidZgoXCA9OjaC/NxmaAcdWNj5cmcEOA+GdVHywhDhkTpNZIJNbxWimSk3u1PLCQLfmYefnfQLVcLFSoLfL4iXxT9sgzLqigDt8GYbyxCfQ2TnVhHZU0UMg1AOp78A8A0YkZnnXh3HOA+ty59w1lVJZ2dxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725058030; c=relaxed/simple;
	bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYuIhTqSeQK6ek3O917FmCdBBBzHGjfWfO56dTilEZYnaVsu71/bU4rIU9fFxZJUCfadLOTkOyS8lbSY8NjFgt0kB5gTkRz5Bjqhu5Rb6pHLx8j6imamliYqRrWXvXRDazOgcXO58b1ilgqeEv+chCE5yNfKAhQA+HsoFVmsbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRSRONkE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f4f2868621so25426251fa.0
        for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 15:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725058027; x=1725662827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
        b=iRSRONkEwds+0Z2B3BS/qBG/xWaD4a2ZBX0GqOUsh2h3gHOq4+rGtuJxF2vWURl9TR
         ihi2Hb/iGyPVYYd4suql36XcT6aUz3x9DDmlEzQ/GVpfKEdgsqkpgtneMP6a1CP0Ps1/
         tp5zpo0kUCtFbvSsygvskeT9+DKj4PiltYXZrdmr09xx1JaY/ptv1pSx9hlEBiZqOZW4
         +R0mLhThJJYvtE+/yHmx29mnh9HRIjeFfJA1hrai2jbc7PK6aYIh/rwI3YSeuJGvKDZf
         1Zvgh2lvZHf7Uze+RtVVgVr6F7od7QBVLnlqgZXJFtGgq2ASvaMPmo85nCOPS8lvlL+f
         pVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725058027; x=1725662827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcERWZl1wa1DugmkSLGflqWj3fp23asXRiIxBMGAnUM=;
        b=Y9+VYAOgWQ8C4sNGP9NUY+Q8qTFLFrGS9E+6Pf0vlk+93K4bMYKy3VcD7GTYXgvsti
         VazscNQwhjDGuvOQKViPiYL5Als2udzr/rqkkLKDtw6ERslWaDA9Jf6vYRZX40sR1XwE
         /5Qykz5/spoJq1pdBRqZ6Xfk5yT44+j0En9saO71MtUMs20Ztou+8MuHo7KIwm3MQoGW
         zo+Nb4lNxbyeHjqgrQ9E2t000wBnT55PEe5h9eh7Qb/dSOqTBMDcWzPMV3Br44kp5fkg
         JIV8wo0KpGJfXKk0eq2GlPj3X015z2JbZShIx5xlURszXLKwqJ857Q0k4Eyrq2kwpGWv
         Kydg==
X-Forwarded-Encrypted: i=1; AJvYcCUgGsVOzMTFBPOZMJE8gcBZ+dy66SUhT9p/tOuU6cAdei4oc6lr2GscJx0n+gNJcw/MHR8WJoaBMYR3@vger.kernel.org
X-Gm-Message-State: AOJu0YxmcU9kahQeBtWOWCo4vo36U0QJSG3NdBPTNx87vmAzMqUo8zHL
	Ep0RFP8UU5bZ+nRJNDwPO9teSkQZ21pSqs67qi3fow0gm6kVZXdjc08aB0V83gfJeB1eX1JwlKZ
	MZXil8YwOX3mFfLzfry1VzjMDnClE5m3720IICQ==
X-Google-Smtp-Source: AGHT+IE6Pux6xBCNKx6NzrDxkiMvpKkwNksEL+SETGgBL6cWj2r/5BXlHPx1T6w7EQGMUKy947gNiEBsSCvPbrCisNU=
X-Received: by 2002:a05:6512:2346:b0:52d:582e:410f with SMTP id
 2adb3069b0e04-53546ba061fmr2649566e87.46.1725058026553; Fri, 30 Aug 2024
 15:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230113205922.2312951-1-andreas@kemnade.info>
 <CAMRc=Mf4-8AfTHLrvaF14tc2TJatxZJWnMOF-1G8HmDhPKSFAw@mail.gmail.com> <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com>
In-Reply-To: <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:46:55 +0200
Message-ID: <CACRpkdZY5CROs9EeRSYnOzFvr_Xgnw66ziKqYH2LE=MQe4OWLg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: use dynamic allocation of base
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, grygorii.strashko@ti.com, 
	ssantosh@kernel.org, khilman@kernel.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:52=E2=80=AFAM Richard Weinberger
<richard.weinberger@gmail.com> wrote:

> > This could potentially break some legacy user-space programs using
> > sysfs but whatever, let's apply it and see if anyone complains.
>
> FWIW, this broke users pace on my side.
> Not a super big deal, I'll just revert this patch for now.
> Maybe the application in question can get rewritten to find the gpio by l=
abel.

Ugh we might need to back this out if the userspace is critical
and you need it.

Ideally userspace should use libgpiod for GPIO access, but I understand
if it's a higher bar.

Yours,
Linus Walleij

