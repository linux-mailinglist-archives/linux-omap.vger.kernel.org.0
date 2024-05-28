Return-Path: <linux-omap+bounces-1403-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6D8D193E
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 13:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C491C2123D
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 11:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1170016C68D;
	Tue, 28 May 2024 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="VtSWMyWz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E038F9C;
	Tue, 28 May 2024 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716894989; cv=none; b=Mowim6EGLIDR7UHhmBjdnbJKQVfcHj14nfh0F9ikjBaFfd7euEeg1E+u5GNVg1UyoF8srWWLV1OECldxaMUzrt6rErLVxWKTRobu1jhAdieuTBMmbKryf6W9ahPxyarZ6EwA26sGnRcAY8R+0s/TDuBOXJtOJz8iGoZzr5jTlig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716894989; c=relaxed/simple;
	bh=ddjKtq7RFYMNYFg22zslRU3jdlC10pSzFW4Bsm3Q9kc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ndjKeIT1NMtoJI+/2eBYSKJzXLHpydVMCUUOb7C2kvSO/Jl/RtOzjS/4AmoEkC8/msBnH5+jFU0io0jHwEfzRlBXV8hqmtWU+AA4N9TiMZk0K8oBpf7NeJbXdOYDE4ncXYTkN/0Jl2FKufrhWLrjsu2pxf+IR7bXlab/UtXd27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=VtSWMyWz; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBuoa-00873f-0r;
	Tue, 28 May 2024 13:16:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JrfHFnuvkrvmQFg0pUCXychWxb4GoBRV6FZ978Cui2Y=; b=VtSWMyWzUVFTf8Bzaqej9wUJjV
	ZA9BIHF1lJ8+8C/S6Np8/OO2UUvWdqHSd9QVbOlM55ralWqTlJjgkVxt8vOx5SW9P9w263DkGUGtS
	CVo6kOzZiH8xVfoE6t7tmbBA/zYMBsCRxevy7V+FqHIusHt2M/ju7rVvdDg7PR8elGoB9vKiDk0Fi
	pZuvRSHNFzb2Ux79UIdFnZW3DXBfxWdtLy/dGM1aamSZZnCZjGeEtkG98CJafdpKU2Iiyp+DZWc0Q
	5CjqvaTPCBlwJxuL1e5d0VDn0Rpou97ERJswXyYws+06taKJyhigm+08m6Kp9SzW8UriiAkUPWKFb
	W8G3+eGA==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBuoZ-001tdQ-20;
	Tue, 28 May 2024 13:16:24 +0200
Date: Tue, 28 May 2024 13:16:22 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240528131622.4b4f8d03@aktux>
In-Reply-To: <e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
References: <20240528065756.1962482-1-andreas@kemnade.info>
	<e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 May 2024 12:04:22 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 28/05/2024 08:57, Andreas Kemnade wrote:
> > Convert the regulator bindings to yaml files. To allow only the regulator
> > compatible corresponding to the toplevel mfd compatible, split the file
> > into one per device.
> > 
> > To not need to allow any subnode name, specify clearly node names
> > for all the regulators.
> > 
> > Drop one twl5030 compatible due to no documentation on mfd side and no
> > users of the twl5030.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > Reason for being RFC:
> > the integration into ti,twl.yaml seems not to work as expected
> > make dt_binding_check crashes without any clear error message
> > if used on the ti,twl.yaml
> > 
> >  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
> >  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
> >  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
> >  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
> >  .../bindings/regulator/twl-regulator.txt      |  80 ----
> >  5 files changed, 935 insertions(+), 81 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> >  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
> >  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > index c2357fecb56cc..4ced6e471d338 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> > @@ -50,7 +50,7 @@ allOf:
> >            properties:
> >              compatible:
> >                const: ti,twl4030-wdt
> > -
> > +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml  
> 
> That's not needed, just like othehr refs below.
> 
but how to prevent error messages like this:

arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-vaux1', 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-vdac', 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regulator-vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regulator-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'regulator-vusb1v8', 'regulator-vusb3v1

esp. the regulator parts without adding stuff to ti,twl.yaml?

> >    - if:
> >        properties:
> >          compatible:
> > @@ -63,6 +63,7 @@ allOf:
> >            properties:
> >              compatible:
> >                const: ti,twl6030-gpadc
> > +        $ref: /schemas/regulator/ti,twl6030-regulator.yaml
> >    - if:
> >        properties:
> >          compatible:
> > @@ -75,6 +76,7 @@ allOf:
> >            properties:
> >              compatible:
> >                const: ti,twl6032-gpadc
> > +        $ref: /schemas/regulator/ti,twl6032-regulator.yaml
> >    
> 
> >  properties:
> >    compatible:
> > diff --git a/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> > new file mode 100644
> > index 0000000000000..9623c110605ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> > @@ -0,0 +1,402 @@
> > +# SPDX-License-Identifier: (GPL-2.0)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/ti,twl4030-regulator.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Regulators in the TWL4030 PMIC
> > +
> > +maintainers:
> > +  - Andreas Kemnade <andreas@kemnade.info>
> > +
> > +properties:
> > +  regulator-vaux1:
> > +    type: object
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      compatible:
> > +        const: "ti,twl4030-vaux1"  
> 
> No quotes
> 
Ack.

> > +
> > +      regulator-initial-mode:
> > +        items:
> > +          - items:
> > +              enum:
> > +                - 0x08 # Sleep mode, the nominal output voltage is maintained
> > +                       # with low power consumption with low load current capability
> > +                - 0x0e # Active mode, the regulator can deliver its nominal output
> > +                       # voltage with full-load current capability
> > +
> > +    required:
> > +      - compatible
> > +
> > +  regulator-vaux2:
> > +    type: object
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      compatible:
> > +        const: "ti,twl4030-vaux2"
> > +
> > +      regulator-initial-mode:
> > +        items:
> > +          - items:
> > +              enum:
> > +                - 0x08 # Sleep mode, the nominal output voltage is maintained
> > +                       # with low power consumption with low load current capability
> > +                - 0x0e # Active mode, the regulator can deliver its nominal output
> > +                       # voltage with full-load current capability  
> 
> These entries are the same. Just use patternProperties and enum for
> compatible.
> 
hmm, if I am using that, how do I prevent e.g. constructions like this to be
valid?

regulator-vaux2 {
	compatible = "ti,twl4030-vaux1";
};

Regards,
Andreas

