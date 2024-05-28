Return-Path: <linux-omap+bounces-1405-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC98D1C2B
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 15:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4ACD2871B6
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2024 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4E216E89B;
	Tue, 28 May 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kI8L7zdH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28416E861;
	Tue, 28 May 2024 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901617; cv=none; b=o2HikkPn+3db2bcdtu1KT9I3vS4O0R2GZMVMgDXDyDDqfT8lX2swUNXmodQcEcLrlP4IsafPRx/IVdx7XytFN7npZdMAQ9NR4/LbDlirNvjJL+Ea5lixx4HevF2YYK6WiGA34Mm09/z3dMu4YjEdHJZJ49aSDo/F3FVt5sCv6gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901617; c=relaxed/simple;
	bh=utVSBe8HGeV5of2U6uKa8+aOgpU3USN+ZyB6uToUwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8CEqdICMzLmIrXiVDVp2TotiYi3Tp/8ydOhtHB3mw0UIknT07MDdGI94OMNS5RY+F+hAxZ7RaU4KYeOTLyAtSMyC71zwnRjgtSMtx64mRUPzP78PFnpf8YIYIe7Es0dBayf0KUs21+xQM/DcwuKNQQXdmHDmF5da5fajp+TpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kI8L7zdH; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBwXR-0088Ad-2t;
	Tue, 28 May 2024 15:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ve5lf4ulbVDDjP82LWC3kCqjV08DISidZHyWfq6hIJo=; b=kI8L7zdH/0k2HZBYjU0i6QJVG4
	V4ojLUPQjcPChZDtM354J+HKFBfcjCrEdi4t7gzi/JlvvY9o1z1QNdwPImwyA8k20XcO3cyYev1IZ
	gScN0fvDWua3pGgisnl1sqR8tgA0h7g6Oiar/WXKs4jb88AjnEb+Lssgq/hXql71kF6RSFQh/59rd
	a9+V5iOd/1O3No6LKSUYAe6nVjIz/Y1EJjACN8Ivy6TgglkYdXQ1isxyV9EafPDFaZJ3SS/D0vU3x
	rDdB7wOvCxmJF4Wx1Z6we5+OyiaGw8cFIbMZc1triZjAz6A6skqdUSUg0p/zjp2MX5DLOB6dVU6Mg
	HgCDHRkw==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sBwXR-001tnD-0a;
	Tue, 28 May 2024 15:06:50 +0200
Date: Tue, 28 May 2024 15:06:47 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240528150647.40385d08@aktux>
In-Reply-To: <f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
References: <20240528065756.1962482-1-andreas@kemnade.info>
	<e497498c-f3da-4ab9-b6d4-f9723c10471c@kernel.org>
	<20240528131622.4b4f8d03@aktux>
	<f288a1c9-762c-4c66-8611-9a08d6c09bac@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 May 2024 13:25:29 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 28/05/2024 13:16, Andreas Kemnade wrote:
> > On Tue, 28 May 2024 12:04:22 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On 28/05/2024 08:57, Andreas Kemnade wrote:  
> >>> Convert the regulator bindings to yaml files. To allow only the regulator
> >>> compatible corresponding to the toplevel mfd compatible, split the file
> >>> into one per device.
> >>>
> >>> To not need to allow any subnode name, specify clearly node names
> >>> for all the regulators.
> >>>
> >>> Drop one twl5030 compatible due to no documentation on mfd side and no
> >>> users of the twl5030.
> >>>
> >>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >>> ---
> >>> Reason for being RFC:
> >>> the integration into ti,twl.yaml seems not to work as expected
> >>> make dt_binding_check crashes without any clear error message
> >>> if used on the ti,twl.yaml
> >>>
> >>>  .../devicetree/bindings/mfd/ti,twl.yaml       |   4 +-
> >>>  .../regulator/ti,twl4030-regulator.yaml       | 402 ++++++++++++++++++
> >>>  .../regulator/ti,twl6030-regulator.yaml       | 292 +++++++++++++
> >>>  .../regulator/ti,twl6032-regulator.yaml       | 238 +++++++++++
> >>>  .../bindings/regulator/twl-regulator.txt      |  80 ----
> >>>  5 files changed, 935 insertions(+), 81 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl4030-regulator.yaml
> >>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6030-regulator.yaml
> >>>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,twl6032-regulator.yaml
> >>>  delete mode 100644 Documentation/devicetree/bindings/regulator/twl-regulator.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> index c2357fecb56cc..4ced6e471d338 100644
> >>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
> >>> @@ -50,7 +50,7 @@ allOf:
> >>>            properties:
> >>>              compatible:
> >>>                const: ti,twl4030-wdt
> >>> -
> >>> +        $ref: /schemas/regulator/ti,twl4030-regulator.yaml    
> >>
> >> That's not needed, just like othehr refs below.
> >>  
> > but how to prevent error messages like this:
> > 
> > arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'regulator-vaux1', 'regulator-vaux2', 'regulator-vaux3', 'regulator-vaux4', 'regulator-vdac', 'regulator-vdd1', 'regulator-vintana1', 'regulator-vintana2', 'regulator-vintdig', 'regulator-vio', 'regulator-vmmc1', 'regulator-vmmc2', 'regulator-vpll1', 'regulator-vpll2', 'regulator-vsim', 'regulator-vusb1v5', 'regulator-vusb1v8', 'regulator-vusb3v1
> > 
> > esp. the regulator parts without adding stuff to ti,twl.yaml?  
> 
> Eh? That's a watchdog, not regulator. Why do you add ref to regulator?
> 
hmm, wrongly indented? At what level doet it belong? But as the regualor.yaml stuff can
be shortened, maybe just add it directly to ti,twl.yaml to avoid that trouble.

> ...
> 
> >>> +
> >>> +  regulator-vaux2:
> >>> +    type: object
> >>> +    $ref: regulator.yaml#
> >>> +    unevaluatedProperties: false
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: "ti,twl4030-vaux2"
> >>> +
> >>> +      regulator-initial-mode:
> >>> +        items:
> >>> +          - items:
> >>> +              enum:
> >>> +                - 0x08 # Sleep mode, the nominal output voltage is maintained
> >>> +                       # with low power consumption with low load current capability
> >>> +                - 0x0e # Active mode, the regulator can deliver its nominal output
> >>> +                       # voltage with full-load current capability    
> >>
> >> These entries are the same. Just use patternProperties and enum for
> >> compatible.
> >>  
> > hmm, if I am using that, how do I prevent e.g. constructions like this to be
> > valid?
> > 
> > regulator-vaux2 {
> > 	compatible = "ti,twl4030-vaux1";
> > };
> >   
> 
> Why would node name matter if you have compatible? The entire point of
> compatibles is to not to rely on node names.
> 
Hmm, even if we rely on them, it should somehow match what is inside that node
usually. We have @xx and reg=<xx>; e.g. So relax the stuff to allowing
any regulator-.* as node name independently of the contents?

And since that all is then shorter, maybe add stuff just directly to ti,twl.yaml?

Regards,
Andreas

