Return-Path: <linux-omap+bounces-4628-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A7B52DA7
	for <lists+linux-omap@lfdr.de>; Thu, 11 Sep 2025 11:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AB51163709
	for <lists+linux-omap@lfdr.de>; Thu, 11 Sep 2025 09:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBB52EAB79;
	Thu, 11 Sep 2025 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxosJhHf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28902E8DFF
	for <linux-omap@vger.kernel.org>; Thu, 11 Sep 2025 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757584219; cv=none; b=pdaFBC4KNq967A1buJChJFmkFbSwbtilTUOxmmTxvyD3/CaziZf8slbEzeE8Xg6zzsxT7bV+JM+4aTkgkU08R7d31P2TNuP28Y/PIo8SGzKzwlYGi09lWz2n0cCxBFS+ACUs/Q2QGnGBWxDiwPi383UQhNf0x6AelmP/bDqvJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757584219; c=relaxed/simple;
	bh=I2mAuNAWpA4CXYyRv4L1JrJBlRZdLJ3+HIroxofPWtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djmIRl0DajMSLLNuXIMMU+oZAJGu+KMrFiRt91HQ2LsLcnibnATNAWm4zVIyYni5dzHlAYMZYQz2AT8HLTXCeFUM3Q7jQRrA/xY7V6Bj7U+Roiq4KKM8u9HFlT2Mrtdk12rfaN/Hih/dSzh7c0eT98Kn5Yylgq/f4x2gXUJWzJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxosJhHf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445826fd9dso6159465ad.3
        for <linux-omap@vger.kernel.org>; Thu, 11 Sep 2025 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757584217; x=1758189017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM8m3A/WORgRLBVKtapiYGsj57OrgF0zShq0IHwFP18=;
        b=kxosJhHfSl6ckhhj7UAiMsmBnGr/br/1L37YXC6RtJEp7NsmKFRkR1wlbSf5kbxA2h
         8Gzf5jpooQyQN5ilC74yBxuBLDC+QnO39aLdTdiXLVjYEB9G5NrFIqcF5I2oK9IoRVSs
         ld3/qSudPHeHHk6cstLCDitOEMGFPKAHZ8AVZqdyt3suWLlGB6BdW2TSoRzXpeQJq7jm
         Adwmjk8tssiJjf+5xiWlZ0M6Qtlju4ClV1x04Tk+ZlacXJUKi+WIVGYrQwQjN6FQSlSw
         jtknRuNDSkTxOb11AtiGPOwQAuRW0K1mjhtUP2inioLIxuaWA63CqsUSY36P0qx6iuxE
         eWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757584217; x=1758189017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM8m3A/WORgRLBVKtapiYGsj57OrgF0zShq0IHwFP18=;
        b=sFubjbN0zpQReukaoTdGhdRmE5LNTLjBC9aaUq/DpKk/xcK6g6Ro6c/k2to/koshxj
         g0doScE7T0WMrNPODDqjH67Ni/ozeK7kxVUWNVVAmPwsnfjFgN7g5OFcizkwEBgnVyIN
         wjrkRzVaR6CX8bLuI7O16LnGBaBX4RpKh3Or+TbdWxsfRq5MUcSNMAPBhFHp3b1E0ej8
         k3k1IoQow4bizuT2q+zIaHSHvF03VeHVqhLvrHwQS2St9jRSTwe3k1ovAAHXVrnqTbpa
         uzO7AoRBD9h4A12SlDcz2HaNalYL1Hc+DWwQuT+c20d6Vx6aTayKohHtMxCFXoW/lQoP
         VcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvzgHUiiPtScwmLeSH/oJK5yzjjT43OP0vCvBGM+lWyzMnS4wdb2A28To5YtbTPdbR+aq/kz5HSfx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fJ5yyi/AuxwaLVLJneIIpv/MGQ7J8+C+TcbNZwguWjzllOJX
	soGUsIa2YSCUuHB8I9ZZs641nSg1Qgy+z7HIMe+AGDRKaM5Q6BZFo+8dT7vJE7ZUm1mTejD5r/O
	7s6ZrYdian4yqoRSEa/byajIjo4bIudTrRdwMbw==
