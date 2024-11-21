Return-Path: <linux-omap+bounces-2716-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17739D4B62
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 12:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8837E282D3E
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 11:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D561D6DA9;
	Thu, 21 Nov 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="YHV7H3Dq";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="bqYSUkra"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBB1D5CF4;
	Thu, 21 Nov 2024 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187579; cv=pass; b=emtPltLHOsCfxhR7VXYoQqxN5M/ptRXXcWil5/fWtj9DHLTwm+c0nr18dFZHn9ewlrLrJsq+teMZB6wprBtDtwVANVNpUnSeSrWUHfW8GP1syvhbNXgpaveNFV9k2aB0si0UDQY6bfw4shGLI+jTV36dyK4R8iJmbUIepOhXx0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187579; c=relaxed/simple;
	bh=R+/l971YLd9Aagz44STYzttjwRWC+iqK2iD9IMoOBMk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=owN4ciYUjqXtOM+dBJYvSS9j3TxVuHihTplMkfd537XOWXN3EDirlL1KdPzVB1hdUu5CLUP65k804gF4PGEPwrUA+YdGpxrMm6zSbLONv5o0/B9J37NYhEixDd/1zmLAMPd4rqsmDN4k6R3dULvqz8EI0rIEVCfLZY+ERG4ogbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=YHV7H3Dq; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=bqYSUkra; arc=pass smtp.client-ip=81.169.146.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1732187554; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jRc8CW0PbGz/FApsrqgQlh/AmSBbOfeK1b8khPT+yRgwMg3esnrs2NpIcjWHneIoNc
    KTKUk9XvJUsXZSSnJNJkqBAmHkQAvToGoH51Ij03HCBrPxqQW2jJamXFXztm8/19eQly
    rHzseX90U/oDwdz7JNLE+DR67nvSdLIlAl71Dds7SX5U6V1zHKaMlKWyxzW4+o0qcX8j
    TcZno8ZVpD6p4C8TXu/PtoxXb217ScxzG4yi05wtdbtgVGqMPQtwkelYlwlXhn/6nqYh
    NvSfxQDT7PzJM8jMNCP7G6K8WngDmmH9XM0S06FJikoZAQ1VlT7VAbDLDu+QDUPj05PY
    5hxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1732187554;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H8jv4Bz0COThczsQr3K0nVbwT8CgDqOgd8gTMaz8Lso=;
    b=V58DnN5gTMl6+6P1Z63rPNgimOeD6Ew0KUwkOJnj3GaUcH8vuhRSsuBP+jLiZlZjQP
    A7ymq6S6/GMI4lJkGkJksiCBzoVB84QVlPI45KaAf1Hybpn8RXxkVZCutei0uzLxkag1
    +YWJFwjxWA2tDhtvELaok8ChmStyIKTKVIqgQ8S2DfzFYxXufFCOuj1CjLJZC2rzhcpu
    KEkkcHuYkV6TIzmWrknglPEsQIpO8c73h75cqDyqhxKxme21ZOGCX2t+j1fnzamh275C
    dfHbs2tUWfd7TjmQ9WG8iNUWvdoza0gZaHJ1k9DlhlNveg1Ad+PM6ANCLgZPkTNgI3i6
    wOqg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1732187554;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H8jv4Bz0COThczsQr3K0nVbwT8CgDqOgd8gTMaz8Lso=;
    b=YHV7H3Dq0rRuJ6NaQc0wp5FQdm9p52RoLafj07WcJsskdkBsFf7CKTC6n3Inelim/7
    DMEprPoJQENaLqLesen/RC9ynXMDvMpdd46zTtoO2GvxXByO46tbRsd9sCZbtfIhxfLg
    nfF31uWVA2PL7fRYgp6z+4j2zdZYXj6ocF2AU2G0cFGXgA2qXxbPWiYKPMVlvT5XnpWn
    5IwE72j3wzWhJJZoWoMIDibQ+1oh9hpVxY5E2e7wXAKlcZyJUeeAiyu1yDoAfHgIZ0Ft
    xQXrA3OFi7cQOZhWKNLFjr0TsvP4b/DnRiz4n38vmOB7xC1o2LVrx97MWQLsD/2MPlb2
    53gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1732187554;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H8jv4Bz0COThczsQr3K0nVbwT8CgDqOgd8gTMaz8Lso=;
    b=bqYSUkraH0YYATKNVuCRmsP8dczAP/jBLAyJJnc34rcmSjSkaZD3qRGVAj0AuYUkPm
    Kqd/GmQvdbFUSX+4dgAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfz8Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
    with ESMTPSA id Qb7e400ALBCYt1S
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 21 Nov 2024 12:12:34 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] media: staging: drop omap4iss
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <56DA96A4-6CD5-4BB8-9C02-B8B764266DF9@goldelico.com>
Date: Thu, 21 Nov 2024 12:12:23 +0100
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F9B886B-2109-46E6-9F11-FFDAEF5BBDE6@goldelico.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
 <20241118200025.3daab676@akair>
 <20241119070222.GX31681@pendragon.ideasonboard.com>
 <20241120085406.4d864c6e@akair>
 <20241120083938.GP12409@pendragon.ideasonboard.com>
 <20241121112750.3f5d4d2c@akair>
 <56DA96A4-6CD5-4BB8-9C02-B8B764266DF9@goldelico.com>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51.11.1)


> Am 21.11.2024 um 11:52 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Seems to be a 30 pin and called J17. Schematics fortunately
> shows pin assignment of an up to 4 lane CSI camera:
>=20
> =
https://web.archive.org/web/20161024203005/http://pandaboard.org/sites/def=
ault/files/board_reference/pandaboard-es-b/panda-es-b-schematic.pdf
>=20
> And there are some gpios for control.

I just had the inspiration to look into the OMAP5 EVM schematics.

It has a connector J2 with the same pin assignment for a camera module.
Just using a diffferent FREFCLK number and different gpios.

Therefore, a camera for the Panda(ES) should also work on the OMAP5 EVM.
AFAIK the ISS hardware and required driver is also the same betweeen
omap4 and omap5.

> But no documentation about the connector or the adapter board for a

Well, in the EVM schematics it is marked "111-1003200" and I could not
find that. But the reference guide (SWCU130) says:

	Samtec TFM-115-32-S-D-A

This looks from a photo like the one populated on the OMAP5 EVM.

So we at least know now, which connector to add to a PandaBoard.

BR,
Nikolaus=

