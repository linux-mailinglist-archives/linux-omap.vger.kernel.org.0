Return-Path: <linux-omap+bounces-1407-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E78D1EF8
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 16:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9981F23D62
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 14:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985116F91C;
	Tue, 28 May 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3xNdJbv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814216DEC6;
	Tue, 28 May 2024 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716907005; cv=none; b=VSE85lmsxlGUtYUlch1nUQSxFeCMFSI00Wo9geCN5RTF84R4cl/3pqYLA3wH+b8tIIQTWxv9DozTUAg8V/9U8YCByFeXnXx4UTFu1rOsn+c3nnDOS+1Ryukf44yFqh34aM/aJvkfXYc92yeVNX/sxaP7J/1V2VOtr+CRIpa1X3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716907005; c=relaxed/simple;
	bh=BSUmfVdSlgpymoA4HoMBGd+tj1luXASp3mrYAsdGrnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyJdHEkl0p4pffwAQjACer+ymCEWHN9cRlhKbTii0N58TT5E7fscsK6X+mKbj582RCIU6wCa2fmPmVwAk01yxCrEdJ6071PUEQkPJQ/ytKUDPLp2IFjThXEumVC2KwUH/5w6KaKL1A5cePAPyEXROxKbBCphBCmUdrJXJ/m/I78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3xNdJbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3014C3277B;
	Tue, 28 May 2024 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716907005;
	bh=BSUmfVdSlgpymoA4HoMBGd+tj1luXASp3mrYAsdGrnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3xNdJbv6rn57nzTaPgvOWM8OPbYYmqDJcpJPRVgElmo1w6L0Nx3R59DAEIzhgSmz
	 ODXYs65o6j0U0sY3e6mR/ThLjK85OM06jF23DPz+k0Rgv/wJIp81qDT804X7IOg/ku
	 7H5Xg1r3q1v4nqFFIL+uQBZCuq5WeMSUyR0ATZTm69Ze/Q9xPU1tO+rPSSqnK4E0hr
	 6HWnjV887O24nYk4xKHeHwUIpl52rzuXaXAZgfdJihi2LdK2+38uKPadRsF4Og8QUd
	 kWBPidxILOZFEdcSS3vFmgiUXff7QC4oVxtk3GBXe0twlk4w6WR03RF/FkqRuKl+4X
	 BySOFyDuyxaIQ==
Date: Tue, 28 May 2024 15:36:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240528-unimpeded-dealing-0128abb54272@spud>
References: <20240528065756.1962482-1-andreas@kemnade.info>
 <e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
 <20240528131622.4b4f8d03@aktux>
 <f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
 <20240528150647.40385d08@aktux>
 <3a29c775-4131-4047-9777-4146e6c8eed0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yUj0T/sqf3gA9NuE"
Content-Disposition: inline
In-Reply-To: <3a29c775-4131-4047-9777-4146e6c8eed0@kernel.org>


--yUj0T/sqf3gA9NuE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 03:54:05PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2024 15:06, Andreas Kemnade wrote:
> > On Tue, 28 May 2024 13:25:29 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >=20
> >> On 28/05/2024 13:16, Andreas Kemnade wrote:
> >>> On Tue, 28 May 2024 12:04:22 +0200
> >>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>  =20
> >>>> On 28/05/2024 08:57, Andreas Kemnade wrote: =20
> >>>>> Convert the regulator bindings to yaml files. To allow only the reg=
ulator
> >>>>> compatible corresponding to the toplevel mfd compatible, split the =
file
> >>>>> into one per device.
> >>>>>
> >>>>> To not need to allow any subnode name, specify clearly node names
> >>>>> for all the regulators.
> >>>>>
> >>>>> Drop one twl5030 compatible due to no documentation on mfd side and=
 no
> >>>>> users of the twl5030.
> >>>>>
> >>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >>>>> ---
> >>>>> Reason for being RFC:
> >>>>> the integration into ti,twl.yaml seems not to work as expected
> >>>>> make dt_binding_check crashes without any clear error message
> >>>>> if used on the ti,twl.yaml
> >>>>>
> >>>>>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
> >>>>>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++=
++++
> >>>>>  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
> >>>>>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
> >>>>>  .../bindings/regulator/twl-regulator.txt      |  80 ----
> >>>>>  5 files changed, 935 insertions(+), 81 deletions(-)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,=
twl4030-regulator.yaml
> >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,=
twl6030-regulator.yaml
> >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,=
twl6032-regulator.yaml
> >>>>>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl=
-regulator.txt
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl.yaml
> >>>>> index c2357fecb56cc..4ced6e471d338 100644
> >>>>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>>>> @@ -50,7 +50,7 @@ allOf:
> >>>>>            properties:
> >>>>>              compatible:
> >>>>>                const: ti,twl4030-wdt
> >>>>> -
> >>>>> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml   =20
> >>>>
> >>>> That's not needed, just like othehr refs below.
> >>>> =20
> >>> but how to prevent error messages like this:
> >>>
> >>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated prope=
rties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-vaux1'=
, 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-vdac'=
, 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regulator-=
vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regulator=
-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'regulat=
or-vusb1v8', 'regulator-vusb3v1
> >>>
> >>> esp. the regulator parts without adding stuff to ti,twl.yaml? =20
> >>
> >> Eh? That's a watchdog, not regulator. Why do you add ref to regulator?
> >>
> > hmm, wrongly indented? At what level doet it belong? But as the regualo=
r.yaml stuff can
> > be shortened, maybe just add it directly to ti,twl.yaml to avoid that t=
rouble.
>=20
> I don't follow. The diff here and in other two places suggest you add
> twl-regulator reference to wdt/gpio/whatnot nodes, not to regulators.

The diff may look like that, but I think they're just trying to add it
as a subnode of the pmic. There are other nodes, like the madc that do
this in the same file:
        madc:
          type: object
          $ref: /schemas/iio/adc/ti,twl4030-madc.yaml
          unevaluatedProperties: false

I guess this is what was being attempted, albeit incorrectly.

--yUj0T/sqf3gA9NuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXr+AAKCRB4tDGHoIJi
0j9uAQC3pwdHQucNm0SqQ0bnTS8kgNAy9mN+8gAmir3pxWrQhwD+PUYyBa08fTN7
WpInMAQB537+Ja8D4ucMVXAXbvr7VgY=
=V9s5
-----END PGP SIGNATURE-----

--yUj0T/sqf3gA9NuE--

