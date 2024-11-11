Return-Path: <linux-omap+bounces-2660-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13629C4714
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 21:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25721B2D6F3
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 20:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C175F1ACDE8;
	Mon, 11 Nov 2024 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtqK3ele"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F2145346;
	Mon, 11 Nov 2024 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731357051; cv=none; b=ZtqySZ+RFj08XKvoXcVOQ+hds8OVTg4CHYg8AoMMVi0y8aTNS5/DshO06yHlKctnxKDWbCupDI008O1bQHUjj5RLUdhonzPL2kA7W2UMYcx4nPYJqZ1RBxZcghi7Z1q5Ltd6soeEDEF7cX6jchfy0QA1qv8JHJ70LLT91R/wQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731357051; c=relaxed/simple;
	bh=WGz13CZe+VKZX/rdxUUf7kIQc8SZ1agbogHAyM7xm4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BblTsEpmKrYNrZ5GycK/MVrRkJfCckvKtcgq49aygWCt2fxm/GAFZVXGXQMrpOrBwXW3FkfFpz5Z8Umb66cXdH6XO3tY7y6WbsqVPFp+n5XRxvMHnU4rluAYYGRThPw13J3Jmd2uZHG0wZQaNpuYpusLLupGDifj6GrHMf9SmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtqK3ele; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94885C4CECF;
	Mon, 11 Nov 2024 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357050;
	bh=WGz13CZe+VKZX/rdxUUf7kIQc8SZ1agbogHAyM7xm4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtqK3eleeS+IR8r9f119Olaf76MrcX6pSyrNXS7x+FZjRQrGBdI9soR3JUiY492+H
	 P7PYLvi7POUG9LdFzYb3TBpgKGyPm6feJKnsuld5v1aZ89ZMVsx+5fw0TymPW7ojP1
	 KtkiN+ug3ki++x4OGIFscQ/WI5iHxEGZix81xjcONdhPCK/tPyp4nvXs1aUFu/hKGD
	 5dA+cWHj1XgIVX37ia1dg4SqKD0v2DLnKzlw4HumnZkPI8j/hpFlmXeQ9lD1PX6JlA
	 tIOE/o5nkkjNb3WyFZPnNqid9q1puKehdZooPyh9dNKPZOaWvr3yP1WFsFzGqRlfLi
	 MXXHt21tRZetg==
Date: Mon, 11 Nov 2024 20:30:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: ti: Convert mux.txt to json-schema
Message-ID: <20241111-finished-jinx-e810458a3381@spud>
References: <20241108231453.247660-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Trh0whuzKXWjCbWM"
Content-Disposition: inline
In-Reply-To: <20241108231453.247660-1-andreas@kemnade.info>


--Trh0whuzKXWjCbWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2024 at 12:14:53AM +0100, Andreas Kemnade wrote:
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml=
 b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> new file mode 100644
> index 000000000000..4a6f349ba2b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments mux clock
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description: |
> +  This clock assumes a register-mapped multiplexer with multiple inpt cl=
ock
> +  signals or parents, one of which can be selected as output. This clock=
 does
> +  not gate or adjust the parent rate via a divider or multiplier.
> +
> +  By default the "clocks" property lists the parents in the same order
> +  as they are programmed into the register.  E.g:
> +
> +    clocks =3D <&foo_clock>, <&bar_clock>, <&baz_clock>;
> +
> +  Results in programming the register as follows:
> +
> +  register value   selected parent clock
> +  0                foo_clock
> +  1                bar_clock
> +  2                baz_clock
> +
> +  Some clock controller IPs do not allow a value of zero to be programmed
> +  into the register, instead indexing begins at 1.  The optional property
> +  "index-starts-at-one" modified the scheme as follows:

Not your doing, but this is a crock. How is someone meant to know when
to use the property or not? Par for the course for ancient bindings I
guess..

> +
> +  register value   selected clock parent
> +  1                foo_clock
> +  2                bar_clock
> +  3                baz_clock
> +
> +  The binding must provide the register to control the mux. Optionally
> +  the number of bits to shift the control field in the register can be
> +  supplied. If the shift value is missing it is the same as supplying
> +  a zero shift.
> +  - |
> +    bus {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      clock-controller@110 {
> +        #clock-cells =3D <0>;
> +        compatible =3D "ti,mux-clock";
> +        clocks =3D <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_1680=
0000_ck>;
> +        reg =3D <0x0110>;
> +        ti,index-starts-at-one;
> +        ti,set-rate-parent;
> +      };
> +
> +      clock-controller@120 {
> +        #clock-cells =3D <0>;
> +        compatible =3D "ti,composite-mux-clock";
> +        clocks =3D <&core_96m_fck>, <&mcbsp_clks>;
> +        ti,bit-shift =3D <4>;
> +        reg =3D <0x0120>;

Ordering here should be compatible, reg, clock properties, vendor
properties.

With that,=20
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +      };
> +    };
> --=20
> 2.39.5
>=20

--Trh0whuzKXWjCbWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJpdgAKCRB4tDGHoIJi
0pRrAP9IAMMC4QQ1XmcaRQcIxjloiEmGeCoz/KUhen7MTd7ZcQD+O8dU04TD/eW1
EzJCZAsNA+kwHG4eR4aM+L8k5NoJzAo=
=VTPP
-----END PGP SIGNATURE-----

--Trh0whuzKXWjCbWM--

