Return-Path: <linux-omap+bounces-3925-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E2AE1009
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 01:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C83166216
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 23:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96A225F98E;
	Thu, 19 Jun 2025 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob9gFYHG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135830E826;
	Thu, 19 Jun 2025 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750375483; cv=none; b=f59nDEBzzvfLHRM8YaL2aW1bIxCsGirrK3cW7BOX8vn8hVjOOfO/h4SwKLVg88EnAMnNmvZV2FOLt87WuAeyEwgdNB2/SeAl0ZpEC16VngBrk77X/TzPzQcD7dDquvYjMq1Kdo3WmGdhLey2RytTTktWfYbRXnlSkj43wI56o4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750375483; c=relaxed/simple;
	bh=P6UTvzyqIRK6Pq+WtTLmPHSdW9ZmxbUT07Raf3BFBeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHwyFTszjZGTQg3BzoBkUASnaDsuo/YgGwR3vq7jKMmW/Xr1dqVTtl38KKxWJVtufhs9Zb4SIRIOJHDJ36rLsQLI7ZNkxfdaTrDdGHrd+xP71Jyx9tkEssWm/9gj+7arzo89tpYD+6k9qt3Ti05StAWSz/wNNnzVy7xBXkgKc1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob9gFYHG; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31befde0a0so753044a12.0;
        Thu, 19 Jun 2025 16:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750375481; x=1750980281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZFGef6VU9cQVWTB1kif0wHpBB4PBFRRB0Anrm0cDew=;
        b=Ob9gFYHGuGiUN4xtxHpIBpRupJD044GsQTuo5FeybMSVl4O465CJGfzQdoGdJbYpHF
         s97XjIQJIDgimTzkN8TQdVyQ2IqP6RQDt64hd3oc9O/h5Q+FukO0VMTs8JAEj91bJD3v
         q8PCoHHjH2yHbPiPbZIncboTxt9XhnGKLY/S5SIzdG0z9L4RDGkxz89JCp4LoOgNdV8j
         P0NSBFXyKcWIA5k8kZIGBGTfbLxtHuf0QVLzaNTaHmkRgiCx4WiCGiw/1Uf3VpPc3WMw
         s2MR/B0ZCKO8TsUyL6XYEOeEA24OGAidF1qvjSBV0nMCkdLQ9NFML//oyuMkDj4Haiu0
         7wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750375481; x=1750980281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZFGef6VU9cQVWTB1kif0wHpBB4PBFRRB0Anrm0cDew=;
        b=jvA22N1oGBpSxS4RbcDB0nyhyJig/4StX5pFCDnqGIJS7ZV1VR8S0PWrC6/r8/cf5k
         tS3ONwp7jwOBanXLXJK3cCtX1IyDmnOeKU2YQrLs6isV9HGo7f9MUyckXNzm7KMeaIfQ
         S5lqX+sKvv5jN2n9PUfpMakXwluAr3trlTjKXFBw5Djjg1tH6A3+n3f+oUU3C1+Ne7jA
         Z3vD+C/7D+SZcMfJW3zq9pbg1bx7NluC0M/RXMv5p1mLNo37jl6pw0yqcKm/rWBR/uPy
         a1bvyQdU4vLs9QmHZ4dcmxjaDxzIeu7W/qvqK217hEuhZS0VOwyQUbrQjhOm2vcmjsrr
         dk+g==
X-Forwarded-Encrypted: i=1; AJvYcCU6EPm8Ky/iAMnmUgA7U6i8Xl7N0Zlv/KfgnojaGFSOVRt0yIQRXuEVZnydYqbvN7CD54usNvt5QUXdPCk=@vger.kernel.org, AJvYcCWaRjoccPipTT2Lw3BHgCgdyleI4DDIejtALpJ/jUoTyPt/BFopgkCaMIPdIwV3dbMT5Lsp3nxUToA9gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15ErWXwPmP33PeglPodII5DgSPik5g1Rwv9rbbw6QqKXHF3EA
	hwyRVKlS/kEe2KerGvnqXiVGhJ6f39uxDAF9L+UetiCH5v3xUIaU3EY04U9MHwX+gx+/7Ido8OO
	CjPNh4EMc6YVWChAtUMChDiiVrYPHVro=
