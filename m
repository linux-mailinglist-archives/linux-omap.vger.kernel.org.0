Return-Path: <linux-omap+bounces-2083-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C70969DB5
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ACFBB20FFD
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 12:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7B31C9877;
	Tue,  3 Sep 2024 12:36:22 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DD1B12F0;
	Tue,  3 Sep 2024 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366982; cv=none; b=jdrKsASXa18qmTdbk3/33PX7++1W/0E3qlUDaC7J/9XixtvTjSJ3uXRsrYTNcOXYNtuGdMU+j4sKFzVL1EFmCNgCcQKFC/YmfXAkgNQwuyGAmmACI2YHRZEdoa+5dokZBnfdjqXYOQ0zE4qvGn3PNwucOYUMevBBQkrkpReXTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366982; c=relaxed/simple;
	bh=VLe6vHkqT90rZjvQcK84gw7GxLp4oEh85M9yKzsADDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7Jo1r56xIMdv7uZvycVW5L8VpUJBRbxMby3Bna3rb30JvSuCzkizCxJ6kKFRTlrd0jkWxThdA4gqUC18ekcQYhYRrydOwS2hi/m6fMRHKfW8e4kqwZyKnZ3FdSJD392HG0xpkgy5AuSTPfM0JQxr+EH7geK9kduCp/9yGDazUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a9b40f6b3so2771347276.1;
        Tue, 03 Sep 2024 05:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725366979; x=1725971779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI1uWdcdsr4vubsYZfhfHSLOg/2H7wlcxIqSYGZS5w8=;
        b=rONSGZb7FY9ppCO5U47DHpJgbDlpp1o8hZZpDy4B6oGuiskKucY4wtto46OCJBL1fT
         IyHwhk/9SbAmfiTwBqgPYXeL4oDeR0uFjvFgnJ9RQkaROiRTtLP+I15LRjRAzpDomdQh
         ruPjdK6wgKCty68/KpXsQMJgfGCKSXy2bKAeQp/ZRAa1c9SbCU9InUmiwS3w3clRYiYl
         QRhsmUKBuz/rmlSDQQxYZJqsZDGQBEmrh5acSQYbLU577veZJDZjPac/+n/hpaN8pFsu
         +P7h45lbPXyhAJeX7X8re7df0lAY9FOsCZy9YadgJ0dQuYs48W3D+ldTVvlsKP9mI76f
         l2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf2AutztbnG9Av6z6jSe3/ft1oIDTfW+BT0OB87R1EjZcx30/Vq/0L8eu2TaGchsMLMdILNM/++f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmBXH9QFc1chLDYVHDVpriW5W8vMwgri6axeGlwZ3veqkjuPzs
	FUFm0IkXsoMqfizxdTHsm8QR6XAtDg92mCnF5WRUEUTRAt2Jaesm2GZ2/pUu
X-Google-Smtp-Source: AGHT+IGDFn7MENyQmBi2ZW4D1QCf77LWEvPefmDCeT7y0G0afH8BkauHYgX64Pq0Wlkx4/S/INFuCQ==
X-Received: by 2002:a05:6902:c06:b0:e11:7a26:36d with SMTP id 3f1490d57ef6-e1a7a002f5amr15990092276.13.1725366978746;
        Tue, 03 Sep 2024 05:36:18 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a626f83fasm2220193276.55.2024.09.03.05.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 05:36:18 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so15976387b3.0;
        Tue, 03 Sep 2024 05:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJpTAGzywVu2Ij8rxgCnBhzPqKEg255lVNmD1zSx2yfarsOdNtEJpt8QRPYSy8gIk/qbjZh55FYI0=@vger.kernel.org
X-Received: by 2002:a05:690c:110:b0:6ae:6c9b:378d with SMTP id
 00721157ae682-6d4109bb92dmr131026457b3.31.1725366978405; Tue, 03 Sep 2024
 05:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603234139.280629b2@aktux> <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
In-Reply-To: <20240903143357.2532258b@akair>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Sep 2024 14:36:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
Message-ID: <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
Subject: Re: clk mess on omap4460 with mpu clock
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, Sep 3, 2024 at 2:34=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
> Am Mon, 2 Sep 2024 15:53:07 +0200
> schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> > On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade
> > <andreas@kemnade.info> wrote:
> > > just stumbled across this on 6.10-rc1:
> > >
> > > [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is
> > > greater than 24 [    1.483154] ti-sysc ocp:target-module@48210000:
> > > could not add child clock fck: -12
> >
> > And on boneblack:
> >
> > 48000000.interconnect:segment@200000:target-module@0:mpu@0:fck: device
> > ID is greater than 24
> > target-module@4b000000:target-module@140000:pmu@0:fck: device ID is
> > greater than 24
> >
> > > Maybe
> > >         /*
> > >          * Use clkdev_add() instead of clkdev_alloc() to avoid the
> > > MAX_DEV_ID
> > >          * limit for clk_get(). If cl ever needs to be freed, it
> > > should be done
> > >          * with clkdev_drop().
> > >          */
> > > in ti-sysc.c does not work anymore?
> > >
> > > The offending clock definition is in omap4.dtsi
> > >
> > > clocks =3D <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> > >
> > > Did not bisect that yet.
> >
> > Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings when
> > creating clkdev entries") in v6.10-rc1, with follow-up commit
> > 616501eccb58615f ("clkdev: don't fail clkdev_alloc() if over-sized")
> > in v6.10-rc4.
> >
> > I have no idea if these clkdev registrations are still necessary/used.
> >
> well, it might explain some mystery behavior in the past. Lets
> see where it comes from. As the comment says, there should be a
> workaround against that limitation. So the problem should not be there
> in the first place. I have some strange problems with
> clk_disable_unused.
>
> I first thought it is a id < 24 issue and not a strlen(something) < 24.

Me too :-(

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

