Return-Path: <linux-omap+bounces-5111-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33643C9E26C
	for <lists+linux-omap@lfdr.de>; Wed, 03 Dec 2025 09:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 266154E10DD
	for <lists+linux-omap@lfdr.de>; Wed,  3 Dec 2025 08:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232D82BE7A6;
	Wed,  3 Dec 2025 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="JhJoX1pV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C329C35A
	for <linux-omap@vger.kernel.org>; Wed,  3 Dec 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749426; cv=none; b=H+yS/yvJpFogncSCPlZMpdwj8ba5lF4AOOAB1xzX5T+IFrv9IIXhvF2aFV14SI8jgViz48lVBwAV+wFnW/Um+wfh3J70QL+52ksZjOcln0Va9KSjTIAh+9GUa//huKLJ+T4HfKgP8koYnaFUoNpDxum4cmCX1cvNzejfSd57tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749426; c=relaxed/simple;
	bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUP6eG6xp2RwGrV1XCG0uGa03V9hBxlXcXNdM+tmeVNh3sHrzIGILlbfWAizN42RoAYBVONsYcK4p+RxjNzKg3w0Qj4on12NC/HMSibYEFuYcpQW8C8AYWd2vHz1Q1mVAzy8IF50+4CA1vTo+s72bFWy+STANuzRXEqYPCbT9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=JhJoX1pV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343ff854297so8502301a91.1
        for <linux-omap@vger.kernel.org>; Wed, 03 Dec 2025 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764749424; x=1765354224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=JhJoX1pVQxbugDb6MhZ63EuMMZr4WjoqIomlGylXmzpn/QX2/n8zu6DEH8r43sOySu
         8lSHfdj1yxcSENvuhvokZ8ej1ulyP4vjjmPggGAnpwbrB2VmwkFg6TqkwHh6PCHRUvBY
         iaAJy6o4WUdyzjpWQ7sFFO7QOlxjESD7BFjoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749424; x=1765354224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=dMSN3PT6MS88S9zk0MJRmwvSLzasF8BmlU6UruWXK8Yr4vJa4vKRiyVVOAIAE6xliL
         GhVDRI0JiCunHcsJWOVYZ70mw2Qk9y/vavrowMrs1NFiXxiRgvGPtLJWSkfaJ8DD4acG
         tC3OGThxGyVJ/E076YEcnEpb1gJPh69e5XDAM7EqhvhOlgJXbeqQcTBP7y56n3bes9E7
         0IsoKBlt8mOWOXdzE7chXaw1suk/kWEq6kavsVMmkrXK1IWx/nBuNFX6um56J+UzpKg4
         B+22j4nnCBwyebXixlmkwXb0AyaxOZAGo+bU4tFT6iwkARsXCc5A22LfYP9DrTLVHVEk
         Tz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJnWT9zwMVjpJdHgWmmY8CUyWwKL+ypj4E42KUjlOIlgCWXB0JrmOUuEFnGpRTg+8kJ1hFBVxKfnL9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjcqr5n6dGK0sFeBAuXGoni4U34dCsmW/8/yae9Y/SrOt/4ubg
	gxWhtrLivCoXQ731bcJJsMp3+fUcVhMadCs9gsvGYPGsEGtZez4EPjMLgf19NPQWR3ZdyPYjpGL
	RJrcVSJEhqXZ1Bb8FFrDuqo3rIwN5NZFxPseJ/efnfI5khWK+d7aWAbFO6A==
X-Gm-Gg: ASbGnctRlYyHYv8HiZJeqjb+cFhYeVRC1C4l3NPTxCOPuw6h3e+ymaFkBGcIBlsBA0A
	ywx9e1QFpPhFH1VlDgozkydKgtBnK7x1jGoFmptfMR6OPBC8Cm47WpiuGpwuUbZ02Hw6/3OuDT4
	ecm+h/gHeW4YK/XQGDeBMs0ctQFJ4rnXSEUuGwnxsGZ13/zE8Hcfs8oKTWb0qiEv10tHhQ8us+Q
	yrBInQwtYmKyYm011ZDhH9qbW58vlz1powjyLR+KJRdb7uRnrpe3USb42I6+Nhnfvg3nVkU
X-Google-Smtp-Source: AGHT+IEq5y63hfjT8YHjilACNJqyKvg5j+0plLqT3wpsKD5Q7MH1znsyxIQRdeefXp8WZbUY/IfgJtcujn/JnV7uScQ=
X-Received: by 2002:a17:90b:17cc:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-3491284b4d8mr1814924a91.33.1764749424655; Wed, 03 Dec 2025
 00:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-8-jszhang@kernel.org>
In-Reply-To: <20251124002105.25429-8-jszhang@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 3 Dec 2025 17:10:12 +0900
X-Gm-Features: AWmQ_blMivOz7cN3cWbzITo5XCmwfcKVIQTdEzDBywa8v8-CY7hjUyWixRG6J94
Message-ID: <CAFr9PX=zXuaOBoEUGkYjrROK75e_xt6XZQu=mt0zQQNYWn_TYA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gpio: msc313: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jisheng,

Sorry I missed this. This looks fine to me.

On Mon, 24 Nov 2025 at 09:39, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

