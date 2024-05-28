Return-Path: <linux-omap+bounces-1409-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D492B8D20DA
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 17:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F192A1C210FD
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 15:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BAB171E7A;
	Tue, 28 May 2024 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM+cLA+w"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BF17167F;
	Tue, 28 May 2024 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716911631; cv=none; b=bf1CZ4Xwop0yMjE4wmD4rgiFFQJlZ7btktKqNg6jBRZd2WaGAgTA5EGvryixXC/qzVm+2bv4BocoT0DzBS3oT+kUh+Ds10t7KThA5cFM2Cmy4r/aVpaJmkKdBHUEyPpcc4xHbfo6z+hfu1ld5zqwmqAv5hvkxWm7H9xSKThZ/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716911631; c=relaxed/simple;
	bh=rVcl4oJmbxPg0GXfNHL3b9hvs7+krxPFeYYRdXrja94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4K0BSyUEYYGRRTOoiCchRb4KCQenbHN3jXrIRV1hpQoxEncSHQWK11ZfJnXtcZHjMJGfbAhqngonvJOqrWS6eBiENJXVzZDQbcLv6VEdomFKH7491eTpa96pQ+StJRrkpBLZaYl97INKMyONEsoxDvreAeoum+H4GmSXSojNQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM+cLA+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C4DC3277B;
	Tue, 28 May 2024 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716911630;
	bh=rVcl4oJmbxPg0GXfNHL3b9hvs7+krxPFeYYRdXrja94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM+cLA+wcCb28OGJL5tYm7gL089gzdouBVMNydNW0YMWRbh22yQBshHm8dcefmDNu
	 4NZIfrvY/NQS0toViyv70/Iz0+sSQtzGmbu0LuT0UzrzgPqAsGyUnFXVQxoqyB8kR3
	 Yh4llfiT3eO7bI1JL4IMRzlIuqDdcxWolnO1aiDHqYQ0AeeQ6dq5iyHMnMUnee0Xnr
	 bBh+0AN7Zt96ybXfxf+4LWAS1pCy7U8GlDqosCeA86g+P0PIYWF9Djk9K686nQ0qpa
	 kwiB5R+oy7jxNUdZxpgMx+tg23ELUbCjTzQIGiSWO7/y7y8/kkhyXoGZwyNNGfW9H+
	 UVlG3qQpk1EGA==
Date: Tue, 28 May 2024 16:53:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240528-mandarin-chevron-130406a65434@spud>
References: <20240528065756.1962482-1-andreas@kemnade.info>
 <e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
 <20240528131622.4b4f8d03@aktux>
 <f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
 <20240528150647.40385d08@aktux>
 <3a29c775-4131-4047-9777-4146e6c8eed0@kernel.org>
 <20240528-unimpeded-dealing-0128abb54272@spud>
 <20240528174849.6945343a@aktux>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NaW3yDTJm5rP3IEB"
Content-Disposition: inline
In-Reply-To: <20240528174849.6945343a@aktux>


--NaW3yDTJm5rP3IEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 05:48:49PM +0200, Andreas Kemnade wrote:
> On Tue, 28 May 2024 15:36:40 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, May 28, 2024 at 03:54:05PM +0200, Krzysztof Kozlowski wrote:
> > > On 28/05/2024 15:06, Andreas Kemnade wrote: =20
> > > > On Tue, 28 May 2024 13:25:29 +0200
> > > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >  =20
> > > >> On 28/05/2024 13:16, Andreas Kemnade wrote: =20
> > > >>> On Tue, 28 May 2024 12:04:22 +0200
> > > >>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >>>    =20
> > > >>>> On 28/05/2024 08:57, Andreas Kemnade wrote:   =20
> > > >>>>> Convert the regulator bindings to yaml files. To allow only the=
 regulator
> > > >>>>> compatible corresponding to the toplevel mfd compatible, split =
the file
> > > >>>>> into one per device.
> > > >>>>>
> > > >>>>> To not need to allow any subnode name, specify clearly node nam=
es
> > > >>>>> for all the regulators.
> > > >>>>>
> > > >>>>> Drop one twl5030 compatible due to no documentation on mfd side=
 and no
