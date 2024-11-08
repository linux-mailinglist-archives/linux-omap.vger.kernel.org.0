Return-Path: <linux-omap+bounces-2623-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D49C202F
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 16:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6D21F240D9
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 15:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9F01F4FD0;
	Fri,  8 Nov 2024 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJ4CSb0L"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A83BBF2;
	Fri,  8 Nov 2024 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731078941; cv=none; b=irhUXILQsbmmtQnonGbcbTMeCvgaBE1PD/qMeE/dYOwGMQMBHA+46YTVXJsEjPiPoP3HqgD+azICMwPJUzMQVHh27z20g6lRObJ7EgXMYqF6Yt29lUydbSob+nxKV1IxgUXYl9Pi22wXeLH8y/CEizSWReoXzxtLlbRbpm8xYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731078941; c=relaxed/simple;
	bh=5FwFOuDuitCiZ+Sajot442PnEZOqqnhPuv/3cpuWwUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uClmTvhQWW7LGZE0lyZjIUF1jdLGEJmApyOdErZtmL6TKYzJNvnlroUINpewLTaJuuFIcikmiVKviucFmjRGq1uB351VXC3sE8TAT+SVl5WGLATdaJ7pGfjllGzB1IQk461o6XKSaEzsd/S3iKj0VGCgyvum6odKcsqsjVLEZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJ4CSb0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36821C4CED3;
	Fri,  8 Nov 2024 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078941;
	bh=5FwFOuDuitCiZ+Sajot442PnEZOqqnhPuv/3cpuWwUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cJ4CSb0L7zq8awyxq09fAD+b3UgKtbxcjmjNvvpz1H7cnB49rxu8MtBTJAZKhlA8B
	 WZyAIDHZFABopF2om9Ba4qoah6LJYbiSsbix9yKzWuX6CclP1DpVeKt9ZPkU6sKhsr
	 zJMcrxD8wmOXlCy+UnHbYRX9oOqviU98gIwkAnHKzeKeKSqVVGJ8gruPGmVjqOzbvF
	 Zi0HWfl5a4pcDKlec1BMp5piok8ztiCt6jVpVSNyQafBgheu7eS/040S+jBP3ls53p
	 ull160O+4R+nhx4vpWq95Mx1K7Jj2as+GXPn2TPOLP/TJ8Ph72rANmCRnWu6MPNqhI
	 7Ts/CmE9SesJA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea85f7f445so25118077b3.0;
        Fri, 08 Nov 2024 07:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZplWIAiuTqwZpMpzkgOiM17p5nZIgS38wmqqTI5wbn7ZqgR9rWYIYI7i5hGW9an59EGsDBBvnV1POTw==@vger.kernel.org, AJvYcCVFdBQo2KM8gHu8ujXYcaXaU/O2voqr1oWKTggyBaK+rIxmRcnCz3bqC2d0qlJB5bkqbIUZx9die6fdsATo@vger.kernel.org, AJvYcCWQSCA8AjaT6NnXyEwPyzt+UlTAjCW9N8EiTAhr2UEk+st3pjevVrwW9Z1f74afdiqlBgcqk4/MAE0x@vger.kernel.org, AJvYcCXWUdILelB7/Les0yxmGL0vwlzbf9F0bi/vCeuLteScILGPdQyfDvAlBsxTrV0/jHWWPKU9sEY0PXRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7NQdbyaDy0KzFuj997OzDkQ72qXIlfsskndUqRzruSGOx2OD
	6tF0piLsAxSck464jvYEKVaWmo+J2fT+YidZXuCSaRFgoSW3XIjdwv/+tw2RTGww0mbXtrLJ32Y
	VC3B0GWncwnyeSUce8hJXn07hig==
X-Google-Smtp-Source: AGHT+IFWPLItkR0CKo9t9eccKdqmCcV3sKAlatVSed4q4C7UdVb2RSSJ2aCLgyZJu3A0U66K8eNYh+Y1MMUdnkFd3z4=
X-Received: by 2002:a05:690c:6413:b0:6e3:14b0:ff86 with SMTP id
 00721157ae682-6eadde5b02fmr36416977b3.27.1731078940333; Fri, 08 Nov 2024
 07:15:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104135549.38486-1-andreas@kemnade.info> <20241105135234.GA3100411-robh@kernel.org>
 <20241107075803.2cf33ab4@akair> <36b61684-fede-4422-bd54-0421e6a0fc23@kernel.org>
 <20241108144800.ks7owznyt4fpcdap@thrive>
In-Reply-To: <20241108144800.ks7owznyt4fpcdap@thrive>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 09:15:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJx+4372DmG0TLAneL3=C6+bUTq-vJ_OkJh4md8zOaMOA@mail.gmail.com>
Message-ID: <CAL_JsqJx+4372DmG0TLAneL3=C6+bUTq-vJ_OkJh4md8zOaMOA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
To: Nishanth Menon <nm@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Tero Kristo <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 8:48=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 15:03-20241108, Roger Quadros wrote:
> > >>> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> > >>> new file mode 100644
> > >>> index 000000000000..b271ab86dde1
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> > >>> @@ -0,0 +1,123 @@
> > >>> +# SPDX-License-Identifier: GPL-2.0-only
> > >>
> > >> Surely TI as the only author of the original binding would agree to
> > >> dual-license this?
> > >>
> > > So there is a question mark. So you are waiting for some confirmation
> > > form TI?
> >
> > TI code uses below license clause. So better to stick to that.
> >
> > # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> Just my 2 cents:
>
> Just to be clear, as a corporate, as TI contributor we have approval for =
the
> following two:
>
> For new stuff:  GPL-2.0-only OR MIT
> for legacy stuff, we had GPL-2.0-only.

New kernel drivers would be GPL-2.0-only...

And based on this, TI can't contribute any new bindings.

>
> There are indeed instances of community contributions with
> GPL-2.0-only OR BSD-2-Clause, but that is definitely something community
> is free to do. Looking at history of
> Documentation/devicetree/bindings/clock/ti/mux.txt, I believe, at least
> from TI perspective, we are fine with GPL-2.0-only OR MIT and I think it
> will let other s/w ecosystems consume the same as well.

The choice for bindings are:

GPL-2.0-only
GPL-2.0-only OR BSD-2-Clause

MIT would be fine, but I just don't want proliferation of different
variations. See the .dts licenses for an example of that.

For this case, I would suggest going with GPL-2.0-only. It would be
nice to have blanket permission from TI to dual license any DT
bindings. I have this from several companies. It really only matters
for common bindings that we want to move out of the kernel though.

Rob

