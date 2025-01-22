Return-Path: <linux-omap+bounces-3179-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54EA19A0B
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 21:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0BC188B767
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 20:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A711C462D;
	Wed, 22 Jan 2025 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeOGJ1HV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5711EB2F;
	Wed, 22 Jan 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737579408; cv=none; b=naU75wZrN9N+AX6ecZbAyclhIE6HcoElHYgL4NiYmtdGMcrZ1duEYoxaBs3jflbZv+Gwyx6e0lTHg2JRwtaCBWmjg9bpyXNXu0okbK/cxEG3+dCZZgO4aqFxu/FR96BZMZVOV5/ZVR0SXUbsn6tbQub42ucPx+Cbx3/enSp8bvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737579408; c=relaxed/simple;
	bh=ADIjjEdWwJRxc+fhduGqjYA3ehL/T4TU2NRAkwIk+Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMVn+chfLlCsPlUwAnByxzSVi2U+bFZnvT1Fjdbov+DbUAT+zmA4c/Fd85XvYrscejy1r9jFsnpDH/u/MqhW856jIsjhWWgiOas9vMimfksRZZjZbi3XzLj+zmFxtYRVnFqWc6N0aRdE2NpUGZyKHTx801ui0+61VDBtnkB5HvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeOGJ1HV; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so270702276.3;
        Wed, 22 Jan 2025 12:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737579405; x=1738184205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADIjjEdWwJRxc+fhduGqjYA3ehL/T4TU2NRAkwIk+Jc=;
        b=DeOGJ1HVDP3CJeNkPkosv/GU6TzStb3JzT0vxIRAjsvJVSVPkiqqRh7JwER7/D1BQ1
         BRloYr+iBP1KJ4iJxgN9eDc6MUOCxZ9suKTRa+suqYPJ4kTwNCnIRltiFoyN7lbb3VDD
         pUkFQe+MiowYlagZb6Wo0etk9EZJQFsiforVQzuf0/twQQvwifqoE/7xbC4QWb0uXONX
         olUOy/9nIK9zMeqkBM8ou++tjIY8WmUXpsJy6cMrUDHWt80gVfzQ+VCpNNrgbK6bjJXY
         +jO9O1DzjUM1XdXM13S3SvBHvqIWgzW3QOfh78RFO6fRAcqOuHNvQZj/rXIDnW2xsZuO
         yyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737579405; x=1738184205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADIjjEdWwJRxc+fhduGqjYA3ehL/T4TU2NRAkwIk+Jc=;
        b=Tb7FnAkzOyRlad+lyhCEyo4Q3iIvIJQB3FqvLXD7XVxolpp6aI9jXrhkx/txwZia7t
         XcX17jBUXxjXk8bJu2tSVKgwcnoD9yuUIZ0TMKIA6RX0LxqXYIbIE7GX7LdJY46/XgmI
         5506Jn5s8Xe5VANol7ys/h/r31XarEdckKamXxGi4sbg7cx5YPLbLBwLxx3rdLqephVj
         yBDwOIVYAQ8TSjAa0YDs9jydsnja+f3h1kZ77zrP03B0jtUqbSNqbg7c1C5mOoRwayOn
         ZT4Y1ZB90y4xKZ5tMrZ0/FPBkDLRbwMK/dhHkmVltB8DPX+WVXL8yK2Ft5JujnZ+4Q3r
         CO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo4+74DJgY9egbve89u2i9SSWZw136cHt8bxQCUWMWy67JsNaogjSxhbEaL2gvrWPvJLQHGNKadtHtRPWx@vger.kernel.org, AJvYcCVOlEFZwJI+LQZi4VmhOSdRVt88phwUqEjxEaHPRLkBPMn4TyXcuhnJr1see6bUx5Sq9Xj0Kg47Ibheog==@vger.kernel.org, AJvYcCWaXP+3aSuQFp0/J8GgBSgRN9u8N7Sr+BcyPCMTRPdE5XFXQi0yU9qidqfsLKhZBuLzmwEBsvn82gI4@vger.kernel.org
X-Gm-Message-State: AOJu0YzvgZO8Aw1oU7jmxius+rMNVG4C12gM1qQW8198Xf/mDO2iojk4
	bAX6Rrp4oQ5Z9eQ4HoHyHoR5CK9l0b+ipe7vTxe5YpngfIJVOohqTdPGZ4XgiWY5a/7BicvNxPg
	1ob+d5Vryha2ybanERZS+w1d2LH4=
X-Gm-Gg: ASbGncs9FxxpLn9Yzs7+6zSNmbWuYX2cu7+HFMcm7BZ7rAQkAbXY9wrugtqtyh797Gy
	ETLRcU9QC/e46TTSyvcy23iQfoS3zzkLR0C4O+hkX5bB3L0pAqy+J
X-Google-Smtp-Source: AGHT+IGnmx6aTHIOGq5vYhfK057jeF1y7iuldLvp+qQ37D0M4b6pdComdhO8F8tFXq+wBVrk4laFTPQFfX0P/N1YZK8=
X-Received: by 2002:a05:690c:c8f:b0:6ef:aae1:ac51 with SMTP id
 00721157ae682-6f6eb92ef79mr196333997b3.27.1737579405438; Wed, 22 Jan 2025
 12:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200749.4131923-1-trini@konsulko.com> <7hmsfjn5mm.fsf@baylibre.com>
 <20250122000824.GJ3476@bill-the-cat> <20250122214604.79e1e829@akair>
In-Reply-To: <20250122214604.79e1e829@akair>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 22 Jan 2025 14:56:19 -0600
X-Gm-Features: AWEUYZlHAw_1O6NCzi8X7G_aVVuo0ADL86UBA7NvIsY_nHKv-h927H8zq4mKnc8
Message-ID: <CAOCHtYj3LumO4pViSOyTwjNxvG1E-DX=JA0-m4Usi1qL+jw21g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tom Rini <trini@konsulko.com>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:46=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> Hi,
>
> Am Tue, 21 Jan 2025 18:08:24 -0600
> schrieb Tom Rini <trini@konsulko.com>:
>
> > > If keeping it is just this binding update, then I'd say we keep it, b=
ut
> > > if it gets any more paninful to maintain, I'm also not going to argue
> > > very hard to keep it.
> >
> > I'm not in the position to see if any of the Pandaboards work at this
> > point, so I don't know if they're otherwise functional or a huge pile o=
f
> > problems.
>
> I am still testing stuff with pandaboards. But I do not have the a4
> one. So yes they are functional. Compared with other devices still in
> use using the same SoC, here you can play around with everything, know
> the device. so it is a reference for keeping the really interesting
> devices working.
>
> Regarding the a4: I think it is better to keep that one in, just that
> nobody gets confused if he/she digs out his panda board for some
> comparison test and uses a wrong board revision.

Do you want an a4? I could dig one or two out! ;)

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