X-Gm-Gg: ASbGncvJZXz4JOzTrOC2XTTP9otswYdwxL5Hg4euTQ5cdsk3XJNYUL1zVpwbHi/2UHN
	nQMgJfQQnKC7j0LUBuIDqbVWLy5EARXKyt+6/7km19lJGQN0fuOxgnhxbJ4TBTxDWWB0Z5BQ8Nd
	3zleDmFKLfTiT2aUVfT+fs9WGHVig9rwBR8OWpRzhKdnC337+b+bNuUVNCKhc/ljaJ0+AsZB5bh
	sGiAWk=
X-Google-Smtp-Source: AGHT+IEBmgIN8y37day1fHQTsYlRnKNk+ippWXmTT2HrserdbQaq2AVuWWzBeCg6JNXtus8ev42dc3GzvLMJo+zz9qA=
X-Received: by 2002:a17:902:ec8e:b0:24c:d33d:418e with SMTP id
 d9443c01a7336-2516ef57cdfmr269642205ad.1.1757584217162; Thu, 11 Sep 2025
 02:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910160704.115565-1-jihed.chaibi.dev@gmail.com>
 <20250911-dainty-penguin-of-fragrance-9b4cef@kuoka> <20250911084323.357caec2@akair>
 <8a8f3589-482c-467c-8a13-199c51e0331a@kernel.org>
In-Reply-To: <8a8f3589-482c-467c-8a13-199c51e0331a@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 11 Sep 2025 11:50:05 +0200
X-Gm-Features: Ac12FXzDahEquaYeXVEfztGaEk3INHCZrXHNe94GxMS3IoKFdye46FBH1ftGQ1o
Message-ID: <CANBuOYprmtSd6wuQur-bmaXHncogiOngNxAn7pkTcgf2dAOVWA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] dt-bindings: mfd: twl: Consolidate and fix TI TWL
 family bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
Cc: lee@kernel.org, krzk+dt@kernel.org, tony@atomide.com, robh@kernel.org, 
	conor+dt@kernel.org, ukleinek@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 9:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2025 08:43, Andreas Kemnade wrote:
> > Am Thu, 11 Sep 2025 08:35:32 +0200
> > schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> >
> >> On Wed, Sep 10, 2025 at 06:07:01PM +0200, Jihed Chaibi wrote:
> >>> This version addresses a final piece of feedback from Andreas to make
> >>> the twl4030/twl6030-specific child nodes (audio, usb, keypad etc.)
> >>> conditional by moving them out of the common block, which now only
> >>> contains common properties (rtc, charger, pwm, pwmled..) ensuring
> >>> the schema is fully accurate.
> >>>
> >>> The complete dtbs_check for this binding is clean except for two
> >>> warnings originating from pre-existing bugs in the OMAP DTS files,
> >>> for which fixes have already been submitted separately [1][2].
> >>>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>> Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> >>>
> >>> ---
> >>> Changes in v7:
> >>>   - (1/3): Moved twl4030/twl6030-specific child node definitions (aud=
io,
> >>>     usb etc.) into the conditional 'if/then' block to improve schema
> >>>     accuracy.
> >>
> >> Who asked for this? It's wrong code.
> >>
> > maybe I was not clear there. That was not was I meant. As far as I
> > understand, the correct pattern is to define things outside of the
> > if/then block and
> > then disable it with property-name: false in the if/then block
> > Example: Handling of regulator-initial-mode property.
>
> Yes, I read your comment afterwards and that is how I would understand
> it as well.
>
> But the patch here is done differently.
>
>
> Best regards,
> Krzysztof

Hi Krzysztof, Andreas,

Thank you for the clarification. my apologies, I
misunderstood the correct pattern.

I was following the existing structure in the original yaml
file, where several board-specific sub-nodes like 'madc',
'pwrbutton', and 'gpadc' etc. were already defined inside
the 'if/then' blocks. I assumed that was the correct
convention and that the main properties block was only
for shared nodes (like 'regulator' & 'pwm'..) which is
not the case.

I had (mis)interpreted Krzysztof's earlier feedback about
top-level definitions as applying only to properties
that were common to all variants (like 'pwm').

I will send a v8 implementing this "define then disable"
pattern for all sub-nodes. This will be a good
opportunity to clean up the pre-existing definitions
to make the entire binding fully consistent.

Thanks,
Jihed

