Return-Path: <linux-omap+bounces-118-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46B8041B1
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 23:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3AB1F21354
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 22:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858F33BB52;
	Mon,  4 Dec 2023 22:27:38 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D4285;
	Mon,  4 Dec 2023 14:27:34 -0800 (PST)
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rAHPS-0071Vx-0b; Mon, 04 Dec 2023 23:27:26 +0100
Date: Mon, 4 Dec 2023 23:27:22 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Adam Ford <aford173@gmail.com>
Cc: lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ARM: dts: omap: gta04: standardize
 system-power-controller
Message-ID: <20231204232722.031f618c@aktux>
In-Reply-To: <CAHCN7xKG6-vgnJ+mA8xt0aFK-jCBWOX-GkVmJGNERH43N0ikaw@mail.gmail.com>
References: <20231203222903.343711-1-andreas@kemnade.info>
	<20231203222903.343711-7-andreas@kemnade.info>
	<CAHCN7xKG6-vgnJ+mA8xt0aFK-jCBWOX-GkVmJGNERH43N0ikaw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Dec 2023 16:46:20 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Sun, Dec 3, 2023 at 4:29=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> >
> > Replace TI-specific property by generic one.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > cannot be applied independently of the other ones, so maybe simply delay
> > it.
> >
> >  arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot=
/dts/ti/omap/omap3-gta04.dtsi
> > index 3661340009e7a..5001c4ea35658 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > @@ -476,6 +476,7 @@ twl: twl@48 {
> >                 reg =3D <0x48>;
> >                 interrupts =3D <7>; /* SYS_NIRQ cascaded to intc */
> >                 interrupt-parent =3D <&intc>;
> > +               system-power-controller; =20
>=20
> Could this go into the twl4030.dtsi file so we don't have every omap3
> board with this part duplicating this line?
>=20
Well, that is a board-specific issue, so I do not think it belongs there,
although quite common to have the twl4030 as the system-power-controller.

Regards,
Andreas

