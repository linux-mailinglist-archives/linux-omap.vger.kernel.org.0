Return-Path: <linux-omap+bounces-600-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A15855C7B
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 09:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F18A6281376
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 08:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76968828;
	Thu, 15 Feb 2024 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vKwC6cNZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF117EF
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985905; cv=none; b=WA0o/2LRUrEndEn6B/bTbW6UAi2k+x0BAyr+C7SoFe2QJFUkB2LKirc1kpj6pz6WqW0CdTzxjQoCafQbxkwlwTVOZoXYOGRhpI+nLk9MHI8CmF3lKKdLe8JyvZFoxJGZmrvdArfI0i4U+LDsFohZHLog8a+tEg8NF6k6l5h5yc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985905; c=relaxed/simple;
	bh=mdYToYuDmh6OlwRD6Ej97k/1spumBy4m+atUuj+qy98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oD+o+c8pxolLMwKdv5yjoWMeAz+IrLuEXLYK4n8A5AWww0IQQtVWSZavDMB6feQUBwHBVs3KEnxDlNTBFDJi9SBrIH/2L80bTy6cxwwVjA3r+iKb0jWE2xv8WV4t72wlCHV+CSeElWPsdkSNYalHh0TUbNILks7ce2Q/sl0r/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=vKwC6cNZ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mdYToYuDmh6OlwRD6Ej97k/1spumBy4m+atUuj+qy98=; b=vKwC6cNZjEDmW0ViWp1hf3tqE9
	yo6U1M34Lj0sObd4osD1B7ykNVCDPgSw1bBmtIYRWlZcAhsxD4pgW/Mdf+p2vb6oEGb/7UwNj7sqs
	AJ2n6XTA7bPq164DfJpODrHHMuLwi4gwJaYLOLMAENs9TCTIxo08ySygVsDKeeZ26XxlaKo1UJmID
	NYtVT5GjUemWScsjCzCyfwUN7WdVg/ftxexJiFvP2tA2K9UBAWBRkoIpz0nx/gb5KXXrZkBUBmEKM
	B1ag33DesNwkdZse+VTfAZzwKerIhD46b22JpcIdkDlrmt8NErdiz4twj2s2CaOu+sLSBl+LGPF/D
	V5YG4V8g==;
Received: from p2003010777002c001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:2c00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1raX9I-009SKj-Ee; Thu, 15 Feb 2024 09:31:16 +0100
Date: Thu, 15 Feb 2024 09:31:13 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Dmitry Baryshkov" <dbaryshkov@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, paul.eggleton@linux.intel.com, "Andrea Adami"
 <andrea.adami@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>, "Peter
 Maydell" <peter.maydell@linaro.org>, "QEMU Developers"
 <qemu-devel@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>, "Aaro Koskinen"
 <aaro.koskinen@iki.fi>, "Janusz Krzysztofik" <jmkrzyszt@gmail.com>, "Tony
 Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik"
 <robert.jarzmik@free.fr>, "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <20240215093113.5c58cabe@aktux>
In-Reply-To: <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
	<fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
	<CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
	<7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
	<fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
	<CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
	<CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
	<be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Feb 2024 23:42:58 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
> > On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.org> =
wrote: =20
> >> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote: =20
> >> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote: =20
> >> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote: =20
> >>
> >> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
> >> modernize it a bit, and Russell helped out. I was under the impression
> >> that they only used real hardware though! =20
> >
> > I used both Qemu and actual hardware (having collie, poodle, tosa and
> > c860 that was easy).
> >
> > The biggest issue with Zaurus PDAs was that supporting interesting
> > parts of the platform (PCMCIA, companion chips) required almost
> > rebootstrapping of the corresponding drivers.
> > E.g. I had a separate driver for the LoCoMo chip which worked properly
> > with the DT systems.
> > PCMCIA was a huuuge trouble and it didn't play well at all. The driver
> > must be rewritten to use the component framework. =20
>=20
> If we want to actually go there, I think the best option for PCMCIA
> support is likely to replace the entire "soc_common" pcmcia driver
> with a simple drivers/pata/ storage driver and no support for
> other cards. There was a driver until commit 38943cbd25a2
> ("ata: remove palmld pata driver") that could serve as an
> template.
>=20
hmm, main usage for PCMCIA/CF in those devices was often something else,
not storage, at least on the IPAQ h2200. Wondering wether that road is
actually good. When I was mainly using those devices, I was not good in
mainlining things.
I loved that daylight-visible display.

Regards,
Andreas=20