> > > >>>>> users of the twl5030.
> > > >>>>>
> > > >>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > >>>>> ---
> > > >>>>> Reason for being RFC:
> > > >>>>> the integration into ti,twl.yaml seems not to work as expected
> > > >>>>> make dt_binding_check crashes without any clear error message
> > > >>>>> if used on the ti,twl.yaml
> > > >>>>>
> > > >>>>>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
> > > >>>>>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++=
++++++++
> > > >>>>>  .../regulator/ti,twl6030-regulator.yaml       | 292 ++++++++++=
+++
> > > >>>>>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
> > > >>>>>  .../bindings/regulator/twl-regulator.txt      |  80 ----
> > > >>>>>  5 files changed, 935 insertions(+), 81 deletions(-)
> > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator=
/ti,twl4030-regulator.yaml
> > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator=
/ti,twl6030-regulator.yaml
> > > >>>>>  create mode 100644 Documentation/devicetree/bindings/regulator=
/ti,twl6032-regulator.yaml
> > > >>>>>  delete mode 100644 Documentation/devicetree/bindings/regulator=
/twl-regulator.txt
> > > >>>>>
> > > >>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml =
b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > >>>>> index c2357fecb56cc..4ced6e471d338 100644
> > > >>>>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > >>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > > >>>>> @@ -50,7 +50,7 @@ allOf:
> > > >>>>>            properties:
> > > >>>>>              compatible:
> > > >>>>>                const: ti,twl4030-wdt
> > > >>>>> -
> > > >>>>> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml    =
 =20
> > > >>>>
> > > >>>> That's not needed, just like othehr refs below.
> > > >>>>   =20
> > > >>> but how to prevent error messages like this:
> > > >>>
> > > >>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated p=
roperties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-va=
ux1', 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-v=
dac', 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regula=
tor-vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regul=
ator-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'reg=
ulator-vusb1v8', 'regulator-vusb3v1
> > > >>>
> > > >>> esp. the regulator parts without adding stuff to ti,twl.yaml?   =
=20
> > > >>
> > > >> Eh? That's a watchdog, not regulator. Why do you add ref to regula=
tor?
> > > >> =20
> > > > hmm, wrongly indented? At what level doet it belong? But as the reg=
ualor.yaml stuff can
> > > > be shortened, maybe just add it directly to ti,twl.yaml to avoid th=
at trouble. =20
> > >=20
> > > I don't follow. The diff here and in other two places suggest you add
> > > twl-regulator reference to wdt/gpio/whatnot nodes, not to regulators.=
 =20
> >=20
> > The diff may look like that, but I think they're just trying to add it
> > as a subnode of the pmic. There are other nodes, like the madc that do
> > this in the same file:
> >         madc:
> >           type: object
> >           $ref: /schemas/iio/adc/ti,twl4030-madc.yaml
> >           unevaluatedProperties: false
> >=20
> > I guess this is what was being attempted, albeit incorrectly.
>=20
> correct. No regulators node, just everything directly as a subnode of
> the pmic. Well, I have now something using patternProperties directly itn=
 ti,twl.yaml
> including a more detailed example which does not upset dt_binding_check.
> I am running dtbs_check to check if anything is odd. the 4030 variant see=
ms
> to be ok, waiting for some dtbs containing 603X now.
>=20
> But somehow I would feel better if I would understand what was syntactica=
lly
> wrong with my original proposal. I have totally no idea yet.

If you want to create a child node, you can't just reference another
schema willy nilly. You need to create a property of type object, as was
done elsewhere in the file.

> The error message of dt_binding_check is also meaningless:
>  CHKDT   Documentation/devicetree/bindings
> Traceback (most recent call last):
>   File "/home/andi/.local/bin/dt-doc-validate", line 64, in <module>
>     ret |=3D check_doc(f)
>            ^^^^^^^^^^^^
>   File "/home/andi/.local/bin/dt-doc-validate", line 32, in check_doc
>     for error in sorted(dtsch.iter_errors(), key=3Dlambda e: e.linecol):
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/andi/.local/pipx/venvs/dtschema/lib/python3.11/site-package=
s/dtschema/schema.py", line 125, in iter_errors
>     self.annotate_error(scherr, meta_schema, scherr.schema_path)
>   File "/home/andi/.local/pipx/venvs/dtschema/lib/python3.11/site-package=
s/dtschema/schema.py", line 104, in annotate_error
>     schema =3D schema[p]
>              ~~~~~~^^^
> KeyError: 'type'
>   LINT    Documentation/devicetree/bindings
>=20
> IMHO this should be improved.

What I see with your patch applied is:
/stuff/linux-dt/Documentation/devicetree/bindings/mfd/ti,twl.yaml: ignoring=
, error in schema: allOf: 0: then: properties: $ref

Not a great error either, but not a crash like you see. What version of
dt-schema are you using?

--NaW3yDTJm5rP3IEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlX+CgAKCRB4tDGHoIJi
0qKLAQCGFtx/Ay5ysirhXyqQuy4I9psiS/2NviHEhlp1z8v3mQEAw5uThXMaN3vj
80ahgep6lSMNVQMa60qsYJ+unQQuFAs=
=r4Ir
-----END PGP SIGNATURE-----

--NaW3yDTJm5rP3IEB--

