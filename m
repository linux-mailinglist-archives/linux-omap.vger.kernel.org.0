Return-Path: <linux-omap+bounces-1117-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D27898657
	for <lists+linux-omap@lfdr.de>; Thu,  4 Apr 2024 13:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FEF4289433
	for <lists+linux-omap@lfdr.de>; Thu,  4 Apr 2024 11:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D17745C3;
	Thu,  4 Apr 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jp37XKjr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632F8286B
	for <linux-omap@vger.kernel.org>; Thu,  4 Apr 2024 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712231223; cv=none; b=gqCrU+zXSUVp5IHeUtTe3McKagXo62Jx111BuxlJxHa/5//RDCzc2JugH9HcQWidVc0e7A3eLLmcdtmCgdw+DuqI8APSJrLq5XrdM2YVcIR2JFzszRmDr7LtM8bimLZVLY57dkSq5I2d91W2URPcbclWz+PNUePxh2C9rR0QhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712231223; c=relaxed/simple;
	bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDP5FuRAMsyeDa9bR8IfdLm7zrB3OwuTBu4kNfqqf3pDGu50BHBQLYAq065ZPiSpF6SpPfp1eXtT9BNqHtie12rIn+w4KmI4D5O3S34qfOXVCgFzlHfEht/Sev3JRzvckCducNN9/k65g4NoMsaV4H76t8PdDGbuGA6yqLWAs2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jp37XKjr; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6150670d372so9318977b3.1
        for <linux-omap@vger.kernel.org>; Thu, 04 Apr 2024 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712231220; x=1712836020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
        b=jp37XKjrENlOH/kqi52bW69kmslU66UXAJit+oZZ4BUQXWW52NRhLAaWVT0Bx9Av6t
         ANsTmRLh481lUoibpCNoCPp5MmtISgUrAr22B2WldcElTf9Nlp3S0AWD5Rz1VwtsaKFs
         ecSBRTjHguwd3HG/FNBJxRAL9peWH4w+aio+mCv1hW6D6sBJV33Sjn0TgoP4nw0XC5xo
         Ey8e8sCJXtIrfQeWXXxZyefMXIMgLQi+5IOK7WqCcNN0V5Kf9C6xJYP+D/QSAqeM0/gH
         7SRsbXkSqkMAM6d+sNF5ZsQl4xocPAlMKEBBpWlKJLbFywYsQAncqcDV0HaFD0FQ078q
         J4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231220; x=1712836020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cfTb2VAwub8pYQSCzhjTlLFbA/bhq6Di6P54hY2C8Q=;
        b=tk/gKBQJcjiQQ5S/m6ztBdJNuA3lefiB7B+gzjy9uPODRAEZ5gGnt0IT1AjylZ8h91
         izAQrpz5avr7Xf4hfxRdNzMYaShQBfwtt1EJvrYNCczhQocVp1ArCNum4dtn+XSEJYHR
         dS+ZCewz6Bt6Low69o6KnTYdoz+X4YECGqvBK6VwrRNy3LNyHFWyJxVH6RfFHgSlxksj
         pnUbZ+8q8QbL4GrZIqFJzK7dCCsBJ3CLlWvUnwEdYudH3syFO/XWat7MQkgxQabO2ifP
         as/j5bqwIuoo2+clqQP7Q4CvWPNzCnt1Zp/5UnLf7dWP56Av/r1VxX2hGJsj28f8PA2Z
         pyHw==
X-Forwarded-Encrypted: i=1; AJvYcCUqfieEZqjKQKTjQqyD9d8MCkqNs00Dg2k4c2bz22Ff7okfEAUqGyEMhyLFS2Yf1KJneZUVOZHFpBTluHDQSSNybNGdgdPeQGINyg==
X-Gm-Message-State: AOJu0YxUtMBL9WG6fIG2sU6HXfJ3gKzdNM0qqJqVca1B11pkmc3vRwaz
	dcK5cfyVC4PdP9LMsG1jHYJD23ED15Kmfj/rTIRaodLv84FsuM2MgcvqLOGvzEEBi0+LZcf2CAA
	aq3RmpOaH7dugXub3YbxKyqS7akGItMUzC2rZpw==
X-Google-Smtp-Source: AGHT+IFFVdVOk+E7MDuKQ2cnteoYCIQKxsAsT5THCCEHiF9/XfDRwbjfBVeXdHYdUt6nUzx6qtMXhLYbOK1EtTJvdqE=
X-Received: by 2002:a81:a18b:0:b0:615:17f3:55e9 with SMTP id
 y133-20020a81a18b000000b0061517f355e9mr2067506ywg.15.1712231220589; Thu, 04
 Apr 2024 04:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6b653642298d35b1e3656e9bfc6d1b322fbbe68.1712004518.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a6b653642298d35b1e3656e9bfc6d1b322fbbe68.1712004518.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:46:49 +0200
Message-ID: <CACRpkdZeXwGoMVCtCC_6oSSACkcu-v5yt7yDi-vSSPrL43A05Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-single: Remove some unused fields in
 struct pcs_function
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 10:49=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> In "struct pcs_function", the 'pgnames' and 'npgnames' fields are unused.
> This is a left-over from commit 571aec4df5b7 ("pinctrl: single: Use gener=
ic
> pinmux helpers for managing functions");
>
> Remove them.
>
> Found with cppcheck, unusedStructMember.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij

