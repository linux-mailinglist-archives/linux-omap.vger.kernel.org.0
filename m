Return-Path: <linux-omap+bounces-2946-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B6A000BC
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 22:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76ED162ACC
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 21:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5BB1B6D18;
	Thu,  2 Jan 2025 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvdu+8pg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A941B413B
	for <linux-omap@vger.kernel.org>; Thu,  2 Jan 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853726; cv=none; b=TJckolS7F+nr4adsluj9pq6OWOxPthqN0OJjNBU2YbcamcIHnje8i7XB4Fa6RXHXjVHMXjiaWbaQE84O+pm07oW3OezR6w1HIG+Y9TT/OX+LdBaCnP2gvj354ETlPmeOE9VeBl+njo5rtjFMAg9LXlsEu1WvDUrAWaeLd80Xn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853726; c=relaxed/simple;
	bh=E6DaV3IZrDPnnadN8Xljm9wVHk82uqq751+Xy8e6S+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nE2WHQ3CopM+jTgHFkouBceDdWQvM60n0sNMHpGcYfB+RPlU9ejZBuwwbo4Iyqf80kC8avEKy17vodU4d83l5eZtpnFE6VZbVE88/1fYIl0P0ior6qxCbv8tT+BQhThNsyYh67qn1z6Ayob5NP8cl9hxmUXDLBvEANmjW1reL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvdu+8pg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401c52000fso12032247e87.2
        for <linux-omap@vger.kernel.org>; Thu, 02 Jan 2025 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853723; x=1736458523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6DaV3IZrDPnnadN8Xljm9wVHk82uqq751+Xy8e6S+A=;
        b=pvdu+8pgrCTDJR29qPaUYh9Vssr6FB+tQgsQARBjAVPb8bpmO9VCwkVZayqd5gx8Wd
         tzlNWrEBi8QjwDLKTsQ2yGROp4mkGVDEvvh6nf+IeCDtkPV7Jb0kHzg7ckC7Q8OiIj8C
         /SSYwmSvsxDz/09Sr2gXuk5Y7NtNF/hJmc6Jt9mZIFdsUv7+efnQZcmpZse4WVZ+oEUz
         4a8UE/xohDsQami1PHSSYhuqWEFn2W0oZ9KnWl0zpxq6vyv6dsrA4jQb3WBQoIjmqyXQ
         2qypvhjhB5N8OqTTdSFUBO8OluGoS1uWXMtiYs8x3/Wxwtu45FRBfhk9jOk3Zhu1X3LU
         nUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853723; x=1736458523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6DaV3IZrDPnnadN8Xljm9wVHk82uqq751+Xy8e6S+A=;
        b=DyeO9pY3FUSiepol8mgKi5ZAeWtHIzJ0DjnA+8VLtAHnivSXj+UwjM+qSQoEdyYGeT
         LPyry5m2H00D+Ni4hFc12utGf45LitHtMMGrTsoNUkMVdsShJB0m5LR2b7t7D2iGZUPf
         KJZhCLTzEz2nQAsiSVr24o0gIsNNuf5NDrF1PPlsbPPkikyKwd8v6ZIdS8zjUK3dzqPh
         B2SZuckbiDX8tjLzpmlVHBouYvoHpuNycCu3HQf7yDrbbY6ir6zCDLhON26plCT4Ovvz
         fFEvHh+Z5r9UtLKJJ2nlly/tZbE5Tev9QHoXisF2pul9vfvXBouqHxEk4TcsiBxQ3Gjp
         4gZg==
X-Forwarded-Encrypted: i=1; AJvYcCXZo0bUctmKve8i21noTCUelTEe7y9AL9cz5pLZkTd49ftvAgIxSZ/uPkoff3ADNVrHHR6D/bU5oNb5@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDS6MB2ZVhsddD9U7mP7HpPP9LKno1UlhUfgcBF98endROR1k
	iUF8fN9gT5RJ/SqdpKJ3MShkFhdJwaxY1U3+B/mJ5aqTIq3ZsxvkLCYeQ75L7R2emFydcA7LAFj
	2VDfRZym0R9S8vD6STEmjqJcPM8Vg0Knh+A6K0g==
X-Gm-Gg: ASbGnct0Z6mbpuHAIw8ExcWTZCz6zc8alU6KkAUY5oRh9cOXPkXT15w1Esbqz9rO5oh
	edBP36euhybutNfkgZsoiA3sGsaBjKiXTWbUt
X-Google-Smtp-Source: AGHT+IHZBCUatPqs5AYE38EjJJ6UAil93weLZMgcG2CM6a2nGWmNRRPY8uLI/U/VPFasxFGFMEpVYDt9L0/zq2Ij0wU=
X-Received: by 2002:ac2:4c47:0:b0:542:22a0:9b35 with SMTP id
 2adb3069b0e04-5422959cf96mr14072029e87.53.1735853723102; Thu, 02 Jan 2025
 13:35:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
In-Reply-To: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:35:11 +0100
Message-ID: <CACRpkdYGqcV=CWu38D=U97aWKWAEeU236AEFu-hM_WkS4t9wnw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input/omap1: fix touchscreen functionality on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Helge Deller <deller@gmx.de>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:20=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> This series restores the ads7846 touchscreen functionality on Nokia 770
> (and maybe on some other older boards using half-duplex SPI). While the
> performance might not be optimal, it's again possible to control the devi=
ce
> using the screen, for testing/development purposes at least.

I'm pretty impressed that you're able to keep the device running!

I actually have one of these devices. Is there some documentation
somewhere of how to e.g. mount a serial port and get it flashed
with the latest stuff needed to boot a mainline kernel?

Yours,
Linus Walleij

