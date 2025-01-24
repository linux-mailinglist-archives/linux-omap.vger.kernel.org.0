Return-Path: <linux-omap+bounces-3222-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA531A1BDDA
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 22:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F9516C5DB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 21:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF271DD520;
	Fri, 24 Jan 2025 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgQhInCw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D251DC070;
	Fri, 24 Jan 2025 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737754049; cv=none; b=hNKjh7u4gkKofBhkD6I4/pNuBwTkwilnPE3cZIhVw7erZZd3htzkoPnnBXGh2aZivri0mQla+F2RyQXNXuEpUsElTPWeGzRDtdrMSd0uVRO0LCf4tSrhCU267rVWKD3kreFO62zvmb6an+qYohISA76TffKd5XVvpconnjHp328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737754049; c=relaxed/simple;
	bh=4Kg0Z4qQjxl+GPQXErSffUOIng9BmYVVDbQjGNtcf0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huEy8qwHM0IjoTlnGb8NaU2UDP/CpKEgGD9sajqvxswzn63D35ho3sP3VBQ674luBVbLovwg0q04C8Ac6KoSEn9zd3FuXHL+x0+oTVkUX1edlD5GdTt+c89odOLPQsrfEvdgmiVyqh07MThGknf0lIEHs3l2m3tlhv+C9KKxNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgQhInCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E51C4CEDF;
	Fri, 24 Jan 2025 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737754049;
	bh=4Kg0Z4qQjxl+GPQXErSffUOIng9BmYVVDbQjGNtcf0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VgQhInCwcIIfiW1Y2lFQbyffPGRVhNlAQcfMEdTQj9iChAxh3EYHbg/ndIT0g6eti
	 yKMpgGemdTvuERes9BoELGuicPmVWtCc9aNfMbNRS7qWb0qlO8+9gqv93BvWTvrMmX
	 5gCeCNfER3BVkB6B/6k3fDLLwIoV4UOAbSTih6uyQollLfocC8/QLr+aId7nQjom47
	 AnHDCnrb4y7hqVsrRY5au9Xpv5MXgf292zrFTrSai25f9zXLwnZ91y6fx3hz1RJmUx
	 xHXU6hkfbIgENx35RsQgoCfiye4k3YkvHt5Qx1lNZ2DGz/lR7IYDItDe17NlYTvgMJ
	 rAW1ZDzmj7Yvw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3778bffdso2777252e87.0;
        Fri, 24 Jan 2025 13:27:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPF0IB+ZHa77RVMDNtsRGbNoBpORkr1vIo3LXIFT+CzSTpBrzMvt8mpSNsouY9ODNVLyvtY/mtAT4PQA==@vger.kernel.org, AJvYcCWuRMnqwGsIOtqbV5P6g2W4JkKa3eNil85DAqMKj7hcig/7djR06Y1NLJezxzTVhR8yOnYUrHaFTr4Gwzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkwu3zNekQP+UTjM0eR1qto1oiezMz9oe7VIZ5v7ewvtPhgzOR
	v/NgZw3DuUhyZCnYsH3lLDEhB6bIPmI8Nxs4DVIqwsIMQhLjAH7kuAt4ehuABIyqhg1ogJDb7hr
	R4m7uUjF36eI/kiOnciekLCF/Cw==
X-Google-Smtp-Source: AGHT+IEVLKpwtAeY8CFtUlWhbfiqMY3UWRySzIhFHhUhOwoOExUhPZJGh1YVLT+dyfycqIzQ3V27mZQsYhDymtXxBJk=
X-Received: by 2002:ac2:5f19:0:b0:543:bb21:4256 with SMTP id
 2adb3069b0e04-543cf53b610mr143184e87.25.1737754047316; Fri, 24 Jan 2025
 13:27:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
In-Reply-To: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Jan 2025 15:27:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ_qP1ZNOzG+r+WC1O4CRM+Qd5G0J7SSJvDvtp+KntNpg@mail.gmail.com>
X-Gm-Features: AWEUYZlGtQBlaWYGZRnnF2NlEk9HJlJnY1psL2FB4thPSuxWsCXrcWxu8FJNUJg
Message-ID: <CAL_JsqJ_qP1ZNOzG+r+WC1O4CRM+Qd5G0J7SSJvDvtp+KntNpg@mail.gmail.com>
Subject: Re: [PATCH] memory: omap-gpmc: drop no compatible check
To: Roger Quadros <rogerq@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:36=E2=80=AFAM Roger Quadros <rogerq@kernel.org> =
wrote:
>
> We are no longer depending on legacy device trees so
> drop the no compatible check for NAND and OneNAND
> nodes.
>
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Ideally this can be picked up for 6.14 because the
of_property_read_bool() calls will generate a warning reading non-bool
property.

Rob

