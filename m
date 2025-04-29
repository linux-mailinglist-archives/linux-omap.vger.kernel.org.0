Return-Path: <linux-omap+bounces-3626-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AEEAA1B4E
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 21:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAA777B1895
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 19:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760DF25E47A;
	Tue, 29 Apr 2025 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="HwxktT6L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86347F477
	for <linux-omap@vger.kernel.org>; Tue, 29 Apr 2025 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954723; cv=none; b=VBzrfSs3zGAVBWnZMYcFW1pj4zMETWi1CwtPF/MCJVJI/D1tzQAXs1zmM9gO6fewDH217DQIF1rDwrWFI19QjkWuRSFJKfi9E04j/l5+F1s5DyOZelNpoGJuA9EaP7Le8eohR83g3AX6Z36GSy0sLVBDJ0SMvP0pW0iH8vSkXz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954723; c=relaxed/simple;
	bh=wQYgyO8cTCRZnnsbCH9cX9z79zt/5slmTEUOaPrK4W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRo4y9YNWELVCs/0VGh9ZYmrsjNn1wrONbd2lBvr9vfr+4aljI3oXi5GeXMWuAaM8Uhx0y+JPpkTgpCHrXZ+ItlRQnbaAGAvObkAdHpImNWv05WhvyR9K7yyITey11ybYXSjDnkJpgUOCGErnX/+8FuytB619S1sBKGO9yKkHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=HwxktT6L; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7387d4a334so643470276.2
        for <linux-omap@vger.kernel.org>; Tue, 29 Apr 2025 12:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1745954719; x=1746559519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/ifkoP2VzjSNVs4Xu0uRQ1iLvHQ3o12JsQMc2lGYGM=;
        b=HwxktT6Ll2Y2nntGRoqh71qvITTVcUnQ3FOKA9UsN7vKADajUmLO+49zUMvPjstHFw
         kl7tbuqrhtSTwvODBUMOCRCjlYzWCmXqhWwwjp92UF/DK5yjPv/qX/k1bEFWG8IjKRqz
         Hk63CKe/gulqhRywbXQY37anWtr99uhNUof5BNzREIfmI4yihYPlHDFWMeI/vnPzSDG0
         kyrsgD6GLeSrrZ9RLewKLm1sB5dtNyvZIfRNmZMC0eQJFDWNT0266m9xfQQpAh94p2JL
         NI41TZ0Lvy1wOqp/HGwGYVLqTD7eaNDlyjBK4905N+qwk5YOLXX1mWa5omki+jG+K0fI
         /OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954719; x=1746559519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/ifkoP2VzjSNVs4Xu0uRQ1iLvHQ3o12JsQMc2lGYGM=;
        b=oguzB8iuY2qYzZ+5+chU2Lq57GeRqM6uew/FZ0D7oHXYOyuNe8KoFQYX/ZonlctbL9
         4OEM842naBbM6eS0cJX0sEAOg4oyR4/ovXaLrZavbRaSgU3YeamRJcRn3UY3t8cDl8TX
         7VRXtGAFCbkfMX3vlROMcyIWQNUG3aDw8x21YFaWGqo7s9JmPi9TjPRuaYbP3yOGKtU2
         wOordAPFtx8coY/U6czEh+dmwll6qvjH/ccgNRq8n4rxwgyK71YKHSB8wegTBPT0rWfT
         WteZPOED6TkllQq3y4B7NRf5MRmqj8Y353Fyf2w/9wsXdtnZtxUwYU1fKg/KrGvF2xaI
         2oQg==
X-Forwarded-Encrypted: i=1; AJvYcCWM6Cc6bY0Cf5bMtMlNNFZ7QtxAlWvqlTmcroV0ItvYFhLeh9REvzL74dIKzrMO4jm11YGYZanqvc0v@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgAMcDVhjGDmbRfIb6pPogh020G//ZDvA9glSHigdvqbq9uMN
	PUgE9gJG58gWz/KdALcn1Kp/XtEGqvhcGahKT0qV8UFOLFuRS6Ybe1tOZyvLoiFSV8pPHlT+tyV
	/UT12CBjUdygDPCnhPPP5hWQvkwIHl73U5I0B
X-Gm-Gg: ASbGncuz31MGlwNIxEJ4yhZyiJab8TwK7gl2EvzwnQj+fX+DdtpEo2bMQlHQJxBygAQ
	a/utXKw8qEY+65aZXuYwpNBkMDIBL5081X3+OLQ0H8Or9P96SfAesNjWhFwaV03cKHq2Qa4aS4x
	Gz3XLFQ6HxSppnT/pTLIKN
X-Google-Smtp-Source: AGHT+IGqPxuLRzyJFjxrB+wKq9wOk//LyPTOPx3ptoig5goYUbeX82deJ4X6MbMth7FkOt7ItZfdyhmRh3usApwY78Q=
X-Received: by 2002:a05:6902:2808:b0:e73:117c:42cb with SMTP id
 3f1490d57ef6-e73ea2123bemr645377276.2.1745954719592; Tue, 29 Apr 2025
 12:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203315.71497-1-s-ramamoorthy@ti.com> <20250425203315.71497-4-s-ramamoorthy@ti.com>
 <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com> <683a1c36-0b5a-461f-bc89-3a418f542b57@ti.com>
In-Reply-To: <683a1c36-0b5a-461f-bc89-3a418f542b57@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Apr 2025 15:25:08 -0400
X-Gm-Features: ATxdqUFbxaBs_n6S4jW-r8vtMbiLr_Zi-oXCzuJN-ujmvmE10E7tbKFaoDyKPd4
Message-ID: <CADL8D3YwBOf6wPTgxjadsPPn3rLR16V7nAO39+7J=tNxk_hQDQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jerome Neanne <jneanne@baylibre.com>, m-leonard@ti.com, 
	praneeth@ti.com, jsava@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 12:42=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> Hi,
>
> On 4/28/2025 11:41 AM, Jonathan Cormier wrote:
> > On 4/25/25 4:33 PM, Shree Ramamoorthy wrote:

> >
> > However Jerome wanted GPIO to map to linux "GPIO 0".  Is this still
> > the case for TPS65215?
>
> In my attempt to combine TPS65214 (which originally had 1 GPO and 1 GPIO
> when I wrote the patch, but systems informed me they just switched it to
> 2 GPOs and 1 GPIO) & TPS65215 (2 GPOs and 1 GPIO), I made a mistake in
> combining the 2 series during rebase & with how similar the PMICs are.
> Thanks for reviewing this as I wrote it a cycle ago. I'll made the
> necessary changes & re-test. I will double check that GPIO matches to
> linux "GPIO 0" now that I have more context about the offset math (super
> helpful explanation!).


Thanks. Considering this confusion, could you add a comment for the
pin mappings? Something like:
// TPS65219 GPIO mapping
// Linux gpio 0 -> GPIO (pin16) -> offset 2
// Linux gpio 1 -> GPO1 (pin8 ) -> offset 0
// Linux gpio 2 -> GPO2 (pin17) -> offset 1




--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