X-Gm-Gg: ASbGnctEl5CLix4jVcmFwYFyOCwPS9we/g/wsBuuiCvuC9wk6FemJ4oArs6GC/jbQio
	TZQfYwymuTHl0bKE2nE+uhqrb4AMQ0zrOAHuCdnHH8DveI6UIXq8j6l79EM4t2LqQNc049G+Yy+
	r3ToRtMPKN0v3I8YCxLXt489HVGh+bo81QdvywMp0Jv0ld
X-Google-Smtp-Source: AGHT+IFo69CsTIz4zdjs3pH9+mSsnTCOc0elUjv0zJrcMu+OWWjlOCX579S3pnKcn6XvhD1V09Z7Yz5swv3bQeNU5DY=
X-Received: by 2002:a17:90b:574d:b0:311:a561:86f3 with SMTP id
 98e67ed59e1d1-3159d626107mr1276057a91.6.1750375480922; Thu, 19 Jun 2025
 16:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619153526.297398-1-d-gole@ti.com> <c04c4bef-2773-41f7-b2e6-ea465cb9f164@ti.com>
In-Reply-To: <c04c4bef-2773-41f7-b2e6-ea465cb9f164@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 19 Jun 2025 18:24:13 -0500
X-Gm-Features: AX0GCFsCFmvr1ko0Eirl_thlUz1P67i4l72iU7s8SzxDsIZRteoaPfVZZXkUXws
Message-ID: <CAOCHtYhjSnypDcd5iojg_0KM9aBX6QH+0hMfauGccL6MvyLXzg@mail.gmail.com>
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator Support"
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Dhruva Gole <d-gole@ti.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 2:58=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti=
.com> wrote:
>
> Hi,
>
> On 6/19/25 10:35 AM, Dhruva Gole wrote:
> > This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.
>
> I will be sending a patch soon with a fix regarding the devm_kmalloc use =
in the probe() function.
> I'll keep looking into these bugs to see if there's anything else to fix.
>
> > This was causing boot regressions [1] on many BeagleBoard platforms
> > like the AM62x based BeaglePlay and PocketBeagle-2.
> >
> > [1] https://gist.github.com/DhruvaG2000/75b7d5ced6c09d508ee0ad5ab1f1970=
7

This bug is nasty... ugh! My BeaglePlay (am62) just triggered the same
classic bug on startup.  Seems like it's related to the phase of the
moon/etc.. Something in the PMIC doesn't like what we are doing with
the new devices bolted on top..

Here is my boot log with only f1471bc435afa31c8c0c58551922830dc8f4b06b
reverted https://gist.github.com/RobertCNelson/745bc4f9e219be264722b2093ef0=
3fa8

So there's been 4 patches on "tps65219-regulator.c" :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/driv=
ers/regulator/tps65219-regulator.c?h=3Dv6.16-rc2

f1471bc435afa31c8c0c58551922830dc8f4b06b regulator: tps65219: Add TI
TPS65214 Regulator Support
38c9f98db20a649a1f8454f507608b6aef0c9297 regulator: tps65219: Add
support for TPS65215 Regulator IRQs
3f2e457efdad5af4164f155bd7ac902258a9b1ce regulator: tps65219: Add
support for TPS65215 regulator resources
8c04144e156b49980a786e80c855e41f6c71685c regulator: tps65219: Update
struct names

Back to retesting the 3 other commits tomorrow!

Fun note... I'm testing 4 PocketBeagle2 's and 2 BeaglePlays,
depending on the day one board will trigger this bug 80% of the time,
someday it takes hours to trigger.

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

